

/*Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition{
        .asymmetric(
            insertion: .move(edge: .trailing),
            removal: .scale.combined(with: .opacity))
    }
}

// SwiftUI view representing a compact display of a hike.
struct HikeView: View {
    // Hike instance to display details for.
    var hike: Hike
    
    // State variable to control whether the detailed graph is shown or not.
    @State private var showDetail = true

    var body: some View {
        VStack {
            HStack {
                // Display a small version of the HikeGraph with elevation data.
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                // Display hike name and distance in a VStack.
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                // Button to toggle the visibility of the detailed graph.
                Button {
                    withAnimation  {
                        showDetail.toggle()
                    }
                } label: {
                    // Label with system image, rotating based on showDetail state.
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //.animation(.smooth, value: showDetail)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        //.animation(.spring, value: showDetail)
                }
            }

            // Display the detailed graph if showDetail is true.
            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

// Preview section displaying an example HikeView with the first hike from the model data.
#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}

