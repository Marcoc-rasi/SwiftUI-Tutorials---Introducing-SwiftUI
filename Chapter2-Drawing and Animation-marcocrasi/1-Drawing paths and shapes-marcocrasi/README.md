# `Unit 2.1 - Draw paths and shapes – Introduction`

I received a badge every time I visited a landmark on my list. Of course, in order for me to receive a badge, I needed to create one. This tutorial walked me through the process of creating a badge by combining paths and shapes, which I then overlaid with another shape representing the location. If I wanted to create multiple badges for different types of landmarks, I experimented with the overlapping symbol, varying the amount of repetition or changing the different angles and scales.

## `Section 1 - Create drawing data for a badge view`

To create the badge, I started by defining data that I could use to draw a hexagon shape for the background of the badge.

### Summary of section steps

`Steps`:

1. `Create a New Swift File:`
- With the view group ( Views ) selected in the navigation pane, choose `File > New > File`, select Swift File in the iOS templates window and click Next.
2. `Name the New File HexagonParameters.swift :`
- Name the new file ` HexagonParameters.swift` .
3. `Create a Structure Called HexagonParameters :`
- Inside the new file, I created a structure called ` HexagonParameters` .
Segment Structure to Hold the Three Points That Represent One Side of the Hexagon; Import CoreGraphics to Use CGPoint :`
Segment` structure to hold the three points that represent one side of the hexagon; I imported CoreGraphics so I could use ` CGPoint` .
- Each side begins where the previous one ends, moves in a straight line to the first point and then moves on a Bezier curve in the corner to the second point. The third point controls the shape of the curve.
5. `Create an Array to Hold the Segments:`
- I created an array to hold the segments.
6. `Add Data for the Six Segments, One for Each Side of the Hexagon:`
- I added data for the six segments, one for each side of the hexagon.
- Values are stored as a fraction of a unit square with its origin in the upper left corner, with positive x to the right and positive y downward. Later, you will use these fractions to find the real points of a hexagon with a given size.
7. `Add an Adjustment Value to Tune the Hexagon Shape:`
- Added a snap value that allows you to fine-tune the shape of the hexagon.
    

## `Section 2 - Draw the Badge Background`

I used the graphics APIs in SwiftUI to draw a custom badge shape.

### Summary of section steps

` Steps:`
1. `Create a New Swift File:`
- With the view group ( Views ) selected in the navigation pane, choose `File > New > File`, select SwiftUI View in the iOS templates window and click Next.
2. `Name the New File BadgeBackground.swift :`
- Name the new file ` BadgeBackground.swift` .
3. `Add a Path Shape to the Badge Background and Apply the fill ( ) Modifier:`
- In ` BadgeBackground` , I added a shape ` Path` to the badge background and applied the ` fill ( )` modifier to convert the shape to a view.
Paths are used to combine lines, curves and other drawing primitives to form more complex shapes, such as the hexagonal background of the badge.
4. `Add a Starting Point to the Route:`
- I added a starting point to the route, assuming a container with size 100 x 100 px .
- The ` move ( to :)` method moves the drawing cursor within the boundaries in a manner as if an imaginary pencil were suspended over the area, waiting to begin drawing.
5. `Draw Lines for Each Shape Data Point :`
- I drew the lines for each point of the shape data to create a rough hexagonal shape.
addLine ( to :)` method takes a single point and draws it. Successive calls to ` addLine ( to :)` start a line at the previous point and continue to the new point.
- Don't worry if your hexagon looks a little unusual; that's because you're ignoring the curved part of each segment at the corners of the shape. You'll deal with that next.
addQuadCurve Method ( to:control :) to Draw Bézier Curves:`
- I used the ` addQuadCurve ( to:control :)` method to draw the Bézier curves for the corners of the badge.
7. `Wrap the Route in a GeometryReader :`
- I wrapped the path in a ` GeometryReader` so that the badge can use the size of its containing view, which defines the size instead of hardcoding the value (100).
- Using the smallest geometry dimension preserves the badge's aspect ratio when its containing view is not square.
8. `Scale the Shape on the x-Axis and Add an Offset on x:`
- I scaled the shape on the x-axis using ` xScale ` and then added ` xOffset ` to re-center the shape within its geometry.
9. `Replace the Solid Black Background with a Gradient:`
- I replaced the solid black background with a gradient to match the design.
aspectRatio Modifier ( _: contentMode :) to Gradient Fill:`
- I applied the ` aspectRatio ( _: contentMode :)` modifier to the gradient fill.
- By preserving a 1:1 aspect ratio, the badge maintains its position in the center of the view, even if the ancestral views are not square.



## `Section 3 - Draw the Badge Symbol`

For the Landmarks badge, I included a custom emblem in its center based on the mountain that appears on the Landmarks app icon . The mountain symbol consists of two shapes: one representing a layer of snow at the top and the other representing vegetation along the path. I drew them using two partially triangular shapes that are separated by a small space.

### Summary of section steps

` Steps:`
1. `Navigate to Empty Application Icon :`
- Go to the empty app icon ( AppIcon ) in your project's asset catalog and then drag the single PNG file from the downloaded assets folder to the existing empty app icon set.
- Next, you will build the matching badge symbol.
2. `Create a New Custom View called BadgeSymbol :`
- Creates a new custom view called ` BadgeSymbol` for the mountain shape that is stamped in a rotated pattern on the badge design.
3. `Draw Top of Symbol Using Path APIs :`
- Draw the top of the symbol using the path APIs.
- Experiment with adjusting the numerical multipliers associated with the spacing , topWidth , and topHeight constants to see how they influence the overall shape.
4. `Draw the Bottom of the Symbol:`
- Draw the bottom part of the symbol.
- Use the ` move ( to :)` modifier to insert a space between multiple shapes on the same path.
5. `Fill the Symbol with the Purple Design Color:`
- Fill the symbol with the purple color of the design.
6. `Create a New View RotatedBadgeSymbol :`
- Create a new view called ` RotatedBadgeSymbol` to encapsulate the concept of a rotated symbol.
- Experiment with adjusting the angle in the preview to test the effect of rotation.


## `Section 4 – Merge Badge Front and Background`

The badge design requires that the mountain shape be rotated and repeated several times on top of the badge background.
I defined a new type for the rotation and took advantage of the ForEach view to apply the same settings to multiple copies of the mountain shape.

### Summary of section steps

` Steps:`
1. `Create a New SwiftUI View Called Badge :`
- I started the project by creating a new SwiftUI view called ` Badge` .
2. `Include ` BadgeBackground` in the Body of ` Badge` :`
- I placed ` BadgeBackground` in the body of ` Badge` .
3. `Overlay the Badge Symbol on the Badge Background Using a ZStack :`
- Overlaid the badge symbol on the badge background by placing it in a ` ZStack` .
- In its current state, the badge symbol is too large compared to the intended design and relative size of the background.
4. `Correct the Size of the Badge Symbol by Reading the Surrounding Geometry and Scaling the Symbol:`
- Fixed the size of the badge symbol by reading the surrounding geometry and scaling the symbol.
5. `Add a ForEach View to Rotate and Display Copies of the Badge Symbol:`
- Added a ` ForEach ` view to rotate and display copies of the badge symbol.
6. `To Keep the Project Organized, Before Moving on to the Next Tutorial, Group All New Files into a Group of Badges : `
- To keep the project organized, I grouped all the new files I added in this tutorial into a group called Badges .



