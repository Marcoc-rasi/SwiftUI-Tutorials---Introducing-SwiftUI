# `Chapter 4 - Framework Integration`

I used SwiftUI views along with platform-specific UI frameworks' views and view controllers.

## `Unit 4.1 - Interacting with UIKit - Introduction`

I worked with SwiftUI to make it work seamlessly with existing UI frameworks across all Apple platforms. For example, I was able to place UIKit views and view controllers inside SwiftUI views, and vice versa. In this tutorial, I converted the Home Screen Featured Landmark to wrap instances of UIPageViewController and UIPageControl. I used UIPageViewController to display a carousel of SwiftUI views, and used state variables and bindings to coordinate data updates throughout the UI.

- `Section 1`: I created a view to represent a UIPageViewController
- `Section 2`: I created the view controller data source
- `Section 3`: Followed the page in the state of a SwiftUI view
- `Section 4`: I added a custom page control

## `Unit 4.2 - Creating an app for watchOS - Introduction`

In this tutorial, I had the opportunity to apply much of what I had already learned about SwiftUI and, with little effort, migrate the Landmarks app to watchOS. I started by adding a watchOS target to my project, before copying the shared data and views I created for the iOS app. With all the resources in place, I customized the SwiftUI views to display the detail and list views in watchOS.

- `Section 1`: Added a watchOS target
- `Section 2`: I shared files between targets
- `Section 3`: I created the detailed view
- `Section 4`: Added the list of emblematic places
- `Section 5`: I created a custom notification interface

## `Unit 4.3 - Creating a macOS application - Introduction`

After building a version of the Landmarks app for watchOS, it's time to look at something bigger: bringing Landmarks to Mac. I'll build on everything I've learned so far, to complete the experience of building a SwiftUI app for iOS, watchOS, and macOS. I'll start by adding a macOS target to my project and then reuse views and data I created earlier. With a foundation in place, I'll add some new views designed for macOS and modify others to work better on all platforms.

- `Section 1`: Add a macOS target to the project
- `Section 2`: Create a detailed view for macOS
- `Section 3`: Update row view
- `Section 4`: Update list view
- `Section 5`: Add a built-in menu command
- `Section 6`: Added a custom menu command
- `Section 7`: Added preferences with a settings scene
