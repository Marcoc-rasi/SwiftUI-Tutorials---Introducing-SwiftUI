

/*Abstract:
A single line in the graph.
*/

import SwiftUI

// Definition of a custom view to represent a capsule in a graph.
struct GraphCapsule: View, Equatable {
    var index: Int         // Index of the capsule in the graph.
    var color: Color       // Color of the capsule.
    var height: CGFloat    // Total height available for the capsule.
    var range: Range<Double>    // Range of values that the capsule represents.
    var overallRange: Range<Double>  // Total range of values in the graph.

    // Calculates the ratio of the capsule's height relative to the overall range.
    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }

    // Calculates the vertical position of the capsule relative to the overall range.
    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }

    // View of the capsule in the graph.
    var body: some View {
        Capsule()
            .fill(color)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
}

// Preview for visualizing the capsule in a development environment.
#Preview {
    GraphCapsule(
        index: 0,
        color: .blue,
        height: 150,
        range: 10..<50,
        overallRange: 0..<100)
}
