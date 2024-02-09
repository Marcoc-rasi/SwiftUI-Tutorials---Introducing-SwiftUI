# `Unit 3.2 - Working with UI Controls - Introduction`

In the Landmarks app, users can create a profile to express their personality. To give users the ability to change their profile, I will add an edit mode and style the preferences screen. I will work with a variety of common UI controls for data entry and update the Landmarks model types each time the user saves their changes.

## `Section 1 - Show a user profile`

The Landmarks app stores some configuration details and preferences locally. Before the user edits their details, they are displayed in a summary view that has no editing controls.

### `Summary of Section Steps`

`Steps:`
1. `Define a User Profile in a New Swift File Called Profile.swift:`
- I started by defining a user profile in a new Swift file called Profile.swift, which I added to my project's Model group.
2. `Create a New Group called Profiles under the Views Group, and Then Add a View Called ProfileHost with Text Showing the Username of a Stored Profile:`
- I created a new group called Profiles under the Views group and then added a view called ProfileHost to that group, with text showing the username of a stored profile.
- The ProfileHost view will host both a static summary view of profile information and an edit mode.
- Note: I set draftProfile here as a default profile as a placeholder until I enter the model data profile later.
3. `Create Another View in the Profiles Group Called ProfileSummary That Takes a Profile Instance and Shows Some Basic User Information:`
- I created another view in the Profiles group called ProfileSummary that takes a Profile instance and displays some basic user information.
- The profile summary takes a value of Profile instead of a link to the profile because the parent view, ProfileHost, manages the state of this view.
4. `Refresh ProfileHost to Show New Summary View:`
- Updated ProfileHost to show the new summary view.
5. `Create a New View Called HikeBadge in the Hikes Folder That Makes Up the Hiking Badge with Descriptive Text about the Hike:`
- I created a new view called HikeBadge in the Hikes folder that composes the Badge from drawing strokes and shapes along with descriptive text about the hike.
- The badge is simply graphical, so the text in HikeBadge along with the accessibilityLabel(_:) modifier, make the meaning of the badge clearer to other users.
- Note: The badge drawing logic produces a result that depends on the size of the frame it is rendered on. To ensure the desired look, I rendered in a 300 x 300 point frame. To get the desired size for the final graphic, I then scaled the rendered result and placed it in a comparatively smaller frame.
6. `Update ProfileSummary to Add Multiple Badges with Variable Tones and Reasons for Earning the Badge:`
- Updated ProfileSummary to add multiple badges with varying shades and reasons for earning the badge.
7. `Conclude the Profile Summary Including a HikeView of the Views and Animated Transitions:`
- Concluded the profile summary by including a HikeView of the views and animated transitions.
- To use walk data, you also need to add a model data environment property.
8. `In CategoryHome, Add a User Profile Button to the Navigation Bar Using the Toolbar Modifier, and Present the ProfileHost View when the User Taps the Button:`
- In CategoryHome, I added a user profile button to the navigation bar using the toolbar modifier and presented the ProfileHost view when the user taps the button.
9. `Add the listStyle Modifier to Select a List Style that Best Fits the Content:`
- Added the listStyle modifier to select a list style that best fits the content.
10. `Make sure you are in Live Preview and Try Tapping the Profile Button to Browse the Profile Summary:`
- I made sure it was in the live preview and tried tapping the profile button to browse the profile summary.


## `Section 2 - Add an editing mode`

Users need to toggle between viewing or editing their profile details. I'll add an edit mode by adding an edit button to the existing ProfileHost, and then creating a view with controls to edit individual values.

### `Summary of Section Steps`

`Steps:`

1. `Select ProfileHost and Add the Model Data as an Environment Property to the Preview:`
- I selected ProfileHost and added the model data as an environment property to the preview.
- Although this view does not use a property with the @Environment property wrapper, ProfileSummary, a child of this view, does. So without the modifier, the preview fails.

2. `Add an Environment View Property that Dependency on the .editMode of the Environment:`
- Added an environment view property that depends on the environment's .editMode.
- SwiftUI provides environment storage for values that you can access using the @Environment property wrapper. Previously, you used @Environment to retrieve a class that you stored in the environment. Here, you use it to access the editMode value that is built into the environment to read or write to the edit scope.

3. `Create an Edit Button that Toggles the Environment's editMode Value:`
- Created an edit button that toggles the editMode value of the environment.
- The edit button controls the same editMode value of the environment that you accessed in the previous step.

4. `Update the ModelData Class to Include a User Profile Instance That Persists Even After the User Closes the Profile View:`
- Updated the ModelData class to include an instance of the user profile that persists even after the user closes the profile view.

5. `Read User Profile Data from the Environment to Pass Data Control to the Profile Host:`
- Read the user profile data from the environment to pass control of the data to the profile host.
- To avoid updating the global state of the application before committing any edit, such as when the user enters their name, the edit view operates on a copy of itself.

6. `Add a Conditional View Showing Either the Static Profile or the View for Edit Mode:`
- Added a conditional view that shows either the static profile or the view for edit mode.
- You can see the effect of entering edit mode by running the live preview and tapping the edit button. For now, the edit mode view is just a static text field.


## `Section 3 - Define the profile editor`

The user profile editor mainly consists of different controls that change individual details in the profile. Some elements in the profile, such as badges, are not editable by the user, so they do not appear in the editor. To maintain consistency with the profile summary, I will add the profile details in the same order in the editor.

### `Summary of Section Steps`

`Steps:`

1. `Create a New View Called ProfileEditor and Include a Binding to the Draft Copy of the User Profile:`
- I created a new view called ProfileEditor and included a link (binding) to the draft copy of the user's profile.
- The first control in the view is a TextField, which controls and updates a string binding, in this case, the display name chosen by the user. You provide a label and a link to a string when creating a text field.

2. `Update the Conditional Content in ProfileHost to Include the Profile Editor and Pass the Profile Binding:`
- Updated the conditional content in ProfileHost to include the profile editor and pass the profile binding.
- The profile edit view is now shown when you tap "Edit".

3. `Add a Toggle that Corresponds to the User's Preference to Receive Notifications about Events Related to Waypoints:`
- Added a toggle that corresponds to the user's preference for receiving notifications about landmark-related events.
- Switches are controls that are on or off, so they are suitable for boolean values such as a yes or no preference.

4. `Place a Picker Control and its Label in the HStack to Make Waypoint Photos Have a Selectable Preferred Station:`
- I placed a Picker control and its label in the HStack to make waypoint photos have a selectable preferred station.

5. `Finally, Add a Date Selector Below the Station Selector to Make the Landmark Visit Goal Date Modifiable:`
- Finally, I added a DatePicker below the station selector to make the target date of visiting a waypoint modifiable.


## `Section 4 - Delay the propagation of the edition`

So that edits don't take effect until the user exits edit mode, I use the staging copy of their profile during editing and then assign the staging copy to the actual copy only when the user commits an edit.

### `Summary of Section Steps`

**Steps:**

`Steps:`

1. `Add a Cancel Button to ProfileHost:`
- Added a Cancel button to ProfileHost.
- Unlike the Done button that EditButton provides, the Cancel button does not apply edits to the actual profile data in its closing block.

2. `Apply the onAppear(perform:) and onDisappear(perform:) Modifiers to Populate the Editor with the Correct Profile Data and Update the Persistent Profile when the User Taps the Done Button:`
- Applied the onAppear(perform:) and onDisappear(perform:) modifiers to populate the editor with the correct profile data and update the persistent profile when the user taps the Done button.
- Otherwise, the old values appear the next time editing mode is activated.


# Final Unit App

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/b277ccda-872e-4e29-9bbd-703ecb52fcaa
