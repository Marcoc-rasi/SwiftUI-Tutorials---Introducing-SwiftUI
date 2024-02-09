# `Unit 4.1 - Interacting with UIKit - Introduction`

I worked with SwiftUI to make it work seamlessly with existing UI frameworks across all Apple platforms. For example, I was able to place UIKit views and view controllers inside SwiftUI views, and vice versa. In this tutorial, I converted the Home Screen Featured Landmark to wrap instances of UIPageViewController and UIPageControl. I used UIPageViewController to display a carousel of SwiftUI views, and used state variables and bindings to coordinate data updates throughout the UI.

## `Section 1 - I created a view to represent a UIPageViewController`

To render UIKit views and view controllers in SwiftUI, I created types that conform to the UIViewRepresentable and UIViewControllerRepresentable protocols. My custom types created and configured the UIKit types they represented, while SwiftUI managed their lifecycle and updated them when necessary.

### `Summary of Section Steps`

`Steps:`

1. `Create PageView Group and Add PageViewController:`
- I created a group called `PageView` in the `Views` folder of your project.
- Added a new Swift file called `PageViewController.swift` and declared the type `PageViewController` as conforming to `UIViewControllerRepresentable`.
- The page view controller stores an array of `Page` instances, which must be of type `View`. These are the pages you use to move between landmarks.
- Added the two `UIViewControllerRepresentable` protocol requirements.
   
2. `Implement makeUIViewController(context:) Method:`
- Added the `makeUIViewController(context:)` method that creates a `UIPageViewController` with the desired settings.
- SwiftUI calls this method only once when it is ready to display the view and then manages the lifecycle of the view controller.
   
3. `Implement updateUIViewController(_:context:) Method:`
- Added the `updateUIViewController(:context:)` method that calls `setViewControllers(:direction:animated:)` to provide a view controller for display.
- For now, you create the `UIHostingController` that hosts the SwiftUI view of the page on each refresh. Later, you will make this more efficient by initializing the controller only once during the life of the page view controller.
   
4. `Prepare a Features Card to Use as a Page:`
- Drag the images from the `Resources` directory of the downloaded project files to your application asset catalog.
- The feature image of a landmark, if it exists, has different dimensions than the regular image.
   
5. `Add Calculated Property to Landmark Structure:`
- Added a computed property to the `Landmark` structure that returns the feature image, if it exists.
   
6. `Create FeatureCard.swift File and Display Text on Image:`
- Added a new SwiftUI file called `FeatureCard.swift` which displays the benchmark feature image.
- I included the aspect ratio modifier to mimic the aspect ratio of the view where `FeatureCard` will be previewed later.
- I superimposed text information on the image.
   
7. `Create PageView.swift File and Configure PageViewController as a Secondary View:`
- Created a new SwiftUI file called `PageView.swift` and updated the `PageView` type to declare `PageViewController` as a child view.
- Preview fails because Xcode cannot infer a type for `Page`.
   
8. `Add Aspect Ratio Modifier and Update Preview:`
- I added the aspect ratio modifier and updated the preview to pass the required array of views, and the preview starts working.


## `Section 2 - I created the view controller data source`

In a few short steps, I did a lot: The PageViewController uses a UIPageViewController to display content from a SwiftUI view. Now it's time to enable swipe interactions to move from page to page.

### `Summary of Section Steps`

`Steps:`

1. `Declare a Nested Coordinator Class:`
- I declared a Coordinator class nested inside `PageViewController`.
- SwiftUI manages the coordinator of your `UIViewControllerRepresentable` type and provides it as part of the context when calling the methods you created earlier.
   
2. `Add a Method to Create the Coordinator:`
- Added another method to `PageViewController` to create the coordinator.
- SwiftUI calls this `makeCoordinator()` method before `makeUIViewController(context:)`, so that you have access to the coordinator object when configuring your view controller.
- Tip: You can use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events using the target action.
   
3. `Initialize an Array of Controllers in the Coordinator:`
- Initialized an array of controllers in the coordinator using the `pages` views array.
- The coordinator is a good place to store these controllers, because the system initializes them only once and before you need them to update the view controller.
   
4. `Add Compliance to UIPageViewControllerDataSource:`
- Added conformance to `UIPageViewControllerDataSource` to the `Coordinator` type and implemented the two required methods.
- These two methods establish the relationships between the view controllers, so you can move back and forth between them.
   
5. `Add the Coordinator as the DataSource of the UIPageViewController:`
- Added the coordinator as the data source of the `UIPageViewController`.
   
6. `Return to PageView and Test Scroll Interactions:`
- I went back to `PageView`, made sure it was in live mode and tried the scrolling interactions.


## `Section 3 - Follow the page in the state of a SwiftUI view`

To prepare to add a custom UIPageControl, I needed a way to track the current page from within the PageView. To achieve this, I declared a @State property on the PageView and passed a binding to this property down to the PageViewController view. The PageViewController updates the link to match the visible page.

### `Summary of Section Steps`

`Steps:`

1. `Add a Bidirectional Link currentPage:`
- I started by adding a bidirectional `currentPage` binding as a property of `PageViewController`.
- In addition to declaring the `@Binding` property, I updated the call to `setViewControllers(_:direction:animated:)`, passing the value of the `currentPage` binding.
   
2. `Declare @State Variable in PageView:`
- I declared the `@State` variable in `PageView` and passed a binding to the property when creating the child `PageViewController`.
- Important: Remember to use the `$` syntax to create a link to a value that is stored as state.
   
3. `Test that the Value Flows through the Bind to the PageViewController:`
- I tested that the value flows through the binding to the `PageViewController` by changing its initial value.
- Experiment: Added a button to `PageView` that makes the page view controller jump to the second view.
   
4. `Add a Text with the currentPage Property:`
- I added a text with the `currentPage` property to be able to observe the value of the `@State` property.
- I noticed that when sliding from one page to another, the value does not change.
   
5. `Set the Coordinator to UIPageViewControllerDelegate:`
- In `PageViewController.swift`, I set the coordinator to `UIPageViewControllerDelegate` and added the `pageViewController(_:didFinishAnimating:previousViewControllers:transitionCompleted completed: Bool)` method.
- Because SwiftUI calls this method every time a page flip animation completes, I was able to find the index of the current view controller and update the link.
   
6. `Assign the Coordinator as Delegate of the UIPageViewController:`
- Assigned the coordinator as the delegate for the `UIPageViewController`, in addition to the data source.
- With the link connected in both directions, the text updates to show the correct page number after each swipe.


## `Section 4 - I added a custom page control`

I was ready to add a custom UIPageControl to my view, wrapped in a SwiftUI UIViewRepresentable view.

### `Summary of Section Steps`

`Steps:`

1. `Create a New SwiftUI View File:`
- I created a new SwiftUI view file called `PageControl.swift`.
- Updated the `PageControl` type to conform to the `UIViewRepresentable` protocol.
   
2. `Replace Text Box with Page Control in PageControl:`
- Replaced the textbox with the page control, changing from a `VStack` to a `ZStack` for the layout.
- Since I am passing the page count and the link to the current page, the page control is already displaying the correct values.
- Next, I made the page control interactive so that users can tap one side or the other to move between pages.
   
3. `Create a Nested Coordinator Type in PageControl:`
- I created a coordinator type nested in `PageControl` and added a `makeCoordinator()` method to create and return a new coordinator.
- Since UIControl subclasses like UIPageControl use the target-action pattern instead of delegation, this coordinator implements a `@objc` method to update the current page link.
   
4. `Add Coordinator as Target for Event valueChanged:`
- Added the coordinator as the target for the `valueChanged` event, specifying the `updateCurrentPage(sender:)` method as the action to perform.
   
5. `Finally, in CategoryHome, Replace the Feature Image with the New Page View:`
- Replaced the placeholder feature image with the new page view in `CategoryHome`.
   
6. `Try All the Different Interactions:`
- I tried all the different interactions. `PageView` demonstrates how UIKit and SwiftUI views and controllers can work together.

# Final Unit App

https://github.com/Marcoc-rasi/SwiftUI-Tutorials---Introducing-SwiftUI/assets/51039101/a004cc62-d8ce-42ed-86ad-cafa65cfdf9f
