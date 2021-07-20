//
//  LocationViewController.swift
//  Location
//
//  Created by 이성호 on 2021/07/20.
//

import UIKit
import CoreLocation

class LocationViewController : UIViewController {
    //MARK: Property
    
    var manager : CLLocationManager?
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "LABEL"
        return label
    }()
    //MARK: Selectors
    //MARK: Functions
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureComponent()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingHeading()
    }
    
    //MARK: Configure
        func configure(){
            view.backgroundColor = .white
        }
        
        func configureComponent(){
            
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
}
//MARK: Extensions
extension LocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {return}
        
        label.text = "\(first.coordinate.longitude) | \(first.coordinate.latitude)"
    }
}


//info.plist 수정
//Privacy - Location Always and When In Use Usage Description
