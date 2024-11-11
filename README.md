# 💀 ⛓️ Goth Store ⚰️🦇

<details>
<Summary><b>ASSIGNMENT 7</b></summary>

### 1. Explain what are stateless widgets and stateful widgets, and explain the difference between them.

Stateless widgets are widgets that don’t have any mutable state. They are immutable, meaning once they are built, they cannot change. They are typically used for widgets that only depend on their configuration and don’t change over time. In this project, `MyHomePage` and `ItemCard` are examples of stateless widgets.

Stateful widgets are widgets that can change over time or in response to user interactions. They maintain a `State` object, which can change and trigger a rebuild of the widget. Stateful widgets are useful when the UI needs to reflect changes or updates, such as animations or data from user interactions.

### 2. Mention the widgets that you have used for this project and its uses.
- Scaffold: Provides the basic structure, including the AppBar and Body for the layout.
- AppBar: Displays the title at the top of the app.
- Row and Column: Used for arranging widgets in horizontal and vertical layouts.
- GridView.count: Displays a grid of buttons for the main options.
- Card: Used for displaying the information cards.
- InkWell: Wraps each button to detect taps.
- SnackBar: Shows feedback messages when buttons are pressed.

### 3. What is the use-case for setState()? Explain the variable that can be affected by setState().

`setState()` is used in a `StatefulWidget` to indicate that the widget’s state has changed and needs to be updated in the UI. When called, `setState()` triggers a rebuild, updating any UI elements that depend on the changed data. In this project, we didn’t use `setState()` as `MyHomePage` is a `StatelessWidget`. However, if we had a counter or a dynamic list, we would use `setState()` to update them.

### 4. Explain the difference between `const` and `final` keyword.

- const: Used to define compile-time constants. It’s used for values that are completely determined at compile time and will never change.
- final: Used for variables that are set once and won’t be changed. However, unlike `const`, the value of `final` can be determined at runtime.

### 5. Explain how you implemented the checklist above step-by-step.
#### ✔️Create a new Flutter application with the E-Commerce theme that matches the previous assignments.
- First, I create a new application in my designated directory by running the following code.
    ```
    flutter create goth_store
    cd goth_store
    ```
- I then create new file called menu.dart and add ```import 'package:flutter/material.dart'```
- From my ```main.dart``` file, I move the class ```MyHomePage``` and ```_MyHomePageState``` to the ```menu.dart``` file.
- In ```main.dart```, I added some imports and added color scheme.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:goth_store/menu.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Goth Store',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey, 
            ).copyWith(
            secondary: Colors.black,
            ),
        ),
        home: MyHomePage(),
        );
    }
    }
    ```
#### ✔️Create three simple buttons with icons and texts for Viewing the product list (View Product List), Adding a product (Add Product), Logout (Logout) and implement different colors for each button
- In ```MyHomePage```, I create a list called items with three ```ItemHomepage instances```, each representing a button and set the name, icon, and initial color for each button:
```dart
class MyHomePage extends StatelessWidget {
  final String npm = '2306172086';
  final String name = 'Kezia Salsalina Agtyra Sebayang';
  final String className = 'PBP KKI';
  final List<ItemHomepage> items = [
    ItemHomepage("View Product", Icons.list, Colors.red[600]!),
    ItemHomepage("Add Product", Icons.add, Colors.red[500]!),
    ItemHomepage("Logout", Icons.logout, Colors.red[400]!),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Goth Store',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Text(
                'Welcome to Goth Store',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: items.map((ItemHomepage item) {
                return ItemCard(item);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
```
#### ✔️Display a Snackbar with messages
- I use the onTap property in InkWell to respond to taps on each button.
- In the onTap callback, I use ScaffoldMessenger.of(context).showSnackBar() to display a SnackBar with a specific message for each button.
- Then, in the onTap callback, customize the SnackBar content based on the button name by using ```${item.name}```
```dart
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button!")),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  ```

</details>

<details>
<Summary><b>ASSIGNMENT 8</b></summary>

### 1. What is the purpose of const in Flutter? Explain the advantages of using const in Flutter code. When should we use const, and when should it not be used?
In Flutter, const creates compile-time constants, ensuring widgets are created only once and reused, improving performance and memory efficiency. const should be used for widgets or objects that remain unchanged throughout the app’s lifecycle, like labels or static decorations. However, it shouldn’t be used for dynamic widgets that respond to user interaction.

### 2. Explain and compare the usage of Column and Row in Flutter. Provide example implementations of each layout widget!
Column and Row are layout widgets that arrange children vertically or horizontally, respectively. Column is ideal for stacking items top-to-bottom (Example: list of buttons (View, Add, Logout)), while Row arranges them left-to-right (Example: list of name, class, and npm in home page). Both support alignment and spacing options, but Column is best for vertical layouts, and Row for inline horizontal layouts.

### 3. List the input elements you used on the form page in this assignment. Are there other Flutter input elements you didn’t use in this assignment? Explain!
My assignment uses TextFormField for name, description, price, and gothness inputs. Other Flutter input widgets not used include Checkbox, Radio Button, Slider, Switch, and DropdownButton, which are helpful for binary choices, multi-options, and ranged selections in more complex forms.

### 4. How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?
Yes, I implemented a theme in this application to ensure consistency across the Goth Store app. I used the ThemeData object within the MaterialApp widget, setting primaryColor to black and applying a ColorScheme.dark with black as the primary color and grey as the secondary color. 

### 5. How do you manage navigation in a multi-page Flutter application?
In Flutter, navigation between pages is commonly managed with functions like push(), pop(), and pushReplacement(). The push() function adds a new route (page) onto the navigation stack, displaying it on top of the current screen. This is useful for moving to a new screen while keeping the ability to return to the previous one. The pop() function removes the current route from the stack, effectively taking the user back to the previous screen. Meanwhile, pushReplacement() is used when you want to replace the current route with a new one, without keeping the old route on the stack. 

</details>