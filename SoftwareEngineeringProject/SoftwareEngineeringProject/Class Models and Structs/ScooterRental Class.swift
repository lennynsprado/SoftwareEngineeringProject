//
//  ScooterRental Class.swift
//  SoftwareEngineeringProject
//
//  Created by Justin Trubela on 2/12/23.
//

import Foundation

struct StudentRental: Codable {
    
    let student: User

    let rentalDate: Date
    let returnDate: Date
    
    let payment: Payment
}
struct GuestRental: Codable {
    let user: User
    
    let rentalDate: Date
    let returnDate: Date

    let payment: Payment
}
