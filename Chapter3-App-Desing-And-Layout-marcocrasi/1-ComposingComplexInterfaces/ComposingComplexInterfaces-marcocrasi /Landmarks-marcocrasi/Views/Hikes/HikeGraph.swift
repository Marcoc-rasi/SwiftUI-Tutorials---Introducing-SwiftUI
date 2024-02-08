

/*Abstract:
The elevation, heart rate, and pace of a hike plotted on a graph.
*/

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

struct HikeGraph: View {
    // Declaration of variables hike and path. Make sure to initialize them appropriately.
    var hike: Hike  /* initialize appropriately */
    var path: KeyPath<Hike.Observation, Range<Double>>  /* initialize appropriately */
    
    // Computed property that determines the color based on the type of data stored in path.
    var color: Color {
        switch path {
        case \.elevation:
            // If path is the elevation keyPath, return the gray color.
            return .gray
        case \.heartRate:
            // If path is the heartRate keyPath, return a color based on the HSB color space.
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            // If path is the pace keyPath, return a color based on the HSB color space.
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            // Default case, return the black color. Make sure this is the appropriate choice.
            return .black
        }
    }
    
    
    var body: some View {
        // Extracting observations data from the hike.
        let data = hike.observations
        
        // Calculating the overall range of the data using the specified keyPath.
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
        
        // Finding the maximum magnitude among the observations.
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        
        // Calculating the height ratio based on the maximum magnitude and overall range.
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))
        
        return GeometryReader { proxy in
            // Creating an HStack for visualizing the graph.
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                // Iterating through each observation and creating a GraphCapsule for visualization.
                ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                    GraphCapsule(
                        index: index,
                        color: color,
                        height: proxy.size.height,
                        range: observation[keyPath: path],
                        overallRange: overallRange
                    )
                    .animation(.ripple(index: index))
                }
                // Adjusting the offset based on the calculated height ratio for proper visualization.
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

// Function to calculate the overall range of a collection of ranges.
func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
    // If the collection is empty, return an empty range.
    guard !ranges.isEmpty else { return 0..<0 }
    
    // Calculate the minimum lower bound and maximum upper bound to form the overall range.
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

// Function to calculate the magnitude of a range.
func magnitude(of range: Range<Double>) -> Double {
    // Calculate the difference between the upper and lower bounds of the range.
    return range.upperBound - range.lowerBound
}

// Preview code demonstrating the HikeGraph for different paths.
#Preview {
    // Creating an instance of ModelData and extracting the first hike.
    let hike = ModelData().hikes[0]
    
    // Displaying three instances of HikeGraph with different keyPaths.
    return Group {
        HikeGraph(hike: hike, path: \.elevation)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.heartRate)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.pace)
            .frame(height: 200)
    }
}

