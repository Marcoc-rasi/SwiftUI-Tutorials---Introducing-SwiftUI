//
//  ContentView.swift
//  WatchLanmarks Watch App
//
//  Created by Marcos Uriel Martinez Ortiz on 16/12/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    var body: some View {
        LandmarkList()
            .task {
            let center = UNUserNotificationCenter.current()
            _ = try? await center.requestAuthorization(options: [.alert, .sound, .badge])
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
