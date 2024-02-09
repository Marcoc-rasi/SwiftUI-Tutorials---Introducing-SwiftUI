# `Unit 1.1 Creating and combining views Introduction`

I followed a tutorial that guided me through building Landmarks, an app to discover and share the places I love. I have started by building the view that shows the details of an emblematic place.
To style the views, I have used `stacks` to combine and overlay the `image` and `text` view components. To add a map to the view, I have included a standard `MapKit` component. As I've refined the view layout, `Xcode` has provided real-time feedback so I could see how those changes translate into code.


## `Section 1 Create a new project and explore the canvas`

I have created a new Xcode project that uses SwiftUI. I've explored the SwiftUI canvas, previews, and template code.

### `Summary of Section Steps`

`Steps`:
1. `Project Start`:
- I opened Xcode and chose `Create New Project` or selected File > New > Project.
2. `Basic Configuration`:
- In the template chooser, I chose iOS as the platform, selected the app template and continued.
3. `Project Details`:
- I named the project `Landscapes` and selected `SwiftUI` for the interface and `Swift` for the language.
4. `Application Structure`:
- In the project browser, I selected PaisajesApp and organized the application according to the App protocol, establishing the entry point.
5. `View Definition`:
- I selected ContentView in the project navigator and set the default view using the View protocol.
6. `Auto Preview`:
- Automatically displayed a preview on the canvas.
7. 'Content Personalization':
- Inside the `body` property on the ContentView, I customized the greeting by removing the default text.



## `Section 2 Customize Text View`

I customized the display of a view by changing my code, or I used the inspector to discover what's available and to help me write code. While building the Landmarks app, I was able to use any combination of editors: the source editor, the canvas, or the inspectors. My code stayed up to date, regardless of what tool I used.

### `Summary of Section Steps`

`Steps`:
1. `Canvas Mode`:
- I changed the canvas mode to "Selectable". By default, the canvas displays views in Live mode for interaction, but Selectable mode enables editing.
2. `SwiftUI Inspector`:
- In the preview, I Command-Control clicked on the greeting to open the structured editing popover and chose "Show SwiftUI Inspector".
- The popover displays attributes that can be customized based on the type of view you are inspecting.
3. `Text Change`:
- I used the inspector to change the text to "Turtle Rock", the name of the first landmark that will be displayed in the app.
4. `Font Modifier`:
- I changed the font modifier to "Title". This applies the system font to the text so that it responds correctly to the user's preferred font sizes and settings.
- In SwiftUI, you customize views using methods called modifiers. These wrap a view to change its appearance or other properties.
5. `Color Modification`:
- I edited the code manually to add the `foregroundColor(.green)` modifier, this changes the text color to green.
- Your code is always the source of truth for the view. When you use the inspector to change or remove a modifier, Xcode updates your code immediately.
6. `Color Restoration`:
- I opened the inspector by Control-clicking the `Text` declaration in the code editor and choosing "Show SwiftUI Inspector". I changed the text color to black by selecting "Inherited" from the color pop-up menu.
7. `Automatic Update`:
- I noticed that Xcode automatically updates the code to reflect the change, removing the `foregroundColor(.green)` modifier.
8. `Return to Live Mode`:
- I set the preview back to Live mode. Working in Live makes it easy to track the view's behavior while you make edits to the source code.


## `Section 3 Combining views using stacks`

Beyond the title view I created in the previous section, I've added text views to contain details about the landmark, such as the name of the park and the state in which it is located. When creating a SwiftUI view, I described its content, layout, and behavior in the view's `body` property; however, the `body` property only returns a single view. I have combined and embedded multiple views into stacks, which group views together horizontally, vertically, or back to front. In this section, I have used a vertical stack to place the title on top of a horizontal stack containing details about the park.

### `Summary of Section Steps`

`Steps`:
1. `Embed into VStack`:
- I Control-clicked the text view initializer to show a context menu and chose "Embed in VStack".
- Next, I added a text view to the stack by dragging a TextView from the library.
2. `Open Library and Add Text`:
- I opened the library by clicking the plus (+) button at the top right of the Xcode window.
- I dragged a text view to the place in the code immediately below the "Turtle Rock" text view.
3. 'Text Customization':
- Replaced the text view placeholder text with "Joshua Tree National Park".
- I customized the location to match your desired layout.
4. `Source Settings`:
- I set the location source to subheader.
5. `Stack Alignment`:
- Edited the VStack initializer to align views by their starting edges.
- By default, stacks center their content along their axis and provide context-appropriate spacing.
6. `Embed into HStack`:
- I embedded the "Joshua Tree National Park" text view in an HStack.
7. `Add New Text`:
- Added a new text view after the location, changed the marker text to the park status and set its font to subheader.
8. `Separation with Spacer`:
- To use the full width of the device, I added a Spacer to the horizontal stack containing the two text views.
- A spacer expands so that its containing view uses all the space of its parent view, instead of having its size defined only by its content.
9. `Add Margin with padding()`:
- Finally, I used the `padding()` modifier to give the landmark name and details a little more space around their outer edges.


## `Section 4 Create a custom image view`

With the name and location views already set up, the next step is to add an image for the landmark. Instead of adding more code in this file, I'll create a custom view that applies a mask, border, and shadow to the image.

### `Summary of Section Steps`

**Start by adding an image to the project's asset catalog.**

`Steps`:
1. `Add Image to Resource Catalog`:
- I started by adding an image to the project's resource catalog.
- I found `turtlerock@2x.jpg` in the project file assets folder and dragged it into the asset catalog editor. Xcode created a new set of images for the image.
2. `Create a New SwiftUI View`:
- Choose File > New > File to open the template chooser again.
- In the User Interface section, I selected "SwiftUI View" and clicked Next. I named the file `CircleImage.swift` and clicked Create.
3. `Replace Text with Image`:
- Replaced the text view with the Turtle Rock image using the `Image(_:)` initializer, passing it the name of the image to display.
4. `Apply a Circular Clipping Shape`:
- Added a call to `clipShape(Circle())` to apply a circular clipping shape to the image.
- The `Circle` type is a shape that can be used as a mask or as a view by giving it a stroke or fill.
5. `Create a Circle with Gray Stroke`:
- I created another circle with a gray stroke and added it as an overlay to give the image a border.
6. `Add a Shadow`:
- Next, I added a shadow with a radius of 7 points.
7. `Change Border Color to White`:
- I changed the border color to white.
8. `End Image View`:
- These steps complete the image view setup.


## `Section 5 Using SwiftUI Views from Other Frameworks`

Next, I will create a map that centers on a given coordinates. I can use MapKit's Map view to render the map.

### `Summary of Section Steps`

**To start, I'll create a new custom view to manage my map.**

`Steps`:
1. `Create a New SwiftUI View for the Map`:
- I chose File > New > File, selected iOS as the platform, chose the "SwiftUI View" template and clicked Next. I named the new file `MapView.swift` and clicked Create.
2. `Import MapKit`:
- Added an import statement for MapKit.
- Importing SwiftUI and certain other frameworks in the same file gives you access to the SwiftUI-specific functionality provided by that framework.
3. `Create a Private Computed Variable for Map Region`:
- I created a private computed variable that contains the region information for the map.
4. `Replace Text View with a Map View`:
- Replaced the default text view with a map view that takes a camera position that I initialize with the region.
5. `Display the Map in Preview`:
- In the preview, I verified that the map was centered on Turtle Rock.
- I was able to manipulate the map in the live preview to zoom and view the surrounding area using the control's optional click and drag combination.


## `Section 6 Compose the detailed view`

Now I have all the components I need: the name and location, a circular image, and a map for the location. Using the tools I've used so far, I'll combine my custom views to create the final detailed view layout of the landmark.

### `Summary of Section Steps`

`Steps`:
1. `Select ContentView File`:
- In the project browser, I selected the `ContentView` file.
2. `Embed Main VStack in Another VStack`:
- I embedded the VStack containing the three text views into another VStack.
3. `Add your Custom Map View`:
- Added my custom view `MapView` to the top of the stack.
- I set the size of `MapView` with `frame(width:height:)`.
- By specifying only the height parameter, the view is automatically sized to the width of its content. In this case, `MapView` expands to fill the available space.
4. `Add Circular Image View`:
- Added the circle image view (`CircleImage`) to the stack.
5. `Overlay Image on Map`:
- To position the image view on top of the map view, I gave the image an offset of -130 points vertically and a padding of -130 points from the bottom of the view.
- These adjustments make room for text by moving the image up.
6. `Add a Spacer to the End of the Outer VStack`:
- Added a spacer to the end of the external VStack to push the content to the top of the screen.
7. `Add a Separator and Additional Descriptive Text`:
- Added a separator and additional descriptive text for the place.
8. `Move Subheader Font Modifier`:
- Finally, I moved the subheader font modifier from each text view to the HStack that contains them, and applied the secondary style to the subheader text.
- When you apply a modifier to a layout view such as a stack, SwiftUI applies the modifier to all elements contained in the group.

# Final Unit App

![Photo-Landmarks-marcocrasi](https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/a14a951a-ae8b-4223-b75d-85903828d639)


