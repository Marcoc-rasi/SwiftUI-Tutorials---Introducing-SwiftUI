//
//  FeatureCard.swift
//  Landmarks-marcocrasi
//
//  Created by Marcos Uriel Martinez Ortiz on 15/12/23.
//

import SwiftUI

// View structure representing a feature card for a landmark
struct FeatureCard: View {
    // Property holding information about the landmark to be displayed on the card
    var landmark: Landmark
    
    // Body of the view that defines the appearance of the feature card
    var body: some View {
        // Check if the representative image of the landmark is present
        landmark.featureImage?
            .resizable() // Make the image resizable
            .overlay {
                // Embed an overlay of text using TextOverlay
                TextOverlay(landmark: landmark)
            }
    }
}


// View structure representing a text overlay for a landmark
struct TextOverlay: View {
    // Property holding information about the landmark to be displayed in the overlay
    var landmark: Landmark
    
    // Computed property representing a linear gradient for the overlay
    var gradient: LinearGradient {
        // Create a linear gradient from black with 0.6 opacity at the bottom to fully transparent black at the center
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    // Body of the TextOverlay view, defining its appearance
    var body: some View {
        // ZStack to layer views, with alignment set to bottomLeading
        ZStack(alignment: .bottomLeading) {
            // Overlay the gradient defined in the computed property
            gradient
            
            // VStack to arrange text views vertically, with alignment set to leading
            VStack(alignment: .leading) {
                // Display the landmark name with title font and bold style
                Text(landmark.name)
                    .font(.title)
                    .bold()
                
                // Display the park associated with the landmark
                Text(landmark.park)
            }
            // Add padding to the VStack
            .padding()
        }
        // Apply a foreground style with white color
        .foregroundStyle(.white)
    }

}

// SwiftUI Preview for the FeatureCard view
#Preview {
    // Create an instance of FeatureCard with a landmark from the ModelData features array
    FeatureCard(landmark: ModelData().features[0])
        // Set the aspect ratio and content mode for the preview
        .aspectRatio(3 / 2, contentMode: .fit)
}

