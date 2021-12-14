//
//  ViewController.swift
//  LocationDemo
//
//  Created by 杨振誉 on 14/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    let manager = LocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LocationButtonTapped(_ sender: Any) {
        switch manager.authenticationstatus{
        case .allowed:
            manager.requestLocation()
            //print("Your location - \(manager.currentLoaction)")
        case .denied:
            handleDenied()
            
        case .notdetermined:
            manager.RequestAuthenrization()
            
            
        }
    }
    private func handleDenied(){
        let alert = UIAlertController(title: "Location Service Error", message: "please enable your location service.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let setting = UIAlertAction(title: "Setting", style: .default, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(setting)
        
        present(alert, animated: true, completion: nil)
    }
}

