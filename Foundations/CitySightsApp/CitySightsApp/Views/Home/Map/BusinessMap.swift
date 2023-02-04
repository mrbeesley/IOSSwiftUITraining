//
//  BusinessMap.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/2/23.
//

import SwiftUI
import MapKit


struct BusinessMap : UIViewRepresentable {
    
    @EnvironmentObject var model : ContentModel
    @Binding var selectedBusiness: Business?
    
    var locations : [MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        for business in model.restaurants + model.sights {
            
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                // create a new annotation
                let location = MKPointAnnotation()
                location.coordinate = CLLocationCoordinate2D(latitude: lat,longitude: long)
                location.title = business.name ?? ""
                annotations.append(location)
                
            }
        }
        
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Make the user show on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // TODO: Set the Region
        
        return mapView
        
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove all annotations
        // this can get called many times
        // we don't want to add the annotations multiple times
        uiView.removeAnnotations(uiView.annotations)
        
        // add the annotations
        uiView.showAnnotations(self.locations, animated: true)
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    
    // MARK - Coordinator class
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            // if the annotation is the user location, return nil
            if annotation is MKUserLocation {
                return nil
            }
            
            // check if there is a reusable annotation view first
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
            
            if annotationView == nil {
                // could  not get a resusable view so creae a new one
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            else {
                // found a resusable view so update it
                annotationView!.annotation = annotation
            }
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            // user tapped on the annotation view
            // loop through the businesses in teh model and find a match
            for business in map.model.restaurants + map.model.sights {
                if view.annotation?.title == business.name {
                    map.selectedBusiness = business
                    return
                }
            }
            
        }
    }
}
