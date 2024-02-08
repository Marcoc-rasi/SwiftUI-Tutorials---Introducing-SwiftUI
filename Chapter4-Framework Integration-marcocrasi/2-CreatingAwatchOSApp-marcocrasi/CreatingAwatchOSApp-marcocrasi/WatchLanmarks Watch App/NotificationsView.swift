//
//  NotificationsView.swift
//  WatchLanmarks Watch App
//
//  Created by Marcos Uriel Martinez Ortiz on 16/12/23.
//

import SwiftUI

struct NotificationsView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknow Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks")
                .font(.caption)
        }
    }
}

#Preview("No value") {
    NotificationsView()
}

#Preview("Example") {
    NotificationsView(
        title: "Turtle Rock",
        message: "You are within 5 miles of Turtle Rock",
        landmark: ModelData().landmarks[0]
    )
}
