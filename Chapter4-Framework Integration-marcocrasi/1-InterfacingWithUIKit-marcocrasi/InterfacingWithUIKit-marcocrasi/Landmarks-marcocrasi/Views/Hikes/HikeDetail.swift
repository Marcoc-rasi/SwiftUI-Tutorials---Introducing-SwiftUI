

/*Abstract:
A view showing the details for a hike.
*/

import SwiftUI

struct HikeDetail: View {
    // Hike instance to display details for.
    let hike: Hike
    
    // State variable to determine which data to display in the HikeGraph.
    @State var dataToShow = \Hike.Observation.elevation
    
    // Buttons array, each representing a different type of observation data.
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace)
    ]
    
    var body: some View {
        VStack {
            // Display the HikeGraph with the selected path (dataToShow).
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)
            
            // HStack containing buttons for selecting different types of observation data.
            HStack(spacing: 25) {
                // Iterate through buttons array to create buttons for each type of data.
                ForEach(buttons, id: \.0) { value in
                    Button {
                        // Set dataToShow to the selected keyPath when the button is tapped.
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundStyle(value.1 == dataToShow
                                ? .blue
                                : .orange)
                            .animation(nil) // Disable animation to prevent unnecessary visual effects.
                    }
                }
            }
        }
    }
}

#Preview {
    // Display the preview of HikeDetail with the first hike from the model data.
    HikeDetail(hike: ModelData().hikes[0])
}

