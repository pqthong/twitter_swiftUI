//
//  twitterApp.swift
//  twitter
//
//  Created by DSOFT on 18/08/2022.
//

import SwiftUI
import Firebase

@main
struct twitterApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }.environmentObject(viewModel)
        }
    }
}
