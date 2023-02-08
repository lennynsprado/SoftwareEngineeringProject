//
//  SoftwareEngineeringProjectApp.swift
//  SoftwareEngineeringProject
//
//  Created by Lennyn Stephano Prado on 2/7/23.
//

import SwiftUI
import Firebase

@main
struct SoftwareEngineeringProjectApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
