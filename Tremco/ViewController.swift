//
//  ViewController.swift
//  Tremco
//
//  Created by Akhil on 9/23/17.
//  Copyright © 2017 Tremco. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation


class ViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {
    @IBOutlet var mapView: UIView!
    var fixedReportValue = 1
    //@IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidAppear(_ animated: Bool) {
        NSLog("value cahnged: ");
        NSLog(String(fixedReportValue));
    }
    
    
    override func loadView() {
       
         self.navigationController?.isNavigationBarHidden = false
        
            // Create a GMSCameraPosition that tells the map to display the
            
            //user location stuff
            self.locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
        
            locationManager.startUpdatingLocation()
        let location = locationManager.location?.coordinate
        var long = "\(location!.longitude)"
        var lat = "\(location!.latitude)"
        NSLog(long);
        NSLog(lat);
        //Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: (location?.latitude)!, longitude: (location?.longitude)!, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        self.view = mapView
        
        if(fixedReportValue == 2){
            imageButton();
        }
        else
        {
        }
        //let marker = GMSMarker()
        
        
       

        }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        let position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let marker = GMSMarker(position: position)
        marker.map = mapView
    }
    
    func imageButton()
    {
        let image = UIImage(named: "recordButton") as UIImage?
        let button   = UIButton(type: UIButtonType.custom) as UIButton
        button.frame = CGRect(x: 280, y:600, width:100, height:100)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(ViewController.btnTouched), for:.touchUpInside)
        self.view.addSubview(button)
    }
    func btnTouched(){
        performSegue(withIdentifier: "RecordButtonTapped", sender: nil)
    
        NSLog("touched")
    }
        


}

