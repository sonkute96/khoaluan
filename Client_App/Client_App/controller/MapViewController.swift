//
//  MapViewController.swift
//  Client_App
//
//  Created by Phạm Sơn on 11/1/17.
//  Copyright © 2017 Phạm Sơn. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
class MapViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {
    @IBOutlet weak var myMapView: UIView!
    
    var drivers : [Driver] = []
    var mapView : GMSMapView? = nil
    var locationManager = CLLocationManager()
    func setMarker(latitude: Double, longitude: Double, fname: String) -> Void {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = fname
        marker.map = self.mapView
    }
    func getAllDrivers(url: URL) {
        let queueLoadAllDrivers = DispatchQueue(label: "loadAllDrivers")
        queueLoadAllDrivers.async {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    return
                }
                guard let responseData = data else {
                    return
                }
                do {
                    self.drivers = try JSONDecoder().decode([Driver].self, from: responseData)
                    print("count drivers : \(self.drivers.count)")
                    DispatchQueue.main.async {
                        for driver in self.drivers {
                            let latitude = driver.latitude!
                            let longitude = driver.longitude!
                            let fname = driver.fname!
                            self.setMarker(latitude: latitude, longitude: longitude,fname: fname)
                        }
                    }
                } catch {
                    print("error parsing response")
                    print(error)
                }
            }
            task.resume()
        }
    }
    func setCurrentLocation() -> Void {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = GMSMapView()
        self.myMapView.addSubview(mapView)
    }
}
