//
//  PaymentClass.swift
//  SoftwareEngineeringProject
//
//  Created by Justin Trubela on 2/12/23.
//

import Foundation

struct Payment: Codable {
    var id = UUID()
    
    let paymentDate: Date
    let paymentAmount: Double
    
    let Cardholder_Name: String
    let Card_Type: String
    let Card_Number: Int
    let Card_EXPdate: Date
    let CVV: Int

}
