//
//  FixOrReportVC.swift
//  Tremco
//
//  Created by Akhil on 9/24/17.
//  Copyright © 2017 Tremco. All rights reserved.
//

import UIKit


var fixReport = 1

class FixOrReportVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ReportButtonTapped(_ sender: Any) {
        fixReport = 2;
        NSLog(String(fixReport));
        performSegue(withIdentifier: "ReportToDataScreen", sender: self)
        
    }
    
    @IBAction func FixButtonTapped(_ sender: Any) {
        fixReport = 3;
        NSLog(String(fixReport));
        performSegue(withIdentifier: "ReportToDataScreen", sender: self)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.withIdentifier == "ReportToDataScreen"{
        let secondVC = segue.destination as! ViewController
            secondVC.fixedReportValue = fixReport
        //}
//        let receive = segue.destination as! ViewController
//        receive.delegate = self
        
        //let receiveVC = segue.destinationViewController as! ViewController
        //receiveVC.f
        
    }
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


