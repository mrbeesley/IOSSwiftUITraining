//
//  DirectionsMap.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/3/23.
//

import SwiftUI
import MapKit

struct DirectionsMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    var business: Business
    
    var start: CLLocationCoordinate2D {
        return model.locationManager.location?.coordinate ?? CLLocationCoordinate2D()
    }
    
    var end: CLLocationCoordinate2D {
        if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
            return CLLocationCoordinate2D(latitude: lat, longitude: long)
        }
        return CLLocationCoordinate2D()
    }
    
    
    func makeUIView(context: Context) -> MKMapView {
        
        // create map
        let map = MKMapView()
        map.delegate = context.coordinator
        
        // show the user location
        map.showsUserLocation = true
        map.userTrackingMode = .followWithHeading
        
        // create directions request
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: end))
        
        // create directions object
        let directions = MKDirections(request: request)
        
        // calculate route
        directions.calculate { (response, error) in
            if error == nil && response != nil {
                for route in response!.routes {
                    map.addOverlay(route.polyline)
                    map.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                    map.setVisibleMapRect(route.polyline.boundingMapRect,
                                          edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100),
                                          animated: true)
                }
                
            }
        }
        
        // place annotation for the endpoint
        let annotation = MKPointAnnotation()
        annotation.coordinate = end
        annotation.title = business.name ?? ""
        map.addAnnotation(annotation)
        
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {

        uiView.removeAnnotations(uiView.annotations)
        uiView.removeOverlays(uiView.overlays)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    // MARK: - Coordinator
    class Coordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
            renderer.lineWidth = 5
            renderer.strokeColor = .blue
            return renderer
        }
    }
}
