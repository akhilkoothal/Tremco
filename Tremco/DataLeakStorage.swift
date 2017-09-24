//
//  DataLeakStorage.swift
//  Tremco
//
//  Created by Akhil on 9/24/17.
//  Copyright © 2017 Tremco. All rights reserved.
//

import UIKit
import CoreLocation

class DataLeakStorage: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = false
        locationManager=CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let location = locationManager.location?.coordinate
//        NSLog(String(location!.longitude))
//        NSLog(String(location!.latitude))
        longitudeLabel.text = "\(location!.longitude)"
        latitudeLabel.text = "\(location!.latitude)"
        
        
                //let currentLocation = locationManager.(location: location, didUpdateLocations: <#T##[AnyObject]#>)
    }
    override func viewDidAppear(_ animated: Bool) {
               // self.view.addSubview(button)

    }
    //var location1 = CLLocationCoordinate2D.self
    func locationManager(location:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        //println("locations = \(locations)")
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        //let coord = locationObj.coordinate
        
       
    }
    
//    func buttonAction(sender: UIButton!) {
//        print("Button tapped")
//    }
//        latitudeLabel.text = String(coord.latitude)
//        print(coord.latitude)
//        longitudeLabel.text = String(coord.longitude)

    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


