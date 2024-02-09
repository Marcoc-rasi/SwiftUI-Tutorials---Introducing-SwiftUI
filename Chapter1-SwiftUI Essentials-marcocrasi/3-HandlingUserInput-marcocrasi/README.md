# `Unit 1.3 Handling User Input - Introduction`

In the Landmarks app, a user can mark their favorite places and filter the list to show only their favorites. To create this feature, I'll start by adding a toggle to the list so users can focus only on their favorites, and then I'll add a star button that a user will tap to mark a landmark as a favorite.

## `Section 1 Mark favorite landmarks`

Start by improving the list to show people their favorites at a glance. Add a property to the Landmark structure to read the initial status of a landmark as a favorite, and then add a star to each LandmarkRow that displays a favorite landmark.

### `Summary of Section Steps`

**Steps:**
1. **Open the Project in Xcode:**
- I opened the Xcode project from the starting point or the project you finished in the previous tutorial, and selected Landmark in the Project Navigator.
2. **Add the isFavorite Property in the Landmark Structure:**
- Added an isFavorite property to the Landmark structure.
- The `landmarkData` file has a key with this name for each landmark. Because Landmark is Codable compliant, you can read the value associated with the key by creating a new property with the same name as the key.
3. **Select LandmarkRow in the Project Navigator:**
- I selected LandmarkRow in the Project Navigator.
4. **Add a Star Image Inside an if Statement:**
- After the spacer, I added a star image inside an if statement to check if the current landmark is a favorite.
- In SwiftUI blocks, if statements are used to conditionally include views.
5. **Modify the Color of System Images with `foregroundStyle(_:)`:**
- Since system images are vector, you can change their color with the foregroundStyle(_:) modifier.
- The star is present whenever the isFavorite property of a reference point is true. You'll see how to modify that property later in this tutorial.

## `Section 2 Filter List View`

I customized the list view to show all landmarks or just my favorites. To achieve this, I had to add some state to the LandmarkList type. State was a value or set of values that could change over time and that affected the behavior, content, or layout of a view. I used a property with the @State attribute to add state to a view.

### `Summary of Section Steps`

**Steps:**
1. **Select LandmarkList in the Project Navigator:**
- I selected LandmarkList in the Project Navigator.
2. **Add a `@State` Property called showFavoritesOnly:**
- Added a `@State` property called showFavoritesOnly with its initial value set to false.
- Because state properties (@State) are used to hold information specific to a view and its subviews, I always create states as private.
3. **Automatically Update View When Making Changes:**
- When you make changes to your view structure, such as adding or modifying a property, the preview updates automatically.
- **Tip:** If the preview is not visible, select Editor > Preview to show it.
4. **Calculate a Filtered Version of the Reference Point List:**
- I calculated a filtered version of the list of landmarks by checking the showFavoritesOnly property and the isFavorite value of each landmark.
5. **Use Filtered Version in Waypoint List:**
- I used the filtered version of the waypoint list in the List component.
6. **Change the Initial Value of `showFavoritesOnly` to true:**
- I changed the initial value of showFavoritesOnly to true to see how the list reacts.

## `Section 3 Add a Control to Toggle State`

To give the user control over the list filter, I had to add a control that could change the value of showFavoritesOnly. I did this by passing a link to a toggle control. A link acts as a reference to a mutable state. When a user taps the switch from off to on and then back to off, the control uses the link to update the view state accordingly.

### `Summary of section steps

**Steps:**
1. **Create a Nested ForEach Group to Transform Reference Points into Rows:**
- Created a nested ForEach group to transform waypoints into rows.
- To combine static and dynamic views into a list, or to combine two or more different groups of dynamic views, use the ForEach type instead of passing your data collection to List.
2. **Add a Toggle View as the First Child of the List View:**
- Added a Toggle view as the first child of the List view, passing a link to showFavoritesOnly.
- The $ prefix is used to access a link to a state variable, or one of its properties.
3. **Improve Filtering Animation by Adding the `animation(_:)`: Modifier**
- Improved the filtering animation by adding the animation(_:) modifier that starts when the value of filteredLandmarks changes.
4. **Before Proceeding, Restore the Default Value of `showFavoritesOnly` to false:**
- Before moving forward, I reverted showFavoritesOnly to the default value of false.
5. **Use Live Preview and Try the New Feature by Tapping the Switch:**
- I used the live preview and tested this new functionality by tapping the switch.

## `Section 4 Use observation for storage`

To prepare for the user to control which particular landmarks are favorites, I first stored the landmark data using the Observable() macro. With observation, a view in SwiftUI can support data changes without using property wrappers or bindings. SwiftUI watches for any changes to observable properties that could affect a view and displays the correct version of the view after a change.

### `Summary of Section Steps`

**Steps:**
1. **Select ModelData in the Project Navigation Panel:**
- I selected ModelData in the project navigation panel.
2. **Declare a New Model Type Using the Observable() Macro:**
- I declared a new model type using the Observable() macro.
- SwiftUI updates a view only when an observable property changes and the view body reads the property directly.
3. **Move the Reference Point Array to the Model:**
- Moved the reference points array to the model.
- **Tip:** You can use Command + Option + { or } to move selected lines of code up or down, respectively.

## `Section 5 Adopt the model object into your views`

Now that I have created the ModelData object, I need to update my views to adopt it as the data store for my application.

### `Summary of Section Steps`

**Steps:**
1. **In LandmarkList, Add the Property Marker `@Environment` and the Modifier `environment(_:)` in the Preview:**
- In LandmarkList, I added the `@Environment` property marker to the view and the `environment(_:)` modifier to the preview.
- The `modelData` property gets its value automatically, as long as the `environment(_:)` modifier has been applied to a parent. The `@Environment` property flag allows you to read data from the current view's model. Adding the `environment(_:)` modifier passes the data object through the environment.
2. **Use `modelData.landmarks` as Data When Filtering Landmarks:**
- Used `modelData.landmarks` as data when filtering landmarks.
3. **Update the LandmarkDetail View to Work with the ModelData Object in the Environment:**
- Updated the details view (LandmarkDetail) to work with the ModelData object in the environment.
4. **Update LandmarkRow Preview to Work with ModelData Object:**
- Updated the LandmarkRow preview to work with the ModelData object.
5. **Update the ContentView Preview to Add the Model Object to the Environment:**
- Updated the ContentView preview to add the Model object to the environment, making the object available to any subview.
- A preview fails if any subview requires a model object in the environment, but the view you are previewing does not have the `environment(_:)` modifier.
6. **Update LandmarksApp to Create a Model Instance and Supply It to ContentView Using the `environment(_:):):` Modifier**
- Updated LandmarksApp to create an instance of the model and supply it to the ContentView using the `environment(_:).` modifier
- I used the `@State` attribute to initialize a model object in the same way it is used to initialize properties within a view. Just like SwiftUI initializes state in a view only once during the lifetime of the view, it initializes state in an app only once during the lifetime of the app.
7. **Return to LandmarkList to Verify Everything is Working Correctly:**
- I went back to LandmarkList to verify that everything is working correctly.

## `Section 6 Create a favorites button for each iconic place`

The Landmarks app can now switch between a filtered and unfiltered view of landmarks, but the list of favorite landmarks is still hard-coded. To allow the user to add and remove favorites, I need to add a favorites button to the landmark detail view.

### `Summary of Section Steps`

**Steps:**
1. **Create a New View Called `FavoriteButton.swift`:**
- I created a new view called `FavoriteButton.swift`.
2. **Add an `isSet` Binding That Indicates the Current State of the Button:**
- Added an `isSet` binding that indicates the current state of the button and provided a constant value for the preview.
- The property binding wrapper allows you to read and write between a property that stores data and a view that displays and changes the data. Due to the use of binding , changes made within this view are propagated back to the data source.
3. **Create a Button with an Action that Toggles State and Changes Its Appearance Based on State:**
- Created a button with an action that toggles the state of `isSet` and changes its appearance based on the state.
- The title string you provide for the button label does not appear in the UI when you use the `iconOnly` label style, but VoiceOver uses it to improve accessibility.
4. **Group General Purpose Files into a Helper Group, and Landmark Views into a Landmarks Group:**
- I collected the general purpose files, such as CircleImage, MapView and FavoriteButton, into a Helpers group, and the landmark views into a Landmarks group.
5. **Add the FavoriteButton to the Details View, Binding the `isSet` Property of the Button to the `isFavorite` Property of a Specific Reference Point:**
- Switched to LandmarkDetail and calculated the input landmark index by comparing it to the model data.
- To support this, you also need access to the model data in the environment.
6. **Within the body Property, Add the Model Data Using a Bindable Wrapper. Embed the Waypoint Name in an HStack with a New FavoriteButton; Provide a Link to the `isFavorite` Property with the Dollar Sign ($):**
- Inside the body property, I added the model data using a Bindable wrapper. I embedded the waypoint name in an HStack with a new FavoriteButton; I provided a link to the `isFavorite` property with the dollar sign ($).
- Used `landmarkIndex` with the `modelData` object to ensure that the button updates the `isFavorite` property of the landmark stored in your model object.
7. **Go back to LandmarkList and Make sure Live Preview is On:**
- I went back to LandmarkList and made sure the live preview was on.
- As you navigate from the list to the details and tap the button, those changes persist when you return to the list. Because both views access the same model object in the environment, the two views maintain consistency.

