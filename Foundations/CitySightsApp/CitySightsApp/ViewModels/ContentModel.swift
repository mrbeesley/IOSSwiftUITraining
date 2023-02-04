//
//  ContentModel.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 1/29/23.
//

import Foundation
import CoreLocation

class ContentModel : NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    @Published var placemark: CLPlacemark?
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
    override init() {
        
        super.init()
        
        // Set content model as delegate for location manager
        locationManager.delegate = self
    }
    
    func requestGeoLocationPermission() {
        
        // request permission
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK: - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        // Update the authorizationState property
        authorizationState = locationManager.authorizationStatus
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // we have permision
            // start geolocating the user
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            // we don't have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // gives us the location
        let userLocation = locations.first
        
        if userLocation != nil {
            // we have a location
            // stop updating the location after we get it once
            locationManager.stopUpdatingLocation()
            
            // Get the placemark of the user
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(userLocation!) { (placemarks, error) in
                
                // check that there aren't errors
                if error == nil && placemarks != nil {
                    // take the first placemark
                    self.placemark = placemarks?.first
                }
                
            }
            
            // if we have the coordinates of the user, send into yelp api
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
        }
        
        
        
        // TODO: send coordinates to the yelp api
    }
    
    
    // MARK: - Yelp APi Methods
    
    func getBusinesses(category:String, location:CLLocation) {
        
        // Create URL
        /*
        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        let url = URL(string: urlString)
        */
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "10")
        ]
        if let url = urlComponents?.url {
            
            // Create URLRequest
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            // GET URL Session
            let session = URLSession.shared
            
            // Create Data Task
            let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
                
                // check that there isn't an error
                if error == nil {
                    
                    do {
                        // parse json
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        // sort businesses
                        var businesses = result.businesses
                        businesses.sort { (b1, b2) -> Bool in
                            return  b1.distance ?? 0 < b2.distance ?? 0
                        }
                        
                        // call the image function to download the businesses image
                        for business in businesses {
                            business.getImageData()
                        }
                        
                        // assign results
                        DispatchQueue.main.async {
                            
                            switch category {
                            case Constants.sightsKey:
                                self.sights = businesses
                            case Constants.restaurantsKey:
                                self.restaurants = businesses
                            default:
                                break
                            }
                        }
                        
                        
                    }
                    catch {
                        print(error)
                    }
                }
            })
            
            dataTask.resume()
            
            // Start the data task
        }
        
        
    }
}
