# `Unit 1.2 Building lists and navigation - Introduction`

With the basic detailed view of the landmark set up, I need to provide a way for users to see the full list of landmarks and to view details about each location. I will create views that can display information about any landmark and will dynamically generate a scrollable list that a user can tap to see a detailed view of a landmark. To fine-tune the UI, I'll use Xcode to render previews on different device sizes.

## `Section 1 Create a Landmark Model`

In the first tutorial, you coded information into all of your custom views. Here, you'll create a model to store data that you can pass to your views.

### `Summary of Section Steps`

`Steps`:
1. `Add Sample Data`:
- I dragged `landmarkData.json` to the `Resources` folder of downloaded files to the project navigation bar.
- In the dialog that appears, I selected "Copy items if necessary" and the destination `Landmarks`, and then clicked Finish.
- I will use this sample data throughout this tutorial and in subsequent ones.
2. `Create a New Swift File for the Landmark Structure`:
- I chose File > New > File to create a new Swift file in the project, and named it `Landmark.swift`.
3. `Define a Landmark Structure with Properties`:
- I defined a structure `Landmark` with some properties that match names of some keys in the data file `landmarkData`.
- Added the `Codable` conformance to make it easier to move data between the structure and a data file.
4. `Add Images to Resource Catalog`:
- I dragged the JPG files from the project files `Resources` folder to the asset catalog.
- Xcode created a new set of images for each image, joining the Turtle Rock one you added in the previous tutorial.
5. `Add Image Properties to the Landmark Structure`:
- Added an `imageName` property to read the image name from the data and a calculated image property that loads an image from the asset catalog.
6. `Manage Reference Point Location Information`:
- Added a `coordinates` property to the structure using a nested `Coordinates` type that reflects storage in the JSON data structure.
- I marked this property as private because you will only use it to create a public computed property in the next step.
7. `Calculate Location Coordinate Property`:
- Calculated a `locationCoordinate` property that is useful for interacting with the MapKit framework.
8. `Create a File for Model Data Logic`:
- I created a new Swift file in the project called `ModelData.swift`.
9. `Create a 'load(_:)' Method to Get JSON Data`:
- Created a `load(_:)` method that gets JSON data with a given name from the main application package.
- This method relies on return type conformance to the `Decodable` protocol, which is a component of the `Codable` protocol.
10. `Create an Initialized Landmark Array from 'landmarkData.json'`:
- Created an array of landmarks initialized from `landmarkData.json`.
11. `Organize the Project`:
- I grouped related files to facilitate project management.
- I put `ContentView`, `CircleImage` and `MapView` in a group called `Views`, `landmarkData` in a group called `Resources` and `Landmark` and `ModelData` in a group called `Model`.


## `Section 2 Create the row view`

The first view I will build in this tutorial is a row to show details about each landmark. This row view stores information in a property for the landmark it displays, so that a view can display any landmark. Later, I will combine several rows into a list of landmarks.

### `Summary of Section Steps`

`Steps`:
1. `Create a New SwiftUI View`:
- I created a new SwiftUI view in the `Views` group called `LandmarkRow.swift`.
2. `Add 'landmark' as a Stored Property`:
- Added `landmark` as a stored property of `LandmarkRow`.
- Adding the `landmark` property causes the preview on the canvas to stop working because the `LandmarkRow` type needs an instance of `landmark` during initialization.
- To fix the preview, you need to modify the instantiation of the view in the preview.
3. `Modify the Preview`:
- Inside the preview macro, I added the `landmark` parameter to the `LandmarkRow` initializer, specifying the first element of the `landmarks` array.
- The preview now shows the text "Hello, world!"
- With that taken care of, I was able to build the layout for the row.
4. `Embed Existing Text View in an HStack`:
- I embedded the existing text view in an HStack.
5. `Modify Text View to Use Reference Point Name`:
- Modified the text view to use the property name `landmark`.
6. `Complete the Row`:
- I completed the row by adding an image before the text view and a spacer after it.


## `Section 3 Customize the row preview`

Xcode automatically recognizes any preview you declare with a preview macro in a view's source file. The canvas displays only one preview at a time, but you can define multiple previews and choose between them on the canvas. Alternatively, you can group views together to create a single preview of more than one version of a view.

### `Summary of Section Steps`

`Steps`:
1. `Add a Second Preview`:
- Added a second preview macro that uses the second element in the `landmarks` array.
- Adding previews allows you to see how your views behave with different data.
2. `Use Canvas Controls to Select Second Preview`:
- I used the controls on the canvas to choose the second preview.
- By default, the canvas labels previews using the line number in which they appear.
- The preview macro takes an optional name parameter that you can use to label a preview.
3. `Give Each Preview a Name`:
- Give each preview a name to help distinguish them.
4. `Navigate between the Two Previews with the New Tags`:
- I navigated between the two previews with the new labels. I tried changing the selected preview again.
- When you want to preview different versions of a view side by side, you can group them into a single collection view.
5. `Delete the Second Preview and Wrap the Two Versions in a Group`:
- I removed the second preview and instead wrapped the two versions of the row in a `Group`.
- `Group` is a container to group the content of the view. Xcode renders the group's child views stacked as a single preview on the canvas.
- The code you write in the preview only changes what Xcode shows on the canvas.



## `Section 4 Create the list of emblematic places`

When I use SwiftUI's List type, I can display a platform-specific list of views. List items can be static, like the stack child views I've created so far, or dynamically generated. I can even mix static and dynamically generated views.

### `Summary of Section Steps`

`Steps`:
1. `Create a New SwiftUI View`:
- I created a new SwiftUI view in the `Views` group called `LandmarkList.swift`.
2. `Replace Default Text View with a List`:
- Replaced the default text view with a List and provided `LandmarkRow` instances with the first two landmarks as children of the list.
- The preview shows the two landmarks rendered in a list style appropriate for iOS.



## `Section 5 Make the list dynamic`

Instead of specifying the elements of a list individually, I can generate rows directly from a collection. I can create a list that displays the elements of a collection by passing my data collection and a closure that provides a view for each element in the collection. The list transforms each element in the collection into a child view using the supplied closure.

### `Summary of Section Steps`

`Steps`:
1. `Delete the Two Static Rows of Reference Points`:
- I removed the two static rows of waypoints and instead passed the waypoint array from the model data to the List initializer.
- Lists work with identifiable data. You can make your data identifiable in two ways: by passing along your data a key path to a property that uniquely identifies each element, or by making your data type comply with the Identifiable protocol.
2. `Complete Dynamically Generated List`:
- Completed the dynamically generated list by returning a `LandmarkRow` from the closure.
- This creates a `LandmarkRow` for each element in the landmarks array.
- Next, I'll simplify the List code by adding Identifiable conformance to the `Landmark` type.
3. `Add Compliance to Identifiable in Landmark.swift`:
- I changed to `Landmark.swift` and declared conformance to the Identifiable protocol.
- The `Landmark` data already has the `id` property required by the Identifiable protocol; you just need to add a property to decode it when reading the data.
4. `Remove id Parameter in LandmarkList.swift`:
- I went back to `LandmarkList.swift` and removed the `id` parameter.
- From now on, you will be able to use collections of `Landmark` elements directly.


## `Section 6 Configuring navigation between list and detail`

The list rendered correctly, but at the time I couldn't tap an individual landmark to view the details page for that landmark. I added navigation capabilities to the list by embedding it in a `NavigationSplitView`, and then nested each row in a `NavigationLink` to set up a transition to a target view.

### `Summary of Section Steps`

I prepared a detail view using the content I had created in the previous tutorial and updated the main content view to show the list view instead.

`Steps`:
1. `Create a New SwiftUI View`:
- I created a new SwiftUI view called `LandmarkDetail.swift`.
2. `Copy Content from ContentView to LandmarkDetail`:
- I copied the content of the `body` property from `ContentView` to `LandmarkDetail`.
3. `Change ContentView to Show LandmarkList`:
- Changed `ContentView` to show `LandmarkList`.
- In the next steps, I will add navigation between the list and detail views.
4. `Embed Dynamic List of Waypoints in a NavigationSplitView`:
- Embedded the dynamically generated list of waypoints in a `NavigationSplitView`.
- The navigation split view takes a second input which is a placeholder for the view that appears after someone makes a selection. On the iPhone, the split view doesn't need the placeholder, but on the iPad, the details panel can be present before someone makes a selection, as you'll see later in this tutorial.
5. `Add 'navigationTitle(_:)'` Modifier:
- Added `navigationTitle(_:)` modifier to set the title of the navigation bar when displaying the list.
6. `Wrap the Returned Row in a NavigationLink`:
- Inside the list closure, I wrapped the returned row in a `NavigationLink`, specifying `LandmarkDetail` as the target view.
7. `Try Navigation Directly in Preview`:
- I tried navigation directly in the preview. I tapped a waypoint to visit the details page.


## `Section 7 Passing Data to Child Views`

The `LandmarkDetail` view still uses hardcoded details to display its landmark. Like `LandmarkRow`, the `LandmarkDetail` type and its component views need to use a landmark property as a source for their data. Starting with the child views, I'll convert `CircleImage`, `MapView` and then `LandmarkDetail` to display data being passed, rather than hardcoding each row.

### `Summary of Section Steps`

`Steps`:
1. `Add Image Property in CircleImage`:
- In the `CircleImage` file, I added a stored image property to the `CircleImage` structure.
2. `Refresh Preview to Move Turtle Rock Image`:
- Updated the preview to show the Turtle Rock image.
3. `Add Coordinate Property in MapView`:
- In the `MapView` file, I added a coordinate property to the `MapView` structure and updated the preview to pass a fixed coordinate.
4. `Pass the Coordinates to the Center Parameter in the Region Variable`:
- I passed the coordinates to the center parameter in the region variable.
5. `Change Map Initializer to Accept a Position Input`:
- Changed the map initializer to accept a position input so it updates when the value changes.
6. `Add a Landmark Property in LandmarkDetail`:
- In `LandmarkDetail`, I added a `Landmark` property to the `LandmarkDetail` type.
7. `Pass Current Landmark to LandmarkDetail in LandmarkList`:
- In `LandmarkList`, I passed the current waypoint to the destination waypoint, `LandmarkDetail`.
8. 'In LandmarkDetail, Pass Necessary Data to Your Custom Types':
- With all connections established, the preview works again.
9. `Change VStack Container to ScrollView in LandmarkDetail`:
- Changed the container from `VStack` to `ScrollView` so that the user can scroll through descriptive content, and removed `Spacer`, which is no longer needed.
10. `Finally, Call the Modifiers 'navigationTitle(:)' and 'navigationBarTitleDisplayMode(:)'`:
- I called the `navigationTitle(:)` modifier to give the navigation bar a title when displaying the details view, and the `navigationBarTitleDisplayMode(:)` modifier to make the title appear inline.
- Navigation changes only take effect when the view is part of a navigation stack.
11. `Return to the LandmarkList Preview and Verify that It Shows the Correct Landmarks When Navigating from the List`:
- I went back to the `LandmarkList` preview and verified that it shows the correct landmarks when navigating from the list.


## `Section 8 Generate previews dynamically`

Below I will render previews of the list view for different device configurations. By default, previews are rendered at the size of the device in the active schematic. I can render previews for different devices by changing the target, or overriding the device on the canvas. I can also explore other preview variations, such as device orientation.

### `Summary of Section Steps`

`Steps`:
1. `Change Device Selector for Preview on iPad`:
- I changed the device selector so that the preview shows an iPad.
- In portrait orientation, the `NavigationSplitView` displays the details panel by default and provides a toolbar button to reveal the sidebar.
2. `Tap Toolbar Button to Reveal Sidebar`:
- I tapped the toolbar button to reveal the sidebar and tried navigating to one of the waypoints.
- The details view switches to the selected waypoint under the sidebar. The sidebar remains visible until you tap somewhere in the details view.
3. `Enable Left Landscape Orientation in Device Settings`:
- On the canvas, I selected Device Settings and enabled left landscape orientation.
- In landscape orientation, the `NavigationSplitView` displays the sidebar and details panels side by side.
4. `Experiment with Different Devices and Settings`:
- I experimented with different devices and settings in Device Settings to see how my views look under other conditions.


# Final Unit App

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/f284f6c0-26a8-49bc-a533-7abf4158dce0
