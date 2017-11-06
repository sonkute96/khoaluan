//
//  Driver.swift
//  Client_App
//
//  Created by Phạm Sơn on 11/1/17.
//  Copyright © 2017 Phạm Sơn. All rights reserved.
//

import Foundation
struct Driver : Decodable {
    let driver_id : String?
    let fname : String?
    let lname : String?
    let username : String?
    let password: String?
    let working_hours: Decimal?
    let license_plate : String?
    let avg_rating: Decimal?
    let num_ratings: Int?
    let phone_number: String?
    let latitude: Double?
    let longitude: Double?
    init(driver_id: String, fname: String, lname: String, username: String, password: String, working_hours: Decimal, license_plate: String, avg_rating: Decimal, num_ratings: Int, phone_number : String, latitude: Double, longitude: Double) {
        self.driver_id = driver_id
        self.fname = fname
        self.lname = lname
        self.username = username
        self.password = password
        self.working_hours = working_hours
        self.license_plate = license_plate
        self.avg_rating = avg_rating
        self.num_ratings = num_ratings
        self.phone_number = phone_number
        self.latitude = latitude
        self.longitude = longitude
    }
}
