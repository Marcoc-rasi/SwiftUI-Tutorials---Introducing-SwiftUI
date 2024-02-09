# `Unit 3.1 - Composing complex interfaces - Introduction`

The category view for Landmarks displays a vertically scrolling list of horizontally scrolling landmarks. As I build this view and connect it to my existing views, I'll explore how composite views can adapt to different device sizes and orientations.

## `Section 1 - Add a category view`

I can provide a different way to explore landmarks by creating a view that sorts landmarks by category, while highlighting a featured landmark at the top of the view.

### `Summary of section steps`

`Steps:`
1. `Create a Category Group in the Project View Group and a Custom View called CategoryHome:`
- I created a group called "Categories" in the views group of your project.
- I created a custom view called "CategoryHome" in the new group.
2. `Add a NavigationSplitView to Host the Different Categories:`
- I added a NavigationSplitView to house the different categories.
- Split navigation views along with NavigationLink instances and related modifiers are used to build hierarchical navigation structures in your application.
3. `Set the Navigation Bar Title to "Featured":`
- I set the navigation bar title to "Featured".


## `Section 2 - I created a list of categories`

In the category view, I displayed all the categories in separate rows arranged in a vertical column for easy navigation. I achieved this by combining vertical and horizontal stacks, and adding scrolling to the list.

### `Summary of Section Steps`

I started by reading the category data from the landmarkData.json file.

`Steps:`
1. `In Landmark, Add a Category Enumeration and a category Property to the Landmark Structure:`
- I added an enum called "Category" and a property called "category" to the "Landmark" structure.
- The landmarkData file already includes a category value for each landmark with one of three string values. By matching names in the data file, you can rely on the Codable conformance of the structure to load the data.
2. `In ModelData, Add a Calculated Category Dictionary, with Category Names as Keys and an Array of Associated Reference Points for Each Key:`
- Added a calculated dictionary called "categories" in ModelData.
- Dictionary keys are category names, and each key has an array of associated reference points.
3. `In CategoryHome, Create a modelData Property:`
- I created a property called "modelData" in CategoryHome.
- You'll need access to categories now, as well as other benchmark data later.
4. `Show Categories in Landmarks Using a List:`
- Displayed the categories in Landmarks using a "List" component.
- The case name "Landmark.Category" identifies each item in the list, and must be unique among other categories because it is an enumeration.


## `Section 3 - I created a category row`

In Landmarks, I displayed each category in a row that scrolls horizontally. I added a new view type to represent the row, then displayed all the landmarks for that category in the new view. I reused parts of the Landmark view I created in Creating and Combining Views to create familiar previews of a landmark.

### `Summary of Section Steps`

`Steps:`
1. `Define a New Custom View called CategoryRow to Contain the Content of a Row:`
- I created a new custom view called "CategoryRow" to hold the content of a row.
2. `Add Properties for the Category Name and List of Items in that Category:`
- Added properties for the category name and the list of items in that category.
3. `Show Category Name:`
- I showed the category name in the view.
4. `Place the Category Elements in an HStack, and Group that with the Category Name in a VStack:`
- I placed the category items in an HStack and grouped that with the category name in a VStack.
5. `Giving Content Space by Specifying a Frame Height and Adding Padding, Wrapped in a ScrollView:`
- I gave space to the content by specifying a frame height and adding padding, and then wrapped the HStack in a ScrollView.
- Updated the preview with a larger sample of data to make sure the scrolling behavior is correct.
6. `Create a New Custom View called CategoryItem That Shows a Reference Point:`
- I created a new custom view called "CategoryItem" that shows a reference point.
7. `In CategoryRow, Replace the Text Containing the Landmark Name with the New View CategoryItem:`
- In CategoryRow, I replaced the text containing the waypoint name with the new "CategoryItem" view.



## `Section 4 - I completed the category view`

I added the rows and featured image to the category home page.

### `Summary of Section Steps`

`Steps:`
1. `Update CategoryHome Body to Pass Category Information to Row Type Instances:`
- Updated the CategoryHome body to pass category information to the row type instances.
2. `In Landmark, Add a New Property isFeatured:`
- In Landmark, I added a new property "isFeatured".
- Like other landmark properties you've added, this boolean already exists in the data; you just need to declare a new property.
3. `In ModelData, Add a New Calculated Array of Features Containing Only the Featured Landmarks:`
- In ModelData, I added a new calculated array "features" that contains only the landmarks that have "isFeatured" set to true.
4. `In CategoryHome, Add the Image of the First Featured Landmark to the Top of the List:`
- In CategoryHome, I added the image of the first featured landmark to the top of the list.
- You will later turn this view into an interactive carousel in a later tutorial. For now, it shows one of the highlighted landmarks with a scaled and cropped preview image.
5. `Set Borders to Zero on Both Types of Landmark Previews so Content Can Extend to the Edges of the Screen:`
- I set the borders to zero on both types of landmark previews so that the content can extend to the edges of the screen.


## `Section 5 - Added navigation between sections`

With all the differently categorized landmarks visible in the view, the user needed a way to get to each section in the app. I used the Navigation and Presentation APIs to make the category home page, detailed view, and favorites list navigable from a tab view.

### `Summary of Section Steps`
    
`Steps:`
1. `In CategoryRow, Wrap the Existing CategoryItem with a NavigationLink:`
- In CategoryRow, I wrapped the existing CategoryItem with a NavigationLink.
- The category element itself is the label for the button, and its destination is the details view of the waypoint represented by the card.
- Fixed the preview to see the effect of the next step in CategoryRow.
2. `Change the Navigation Appearance of Category Elements by Applying the renderingMode(:) and foregroundStyle(:):) Modifiers`
- Changed the navigation appearance of category elements by applying the renderingMode(:) and foregroundStyle(:) modifiers.
- Text you pass as a label for a navigation link is rendered using the environment's accent color, and images can be rendered as template images. You can modify any of these behaviors to better fit your design.
3. `Unset the Preview, Switch to ContentView and Add an Enumeration of Tabs to Show:`
- I unset the preview, changed to ContentView and added an enumeration of the tabs to show.
4. `Add a State Variable to the Tab Selection, and Give It a Default Value:`
- Added a state variable for the tab selection and gave it a default value.
5. `Create a Tab View that Wraps LandmarkList as well as the New CategoryHome:`
- I created a tab view that wraps LandmarkList and the new CategoryHome.
- The tag(_:) modifier in each of the views matches one of the possible values that the selection property can take, so that the TabView can coordinate which view to display when the user makes a selection in the UI.
6. `Give Each Tab a Name:`
- I gave each tab a name.
7. `Make sure Live Preview is On and Test the New Navigation:`
- I made sure live preview was on and tested the new navigation.



