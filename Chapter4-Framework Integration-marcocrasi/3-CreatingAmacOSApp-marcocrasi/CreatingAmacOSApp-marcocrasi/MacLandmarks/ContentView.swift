//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Marcos Uriel Martinez Ortiz on 19/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
