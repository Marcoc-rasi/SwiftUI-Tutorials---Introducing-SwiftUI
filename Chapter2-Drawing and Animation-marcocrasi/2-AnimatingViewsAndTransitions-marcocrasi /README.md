# `Unit 2.2 - Animating views and transitions - Introduction`

When I used SwiftUI, I was able to individually animate changes to views or a view's state, no matter where the effects were. SwiftUI handles all the complexity of these blended, overlapping, and interruptible animations for you.
In this tutorial, I will animate a view that contains a graph to track the walks a user takes while using the Landmarks app. Using the `animation(_ :)` modifier, you'll see how easy it is to animate a view.

## `Section 1 - Add Hiking Data to the App`

Before I can add animation, I'll need something to animate. In this section, I'll import and model hiking data, and then add some pre-built views to display that data statically on a graph.

### `Summary of section steps`

`Steps:`
1. `Drag the hikeData.json File to the Project Resource Group:`
- I dragged the `hikeData.json` file from the downloaded resources folder to the project's resource group.
- Be sure to select "Copy items if necessary" before clicking "Finish".
2. `Create a New Swift File called Hike.swift in the Model Group:`
- I created a new Swift file called `Hike.swift` in the model group using the "File > New > File" menu option.
- Like the `Landmark` structure, the `Hike` structure complies with the `Codable` protocol and has properties that match the keys in the corresponding data file.
3. `Load the Excursion Array into your Model:`
- I loaded the array of excursions into the model.
4. `Drag the Hikes Folder to the Project View Group:`
- I dragged the `Hikes` folder from the downloaded resources folder to the project view group.
- Be sure to select "Copy items if necessary" and "Create groups" before clicking "Finish".
- I became familiar with the new sights. They work together to display excursion data loaded into the model.
5. `In HikeView, Experiment with Showing and Hiding the Chart:`
- Experimented with showing and hiding the graph in `HikeView`.
- I made sure to use the live preview throughout this tutorial so I could experiment with the results of each step.


## `Section 2 - Adding animations to individual views`

When I used the `animation(_:)` modifier on an equatable view, SwiftUI animated any changes to the view's animatable properties. The color, opacity, rotation, size, and other properties of a view are all animatable. When the view is not equatable, I can use the `animation(_:value:)` modifier to start animations when the specified value changes.

### `Summary of section steps`

`Steps:`
1. `Enable Button Rotation Animation in HikeView:`
- In `HikeView`, I enabled animation for button rotation by adding an `animation` modifier that starts on changes of the `showDetail` value.
2. `Add another Animatable Change to Enlarge Button when Chart is Visible:`
- Added another animatable change making the button larger when the graphic is visible.
- The `animation` modifier applies to all animatable changes within the views it wraps.
3. `Change the Animation Type from easeInOut to spring():`
- Changed the animation type from `easeInOut` to `spring()`.
- SwiftUI includes basic animations with predefined or custom easing functions, as well as spring-like and fluid animations. You can adjust the speed of an animation, set a delay before an animation starts, or specify that an animation repeats.
4. `Try Disabling Animation for Rotation:`
- I tried disabling animation for rotation by adding another `animation` modifier just above the `scaleEffect` modifier.
- I experimented with SwiftUI. I tried combining different animation effects to explore the possibilities.
5. `Remove Both Animation Modifiers Before Proceeding to Next Section:`
- I removed both animation modifiers before moving on to the next section.


## `Section 3 - Animate the effects of state changes`

Now that I've learned how to apply animations to individual views, it's time to add animations in places where I change my state value. Here, I will apply animations to all the changes that occur when a user taps a button and toggles the `showDetail` state property.

### `Summary of section steps`

`Steps:`
1. `Wrap the Call to showDetail.toggle() with withAnimation:`
- I wrap the call to `showDetail.toggle()` with a call to the `withAnimation` function.
- Both views affected by the `showDetail` property — the disclose button and the `HikeDetail` view — now have animated transitions.
- I slow down the animation to observe how animations in SwiftUI are interruptible.
2. `Pass a Basic Four Second Animation to withAnimation:`
- I pass a basic four second animation to the `withAnimation` function.
- I can pass the same types of animations to the `withAnimation` function that I passed to the `animation(_:value:)` modifier.
3. `Experiment with Opening and Closing the Chart View in the Middle of the Animation:`
- Experiment with opening and closing the graph view mid-animation.
4. `Before Proceeding to the Next Section, Restore the withAnimation Function to Use the Default Animation by Removing the Input Parameter from the Call:`
- Before moving on to the next section, I restore the `withAnimation` function to use the default animation by removing the input parameter from the call.


## `Section 4 - Customize View Transitions`

By default, views transition on and off the screen using fades. I can customize this transition using the `transition(_ :)` modifier.

### `Summary of section steps`

`Steps:`
1. `Add transition(_:) Modifier to HikeView for Conditional Transition:`
- Added the `transition(_:)` modifier to the conditionally visible view `HikeView`.
- The graph now appears and disappears by sliding in and out of view.
2. `Extract the Added Transition as a Static Property of AnyTransition:`
- Extracted the transition I just added as a static property of `AnyTransition`.
- Accessed the new property in the view's transition modifier.
- This keeps your code clean as you expand the custom transition.
3. `Switch to Transition move(edge:) so that the Chart Slides from the Same Side:`
- Switched to using the `move(edge:)` transition, so that the graphic slides in and out from the same side.
4. `Use the asymmetric(insertion:removal:) Modifier to Provide Different Transitions When Appearing and Disappearing from View:`
- Used the `asymmetric(insertion:removal:)` modifier to provide different transitions when the view appears and disappears.


## `Section 5 - Composing animations for complex effects`

The chart switches between three different sets of data when you click the buttons below the bars. In this section, I'll use a composite animation to give the capsules that make up the graph a dynamic, wavy transition.

### `Summary of section steps`

`Steps:`
1. `Change the Default Value of showDetail to True in HikeView:`
- In `HikeView`, I changed the default value for `showDetail` to true.
- I set the preview to the canvas so I can see the graph in context while working on the animation in another file.
2. `Define a New Ripple Animation in HikeGraph:`
- In `HikeGraph`, I defined a new ripple animation and applied it to each generated graph capsule.
3. `Change the Animation to a Spring Animation to Make the Bars Jump:`
- I changed the animation to a spring animation, with a reduced damping fraction to make the bars jump.
- You can observe the animation effect by switching between elevation, heart rate and speed in the live preview.
4. `Speed Up the Animation Slightly to Reduce the Time It Takes Each Bar to Move to Its New Position:`
- I sped up the animation a bit to reduce the time each bar takes to move to its new position.
5. `Add a Delay to Each Animation Based on Capsule Position on the Chart:`
- Added a delay to each animation based on the capsule's position on the graph.
6. `See How Custom Animation Provides a Wavy Effect When Transitioning Between Graphics:`
- Noticed how the custom animation provides a rippling effect when transitioning between graphics.
- Make sure to unpin the preview before moving on to the next tutorial.



