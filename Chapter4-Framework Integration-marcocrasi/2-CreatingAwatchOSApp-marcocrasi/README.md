# `Unit 4.2 - Creating an app for watchOS - Introduction`

In this tutorial, I had the opportunity to apply much of what I had already learned about SwiftUI and, with little effort, migrate the Landmarks app to watchOS. I started by adding a watchOS target to my project, before copying the shared data and views I created for the iOS app. With all the resources in place, I customized the SwiftUI views to display the detail and list views in watchOS.

## `Section 1 - Added a watchOS target`

To create an app for watchOS, I started by adding a watchOS target to the project. Xcode added groups and files for the watchOS app to my project, along with the schematics needed to build and run the app.

### `Summary of my steps in this section.`

`Steps:`

1. `Create a New Destination:`
- Choose File > New > Target.
- In the templates window, select the watchOS tab.
- Select the App template and click Next.
   
2. `Set New watchOS App Target:`
- In the settings window, enter `WatchLandmarks` as the Product Name.
- Select the Watch App for Existing iOS App option.
- Click Finish.
   
3. `Activate WatchLandmarks App Schema:`
- When Xcode asks to activate the `WatchLandmarks` Watch App scheme, click Activate.
- This enables the start of the job with the new destination.
   
4. `Select a watchOS Device:`
- Select `Apple Watch Series 9 (45mm)` from the watchOS Simulators drop-down menu.
   
5. `Configure Destination Options:`
- Select the target `WatchLandmarks Watch App`.
- Go to the General tab of the objective.
- Select the Supports Running Without iOS App Installation checkbox.


## `Section 2 - Share files between targets`

With the watchOS target set up, I needed to share some resources from the iOS target. I reused the Landmark app's data model, some resource files, as well as any views that both platforms could display without modification.

### `Summary of my steps in this section.`

First, I removed the entry point for the watchOS app. I didn't need it because it would reuse the entry point defined in LandmarksApp instead.

`Steps:`

1. `Delete WatchLandmarksApp File:`
- I navigated to the Project navigator and deleted the `WatchLandmarksApp` file in the `WatchLandmarks Watch App` folder. When prompted, I selected "Move to Trash".

2. `Select Files Shared with watchOS:`
- I held down the Command key and selected the files that my watchOS target can share with the existing iOS app, including the app's entry point.

3. `Add Shared View Files:`
- I continued holding Command key and selected key view files like `LandmarksApp`, `LandmarkList`, `LandmarkRow`, `CircleImage`, `MapView`. These files are views that the app can display on watchOS without changes.

4. `Add Shared Model Files:`
- Continued holding Command key and added important model files like `ModelData`, `Landmark`, `Hike`, `Profile`. These files define the data model of the application.

5. `Add File Shares:`
- I ended up holding down the Command key to add resource files needed for the model: `landmarkData`, `hikeData`, and `Assets`.

6. `Assign Files to watchOS Target:`
- In the file inspector, I selected the `WatchLandmarks Watch App` checkbox in the "Target Membership" section. This makes the symbols selected in the previous steps available to the watchOS app.

7. `Add watchOS App Icon:`
- I selected the `Assets` file in the `WatchLandmarks Watch App` folder and navigated to the empty `AppIcon` set.

8. `Drag the PNG File:`
- I dragged the single PNG file from the downloaded project's Resources folder into the existing empty `AppIcon` set.

9. `Set watchOS App Icon:`
- Making sure that later when I create a notification, the system presents my app icon to help identify the source of the notification.


## `Section 3 - I created the detailed view`

Now that the iOS target resources are in place to work on the clock app, I needed to create a specific view for the clock to display the details of the landmark. To test the detailed view, I created custom previews for the largest and smallest watch sizes, and made some changes to the circle view to make everything fit on the watch face.

### `Summary of my steps in this section.`

`Steps:`

1. `Add Custom View:`
- Added a new custom view to the `WatchLandmarks Watch App` folder called `LandmarkDetail.swift`. This file is distinguished from the file of the same name in the iOS project by its membership in the target, applying only to the `WatchLandmarks Watch App` target.

2. `Add Properties to LandmarkDetail:`
- Added the `modelData`, `landmark`, and `landmarkIndex` properties to the new `LandmarkDetail` structure. These are identical to the properties that were added in the "Handling user input" step.

3. `Set Preview:`
- In the preview, I created an instance of the model data and used it to pass a `landmark` object to the initializer of the `LandmarkDetail` structure. I also set the view environment.

4. `Select Device:`
- I set the device selector so that the preview shows a "Large Watch".

5. `return CircleImage:`
- Returned a `CircleImage` view from the `body()` method. I reused the `CircleImage` view from the iOS project. Since I created a resizable image, the call to `scaledToFill()` adjusts the size of the circle so that it fills the screen.

6. `Change Device Size:`
- I changed the device selector so that the preview shows a "Small Watch". By testing against larger and smaller watch faces, you can see how the app adjusts to different screen sizes.

7. `Add Information in VStack:`
- I embedded the circular image in a `VStack`. I showed the name of the featured place and its information below the image.

8. `Wrap in ScrollView:`
- I wrapped the vertical stack in a `ScrollView`. This triggers view scrolling, but creates another problem: the circular image now expands to full size and resizes other UI elements to match the image size.

9. `Adjust Scale and Add Padding:`
- Changed `scaleToFill()` to `scaleToFit()` and added padding. This scales the circle image to match the width of the screen and ensures that the highlight name is visible below the circle image.

10. `Add MapView and Divider:`
- Added the `MapView` after a divider. The map appears off-screen, but you can scroll down to view it.

11. `Add Title to Back Button:`
- Added a title to the back button. This sets the back button text to "Landmarks".


## `Section 4 - I added the list of emblematic places`

The LandmarkList I created for iOS works for my watch app as well, and automatically navigates to the watch-specific detail view I just created when building for watchOS. Next, I connected the list to the watch's ContentView, to act as the top-level view for the watch app.

### `Summary of my steps in this section.`

`Steps:`

1. `Select ContentView:`
- I selected `ContentView` in the `WatchLandmarks Watch App` folder. Like `LandmarkDetail`, the content view for the watchOS target has the same name as the iOS target. Keeping names and interfaces the same makes it easier to share files between targets.

2. `Modify ContentView:`
- Modified `ContentView` to show the `List` view. Making sure to provide the model data as an environment for the preview. `LandmarksApp` already provides this at the app level at runtime, just as it does for iOS, but it also needs to be provided for any previews that need it.

3. `See Real Time Preview:`
- Making sure I am in the real-time preview to observe the behavior of the application.


## `Section 5 - I created a custom notification interface`

My version of Landmarks for watchOS is almost complete. In this final section, I created a notification interface that displays landmark information whenever I receive a notification that I'm near one of my favorite places.

### `Summary of my steps in this section.`

`Steps:`

1. `Add a New Custom View:`
- Added a new custom view called `NotificationView.swift` to the `WatchLandmarks Watch App` folder. I created a view that shows information about a milestone, title and message.

2. `Add Preview:`
- Added a preview that sets the title, message, and milestone properties for the notification view. This shows a preview of the notification when data is provided. Since any notification value can be null, it is useful to keep the default preview of the notification view when no data is provided.

3. `Create Notification Controller:`
- I created a new Swift file called `NotificationController.swift` and added a hosting controller structure that includes the `landmark`, `title` and `message` properties. These properties store values about an incoming notification.

4. `Update `body()` Method:`
- Updated the `body()` method to use these properties. This method instantiates the notification view that was created earlier.

5. `Define the Key `landmarkIndexKey`:`
- I defined the key `landmarkIndexKey`. This key is used to extract the milestone index from the notification.

6. `Add `didReceive(_:)` Method:`
- Added `didReceive(_:)` method to parse notification data. This method updates the properties of the controller. After calling this method, the system overrides the controller's `body` property, which updates your notification view. The system then displays the notification on Apple Watch.

7. `Add Notification Scene to `LandmarksApp`:`
- I went to `LandmarksApp` and added a `WKNotificationScene` using the `LandmarkNear` category. The scene only makes sense for watchOS, so I added conditional compilation.

8. `Request Authorization for Notifications:`
- I went to `ContentView` and requested authorization to enable notifications from the Notification Center. I made the request using an asynchronous task modifier that SwiftUI calls when the content view first appears. I configured the test load to use the `LandmarkNear` category and pass the expected data by the notification handler.

9. `Add Notification Simulation File:`
- Added a new notification simulation file called `PushNotificationPayload.apns` to the `WatchLandmarks Watch App` folder. I did not add the `PushNotificationPayload` file to any targets, because it is not part of the application.

10. `Update Simulation File Properties:`
- Updated the title, body, category, landmarkIndex and `Simulator Target Bundle` properties. Making sure to set the category to `LandmarkNear`. I also removed any keys that were not used in the tutorial, such as the subtitle, WatchKit Simulator Actions, and customKey.

11. `Compile and Run in the Simulator:`
- Compiled and ran the `WatchLandmarks Watch App` scheme in a simulator. The first time you run the app, the system asks for permission to send notifications. I selected `Allow`.

12. `Simulate a Notification:`
- After granting permission, I used Xcode to stop the app and then dragged the `PushNotificationPayload` file over the watch face in the simulator. The simulator displays a scrollable notification that includes: the app icon to help identify the Landmarks app as the sender, the notification view, and buttons for notification actions.

# Final Unit App

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/33c54d37-3697-4c24-ab3a-5e8c6fc09977

