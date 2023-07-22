//
//  GeolocationViewController.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 22/07/23.
//

import Foundation
import UIKit
import MapKit

class GeolocationViewController: UIViewController, MKMapViewDelegate {
    
    var latitude: Float = 0.0
    var longitude: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = MKMapView()
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 100
        let mapWidth:CGFloat = view.frame.size.width
        let mapHeight:CGFloat = view.frame.size.height
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true

        mapView.centerCoordinate.latitude =  CLLocationDegrees(latitude)
        mapView.centerCoordinate.longitude = CLLocationDegrees(longitude)
        
    
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        mapView.addAnnotation(annotation)
        mapView.center = view.center
        
        view.addSubview(mapView)
    }
    
}
