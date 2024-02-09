# `Unit 4.3 - Creating a macOS application - Introduction`

After building a version of the Landmarks app for watchOS, it's time to look at something bigger: bringing Landmarks to Mac. I'll build on everything I've learned so far, to complete the experience of building a SwiftUI app for iOS, watchOS, and macOS. I'll start by adding a macOS target to my project and then reuse views and data I created earlier. With a foundation in place, I'll add some new views designed for macOS and modify others to work better on all platforms.

## `Section 1 - Add a macOS target to the project`

I'll start by adding a macOS target to the project. Xcode will add a new group and set of startup files to your macOS app, along with the schema needed to build and run the app. Then I'll add some existing files to the new target.

### `Summary of section steps:`

`Steps:`

1. `Add a New Target:`
- I chose `File > New > Target`. When the template sheet appeared, I selected the macOS tab, chose the `App` template, and clicked `Next`. This template adds a new macOS application target to the project.

2. `Set New Target:`
- On the sheet, I entered `MacLandmarks` as the `Product Name`. I set the interface to SwiftUI, the language to Swift, and then clicked `Finish`.

3. `Configure Scheme:`
- I set the scheme to `MacLandmarks > My Mac`. By setting the schema to `My Mac`, I was able to preview, build, and run the macOS app. As I progress through the tutorial, I will use other schemes to observe how the other targets respond to changes in shared files.

4. `Select ContentView:`
- In the `MacLandmarks` group, I selected `ContentView` and opened the `Canvas` to see the preview. SwiftUI provides both a default main view and its preview, just like in an iOS app, allowing you to preview the main app window.

5. `Delete MacLandmarksApp File:`
- In the `MacLandmarks` group, I deleted the `MacLandmarksApp` file. When asked, I chose `Move to Trash`. As with the watchOS app, I don't need the default app structure because I'll be reusing the one I already have.

6. `Share Files with macOS Target:`
- In the project browser, I Command-clicked to select the following files: `LandmarksApp`, `LandmarkList`, `LandmarkRow`, `CircleImage`, `MapView` and `FavoriteButton`. The first is the shared definition of the application. The rest are views that will work on macOS.

7. `Continue Selecting Folders and Files:`
- Continue Command-clicking to select all items in the `Model` and `Resources` folders, as well as `Asset`. These elements define the data model and resources of the application.

8. `Set up Target Membership:`
- In the file inspector, I added `MacLandmarks` to the `Target Membership` for the selected files. I also added a set of macOS app icons to match those on other targets.

9. `Remove Empty Element from App Icon:`
- I selected the `Assets` file in the `MacLandmarks` group and removed the empty `AppIcon` element. I will replace it in the next step.

10. `Add App Icon Set:`
- I dragged the `AppIcon.appiconset` folder from the `Resources` folder of the downloaded project to the `MacLandmarks` asset catalog.

11. `Refresh ContentView:`
- In `ContentView` in the `MacLandmarks` group, I added `LandmarkList` as the top-level view, with restrictions on the frame size. The preview no longer compiles because `LandmarkList` uses `LandmarkDetail`, but I haven't defined a detail view for the macOS app yet. I'll deal with that in the next section.


## `Section 2 - Create a detailed view for macOS`

The detailed view shows information about the selected landmark. I created such a view for the iOS app, but different platforms require different approaches to presenting data. Sometimes you can reuse a view across platforms with minor tweaks or conditional compilation, but the detailed view differs enough for macOS that it's best to create a dedicated view. I'll copy the detailed view from iOS as a starting point and then modify it to fit the larger macOS screen.

### `Summary of section steps:`

`Steps:`

1. `Create a New Custom View:`
- Created a new custom view in the `MacLandmarks` group targeting macOS called `LandmarkDetail`. You now have three files called `LandmarkDetail`. Each serves the same purpose in the view hierarchy, but provides an experience tailored to a specific platform.

2. `Copy Contents of iOS Detail View:`
- I copied the contents of the iOS detail view to the macOS detail view. The preview fails because the `navigationBarTitleDisplayMode(_:)` method is not available on macOS.

3. `Remove navigationBarTitleDisplayMode(_:) Modifier and Add a Frame Modifier:`
- Removed the `navigationBarTitleDisplayMode(_:)` modifier and added a frame modifier to the preview to see more content. The changes you'll make in the following steps will improve the layout for the larger screen of a Mac.

4. `Change HStack to VStack and Remove Spacer:`
- Changed the `HStack` containing the park and state to a left-aligned `VStack` and removed the `Spacer`.

5. `Enclose Everything Below MapView in a VStack and Place CircleImage and the Rest of the Header in an HStack:`
- I enclosed everything below the `MapView` in a `VStack` and then placed the `CircleImage` and the rest of the header in a `HStack`.

6. `Remove the Circle Scroll and Apply a Smaller Scroll to the Entire VStack:`
- I removed the circle scroll and instead applied a smaller scroll to the entire `VStack`.

7. `Add a resizable() Modifier to the Image and Restrict the Size of CircleImage:`
- Added a `resizable()` modifier to the image and restricted the size of `CircleImage` to be a little smaller.

8. `Restrict the ScrollView to a Maximum Width:`
- Restricted the `ScrollView` to a maximum width. This improves readability when the user makes the window very wide.

9. `Change the FavoriteButton to Use the Plain Button Style:`
- Changed the `FavoriteButton` to use the plain button style. Using the plain style here makes the button look more like the iOS equivalent.

10. `Add an "Open in Maps" Button in a ZStack to Appear in the Top Right Corner of the Map:`
- Added an "Open in Maps" button in a `ZStack` to appear in the top right corner of the map. Make sure you include MapKit so you can create the `MKMapItem` that you will send to Maps.


## `Section 3 - Update Row View`

The `LandmarkRow` shared view works on macOS, but it's worth checking out for improvements given the new visual environment. Since this view is used on all three platforms, you need to be careful that any changes you make work on all of them.

### `Summary of section steps:`

Before modifying the row, I set up a preview of the list, because the changes I will make are driven by how the row looks in context.

`Steps:`

1. `Open LandmarkList and Add a Minimum Width:`
- I opened `LandmarkList` and added a minimum width. This improves the preview, but also ensures that the list is never too small when the user resizes the macOS window.

2. `Set List Preview:`
- Fixed the list preview so you can see what the row looks like in context while you make changes.

3. `Open LandmarkRow and Add a Corner Radius to the Image:`
- I opened `LandmarkRow` and added a corner radius to the image to give it a more refined look.

4. `Wrap the Place Name in a VStack and Add the Park as Secondary Information:`
- I wrapped the place name in a `VStack` and added the park as secondary information.

5. `Add Vertical Padding around Row Content:`
- Added vertical padding around the row content to give each row a little more space. The updates improve the look and feel on macOS, but you also need to consider the other platforms that use the list. First, consider watchOS.

6. `Select the WatchLandmarks Target to View a watchOS Preview from the List:`
- I chose the `WatchLandmarks` target to see a watchOS preview from the list. The minimum row width is not appropriate here. Because of this and other changes you'll make in the next section, the best solution is to create a watchOS-specific list that bypasses the width restriction.

7. `Add a New SwiftUI View to the WatchLandmarks Watch App Folder Called LandmarkList.swift That Targets Only the WatchLandmarks Watch App, and Remove Membership from the Old Target:`
- Added a new SwiftUI view to the `WatchLandmarks Watch App` folder called `LandmarkList.swift` that targets only `WatchLandmarks Watch App` and removed the membership from the old target.

8. `Copy the Content of the Old LandmarkList to the New, but Without the Frame Modifier:`
- I copied the contents of the old `LandmarkList` into the new one, but without the frame modifier. The content is now the correct width, but each row has too much information.

9. `Go back to LandmarkRow and Add an #if Condition to Prevent Secondary Text from Appearing in a watchOS Build:`
- I went back to `LandmarkRow` and added a `#if` condition to prevent secondary text from appearing in a watchOS build. For the row, using conditional compilation is appropriate because the differences are small.

10. `Select Target Landmarks to See What the List Looks like on iOS:`
- I chose the `Landmarks` target to see what the list looks like on iOS. The changes work fine for iOS, so there is no need to make any updates for that platform.


## `Section 4 - Update List View`

Like `LandmarkRow`, `LandmarkList` already works on macOS, but could use improvements. For example, I'll move the switch to show only favorites to a menu on the toolbar, where it can be accompanied by additional filtering controls.
The changes I'll make will work for both macOS and iOS, but will be difficult to port on watchOS. Fortunately, in the previous section I already split the list into a separate file for watchOS.

### `Summary of section steps:`

`Steps:`

1. `Return to the MacLandmarks Scheme and Add a ToolbarItem with a Menu Inside a New Toolbar Modifier in the LandmarkList File Targeting iOS and macOS:`
- I went back to the `MacLandmarks` scheme and in the `LandmarkList` file that targets iOS and macOS, I added a `ToolbarItem` that contains a `Menu` inside a new toolbar modifier.

2. `Move the Favorites Toggle to the Menu:`
- Moved the favorites switch to the menu. This moves the switch to the toolbar in a platform-specific manner, which has the added benefit of making it accessible no matter how long the list of monuments is or how far the user scrolls down.

3. `Add a FilterCategory Enumeration to Describe Filtering States:`
- Added a `FilterCategory` enum to describe filter states. I matched the case strings to the `Category` enumeration in the `Landmark` structure so they could be compared, and included an `all` case to disable filtering.

4. `Add a Filtering State Variable, with a Default Value of all:`
- Added a filter state variable, with a default value of `all`. By storing the filtering state in the list view, the user can open multiple list view windows, each with its own filter settings, so that the data can be viewed in different ways.

5. `Update filteredLandmarks to Take into account the New Filter Settings, Combined with the Category of a given Place:`
- Updated `filteredLandmarks` to take into account the new filter settings, combined with the category of a given place.

6. `Add a Selector to Menu to Set Filter Category:`
- Added a selector to the menu to configure the filter category. Since the filter has only a few elements, I used the inline selector style to make them all appear together.

7. `Update Navigation Title to Match Filter State:`
- Updated the navigation title to match the filter state. This change will be useful in the iOS app.

8. `Run Target macOS and See How the Menu Operates:`
- I ran the macOS target and saw how the menu operates.

9. `Choose Target Landmarks and Make Sure You're in Live Preview to See the New Filtering Works Well for iOS Too:`
- I chose the `Landmarks` target and made sure I was in the live preview to see that the new filtering works well for iOS as well.



## `Section 5 - Add a built-in menu command`

When you create an app using the SwiftUI lifecycle, the system automatically creates a menu with commonly needed items, such as those for closing the window later or exiting the app. SwiftUI allows you to add other common commands with built-in behavior, as well as completely custom commands.
In this section, I will add a system-provided command that allows the user to toggle the sidebar, so that it can be brought back after closing it by dragging it.

### `Summary of section steps:`

`Steps:`

1. `Return to the MacLandmarks Target, Run the macOS Application and Drag the Separator between the List and Details View All the Way to the Left:`
- I went back to the `MacLandmarks` target, ran the macOS app and dragged the separator between the list and details view all the way to the left. When I released the mouse button, the list disappeared. You can click the toolbar button to bring it back, but you can also enter a menu command to control this.

2. `Add a New Swift File Called LandmarkCommands.swift and Set Its Targets to Include Both macOS and iOS:`
- Added a new Swift file called `LandmarkCommands.swift` and set its targets to include both macOS and iOS. I also targeted iOS because the shared list of places will eventually depend on some of the types you define in this file.

3. `Import SwiftUI and Add a LandmarkCommands Structure Conforming to the Commands Protocol, with a Calculated Body Property:`
- Imported SwiftUI and added a `LandmarkCommands` structure conforming to the `Commands` protocol, with a computed body property. Like a view structure, a command structure requires a computed body property that uses the semantics of a constructor, except with commands instead of views.

4. `Add a SidebarCommands to the Body:`
- Added a `SidebarCommands` command to the body. This built-in command set includes the command to toggle the sidebar. To make use of the commands in an application, you must apply them to a scene, which I will do next.

5. `Open the LandmarksApp File and Apply LandmarkCommands Using the Scene Modifier commands(content:):`
- I opened the `LandmarksApp` file and applied `LandmarkCommands` using the `commands(content:)` scene modifier. Scene modifiers work like view modifiers, except that you apply them to scenes instead of views.

6. `Run the macOS Application Again and See that You Can Use the Menu Command View > Show Sidebar to Restore List View:`
- I ran the macOS app again and saw that I could use the `View > Show Sidebar` menu command to restore the list view. Unfortunately, the watchOS app does not compile because `Commands` is not available for watchOS. I'll fix that next.

7. `Add a Condition around the Bypass Command Modifier for the watchOS Application:`
- Added a condition around the command modifier to ignore it for the watchOS app. The watchOS app is compiled again.



## `Section 6 - Added a custom menu command`

In the previous section, I added a set of built-in menu commands. In this section, I added a custom command to toggle the favorite status of the currently selected waypoint. I used a focused link to know which waypoint was selected.

### `Summary of section steps:`

`Steps:`

1. `In LandmarkCommands, Extend the FocusedValues Structure with a selectedLandmark Value, Using a Custom Key Called SelectedLandmarkKey:`
- Extended the `FocusedValues` structure with a `selectedLandmark` value, using a custom key called `SelectedLandmarkKey`. The pattern for defining focused values is similar to the pattern for defining new environment values: it uses a private key to read and write a custom property to the system-defined `FocusedValues` structure.

2. `Add a @FocusedBinding Property Wrapper to Track the Currently Selected Landmark:`
- Added a `@FocusedBinding` property wrapper to track the currently selected landmark. I'm reading the value here. You'll set it later in the list view, where the user makes the selection.

3. `Add a New CommandMenu to your Commands Called Landmarks:`
- Added a new `CommandMenu` to your commands called `Landmarks`. You will define the content of the menu below.

4. `Add a Button to the Menu that Changes the Favorite Status of the Selected Landmark and Has an Appearance that Changes Depending on the Currently Selected Landmark and its State:`
- Added a button to the menu that changes the favorite status of the selected landmark and has an appearance that changes depending on the currently selected landmark and its status.

5. `Add a Keyboard Shortcut to the Menu Item with the Modifier keyboardShortcut(_:modifiers:):`
- Added a keyboard shortcut for the menu item with the modifier `keyboardShortcut(_:modifiers:)`. SwiftUI automatically displays the keyboard shortcut in the menu. The menu now contains your new command, but you need to set the focused link `selectedLandmark` for it to work.

6. `In LandmarkList, Add a State Variable for the Selected Landmark and a Calculated Property Indicating the Index of the Selected Landmark:`
- Added a state variable for the selected landmark and a calculated property indicating the index of the selected landmark.

7. `Initialize the List with a Link to the Selected Value and Add a Label to the Navigation Link:`
- I initialized the list with a link to the selected value and added a label to the navigation link. The tag associates a particular landmark with the given item in the `ForEach`, which then drives the selection.

8. `Add the focusedValue(::) Modifier to the NavigationSplitView, Providing a Bind to the Value from the Landmarks Array:`
- Added the `focusedValue(_:_:)` modifier to `NavigationSplitView`, providing a link to the value from the landmarks array. I do a search here to make sure I'm modifying the landmark stored in the model and not a copy.

9. `Run the macOS App and Test the New Menu Item:`
- I ran the macOS app and tried the new menu item.


## `Section 7 - Added preferences with a settings scene`

Users expected to be able to adjust settings for a macOS app using the standard Settings menu item. I added preferences to MacLandmarks by adding a Settings scene. Scene views define the content of the preferences window, which I used to control the initial zoom level of the MapView. It communicated the value to the map view and stored it persistently using the `@AppStorage` property wrapper.

### `Summary of section steps:`

I started by adding a control in MapView that set the initial zoom to one of three levels: close, medium, or far.

`Steps:`

1. `In MapView, Add a Zoom Enumeration to Characterize the Zoom Level:`
- Added a `Zoom` enum to characterize the zoom level in the MapView.

2. `Add a @AppStorage Property Called zoom that Takes the Default Medium Zoom Level:`
- Added a `@AppStorage` property called `zoom` that defaults to the medium zoom level. I used a storage key that uniquely identifies the parameter, like you would when storing elements in `UserDefaults`, because that's the underlying mechanism that SwiftUI relies on.

3. `Change the Delta Longitude and Latitude Used to Construct the Region Property to a Zoom-Dependent Value:`
- Changed the longitude and latitude delta used to construct the `region` property to a value that depends on `zoom`. Next, you'll create a Settings scene that controls the stored zoom value.

4. `Create a New SwiftUI View Called LandmarkSettings That Only Targets the macOS Application:`
- I created a new SwiftUI view called `LandmarkSettings` that only targets the macOS app.

5. `Add an @AppStorage Property That Uses the Same Key You Used in the Map View:`
- Added a `@AppStorage` property that uses the same key you used in the map view.

6. `Add a Selector that Controls the Zoom Value Via a Link:`
- Added a Selector that controls the zoom value via a link. Typically, a form is used to organize controls in the configuration view.

7. `In LandmarksApp, Add the Settings Scene to your App, but Only for macOS:`
- Added the settings scene to the app in `LandmarksApp`, but only for macOS.

8. `Run the Application and Test Changing the Settings:`
- I ran the application and tried changing the settings. Notice that the map updates every time you change the zoom level.




