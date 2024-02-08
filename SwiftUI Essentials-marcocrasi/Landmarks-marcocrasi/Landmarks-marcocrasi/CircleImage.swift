//
//  CircleImage.swift
//  Landmarks-marcocrasi
//
//  Created by Marcos Uriel Martinez Ortiz on 05/12/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
