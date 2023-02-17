//
//  UserClass.swift
//  SoftwareEngineeringProject
//
//  Created by Justin Trubela on 2/12/23.
//

import Foundation


struct User: Codable{
    var first_Name: String
    var last_Name: String
    
    private var CWID: Int
    
    var email_Address: String
    private var password: String
    
}
