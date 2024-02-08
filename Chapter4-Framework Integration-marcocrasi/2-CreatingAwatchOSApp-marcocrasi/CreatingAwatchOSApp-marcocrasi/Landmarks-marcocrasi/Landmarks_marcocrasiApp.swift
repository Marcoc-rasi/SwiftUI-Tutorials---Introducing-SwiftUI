//
//  Landmarks_marcocrasiApp.swift
//  Landmarks-marcocrasi
//
//  Created by Marcos Uriel Martinez Ortiz on 04/12/23.
//

import SwiftUI

@main
struct Landmarks_marcocrasiApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
