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

<details>
<Summary><b>ASSIGNMENT 9</b></summary>

### 1.Explain why we need to create a model to retrieve or send JSON data. Will an error occur if we don't create a model first?
- Creating a model simplifies the process of mapping JSON data to Dart objects and vice versa. Models help maintain a structured approach, reduce errors, and make the code more readable and maintainable. Without a model, developers would need to manually parse JSON data, which increases the likelihood of bugs due to incorrect parsing, mismatched fields, or inconsistent data types. While an error may not immediately occur if no model is created, the code will be less efficient, harder to debug, and more prone to runtime errors.

### 2. Explain the function of the http library that you implemented for this task.
The http library in Flutter provides an easy way to make HTTP requests to a server. It is used to:
- Send GET, POST, PUT, and DELETE requests.
- Fetch data from Django endpoints and decode the response.
- Handle authentication by sending cookies, headers, and other credentials as part of the request.
- Enable integration between the Flutter front end and Django back end by facilitating communication through APIs.

### 3. Explain the function of CookieRequest and why it’s necessary to share the CookieRequest instance with all components in the Flutter app.
CookieRequest is used to manage session cookies for authentication and maintain the user’s session across multiple requests. It simplifies tasks like logging in, maintaining session states, and handling secure communication. Sharing a single CookieRequest instance across all components ensures:
- Consistency of session data, avoiding multiple logins or session mismatches.
- Efficient resource use by preventing redundant instances.
- Ease of access to session-dependent APIs, such as fetching user-specific data.

### 4. Explain the mechanism of data transmission, from input to display in Flutter.
When the user interacts with the Flutter app, such as by submitting a form or clicking a button, the app sends a network request (e.g., GET or POST) to Django using the http or CookieRequest library. Django processes the request, retrieves or modifies data, and sends back a JSON response. Flutter then parses the JSON into Dart objects using a model, making the data easier to work with. Finally, the data is displayed on the UI using widgets like ListView or FutureBuilder.

### 5. Explain the authentication mechanism from login, register, to logout. Start from inputting account data in Flutter to Django’s completion of the authentication process and display of the menu in Flutter.
During login, the app sends the user's credentials to Django, which verifies them and returns a session cookie if valid. This cookie is stored for subsequent requests. For registration, user details are sent to Django, which creates a new account. Logout involves sending a request to Django to clear the session cookie, logging the user out. Flutter resets the session state and redirects to the login page. This ensures secure authentication and session management.

### 6. Explain how you implement the checklist above step by step! (not just following the tutorial).
#### ✔️Integrate the Django authentication system, registration feature, and login page in the Flutter project
- First I created a new authentication app in my Django project and added these in my ```views.py```
  ```py
  from django.shortcuts import render
  from django.contrib.auth import authenticate, login as auth_login
  from django.contrib.auth import logout as auth_logout
  from django.http import JsonResponse
  from django.views.decorators.csrf import csrf_exempt
  from django.contrib.auth.models import User
  import json

  @csrf_exempt
  def login(request):
      username = request.POST['username']
      password = request.POST['password']
      user = authenticate(username=username, password=password)
      if user is not None:
          if user.is_active:
              auth_login(request, user)
              return JsonResponse({
                  "username": user.username,
                  "status": True,
                  "message": "Login successful!"
              }, status=200)
          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login failed, account disabled."
              }, status=401)

      else:
          return JsonResponse({
              "status": False,
              "message": "Login failed, check username or password again."
          }, status=401)
      
  @csrf_exempt
  def register(request):
      if request.method == 'POST':
          data = json.loads(request.body)
          username = data['username']
          password1 = data['password1']
          password2 = data['password2']

          # Check if the passwords match
          if password1 != password2:
              return JsonResponse({
                  "status": False,
                  "message": "Passwords do not match."
              }, status=400)

          # Check if the username is already taken
          if User.objects.filter(username=username).exists():
              return JsonResponse({
                  "status": False,
                  "message": "Username already exists."
              }, status=400)

          # Create the new user
          user = User.objects.create_user(username=username, password=password1)
          user.save()

          return JsonResponse({
              "username": user.username,
              "status": 'success',
              "message": "User created successfully!"
          }, status=200)

      else:
          return JsonResponse({
              "status": False,
              "message": "Invalid request method."
          }, status=400)
      
  @csrf_exempt
  def logout(request):
      username = request.user.username

      try:
          auth_logout(request)
          return JsonResponse({
              "username": username,
              "status": True,
              "message": "Logged out successfully!"
          }, status=200)
      except:
          return JsonResponse({
          "status": False,
          "message": "Logout failed."
          }, status=401)

  ```
- Then, I added these URL routings to the ```authentication/urls.py```
  ```py
  from django.urls import path
  from authentication.views import login, register, logout

  app_name = 'authentication'

  urlpatterns = [
      path('login/', login, name='login'),
      path('register/', register, name='register'),
      path('logout/', logout, name='logout'),
  ]
  ```
- I also added a URL routing inside ```goth_store/urls.py``` by including ```path('auth/', include('authentication.urls'))```

- To integrate it to Flutter, I first install the packages ```flutter pub provider``` and ```flutter pub add pbp_django_auth``` and modify the root widget in the ```main.dart``` by adding the code below. This create a CookieRequest instance and share it with all components in the Flutter app.
  ```dart
  return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
      ...
  )  
  ```
- Then, I created each page for the login and register.
  ```dart
  #login
  import 'package:goth_store/screens/menu.dart';
  import 'package:flutter/material.dart';
  import 'package:pbp_django_auth/pbp_django_auth.dart';
  import 'package:provider/provider.dart';
  import 'package:goth_store/screens/register.dart';

  void main() {
    runApp(const LoginApp());
  }

  class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.red,
            ).copyWith(secondary: Colors.red[400]),
          ),
          home: const LoginPage(),
      );
    }
  }

  class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();

      return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () async {
                        String username = _usernameController.text;
                        String password = _passwordController.text;

        // Check credentials
        // TODO: Change the URL and don't forget to add a trailing slash (/) at the end of the URL!
        // To connect the Android emulator to Django on localhost,
        // use the URL http://10.0.2.2/
                        final response = await request
                            .login("http://localhost:8000/auth/login/", {
                          'username': username,
                          'password': password,
                        });

                        if (request.loggedIn) {
                          String message = response['message'];
                          String uname = response['username'];
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                    content:
                                        Text("$message Welcome, $uname.")),
                              );
                          }
                        } else {
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Login Failed'),
                                content: Text(response['message']),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 36.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: Text(
                        'Don\'t have an account? Register',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
  ```
  ```dart
  #register
  import 'dart:convert';
  import 'package:flutter/material.dart';
  import 'package:goth_store/screens/login.dart';
  import 'package:pbp_django_auth/pbp_django_auth.dart';
  import 'package:provider/provider.dart';

  class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});

    @override
    State<RegisterPage> createState() => _RegisterPageState();
  }

  class _RegisterPageState extends State<RegisterPage> {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () async {
                        String username = _usernameController.text;
                        String password1 = _passwordController.text;
                        String password2 = _confirmPasswordController.text;

                        // Check credentials
                        // TODO: Change the url, don't forget to add a slash (/) inthe end of the URL!
                        // To connect Android emulator with Django on localhost,
                        // use the URL http://10.0.2.2/
                        final response = await request.postJson(
                            "http://localhost:8000/auth/register/",
                            jsonEncode({
                              "username": username,
                              "password1": password1,
                              "password2": password2,
                            }));
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Successfully registered!'),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to register!'),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
  ```

#### ✔️Create a custom model according to your Django application project.
- In the models/product_entry.dart, I insert the following code made from Quicktype.
  ```dart
  import 'dart:convert';

  List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

  String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  class Product {
      String model;
      String pk;
      Fields fields;

      Product({
          required this.model,
          required this.pk,
          required this.fields,
      });

      factory Product.fromJson(Map<String, dynamic> json) => Product(
          model: json["model"],
          pk: json["pk"],
          fields: Fields.fromJson(json["fields"]),
      );

      Map<String, dynamic> toJson() => {
          "model": model,
          "pk": pk,
          "fields": fields.toJson(),
      };
  }

  class Fields {
      String name;
      int price;
      String description;
      int gothness;
      int user;

      Fields({
          required this.name,
          required this.price,
          required this.description,
          required this.gothness,
          required this.user,
      });

      factory Fields.fromJson(Map<String, dynamic> json) => Fields(
          name: json["name"],
          price: json["price"],
          description: json["description"],
          gothness: json["gothness"],
          user: json["user"],
      );

      Map<String, dynamic> toJson() => {
          "name": name,
          "price": price,
          "description": description,
          "gothness": gothness,
          "user": user,
      };
  }
  ```

#### ✔️Create a page containing a list of all items available at the JSON endpoint in Django that you have deployed.
- In ```screens``` directory, I created a new file called ```list_product.dart``` and added the following code.
  ```dart
  import 'package:flutter/material.dart';
  import 'package:goth_store/widgets/product_details.dart';
  import 'package:pbp_django_auth/pbp_django_auth.dart';
  import 'package:provider/provider.dart';
  import 'package:goth_store/models/product_entry.dart';
  import 'package:goth_store/widgets/left_drawer.dart';

  class ProductPage extends StatefulWidget {
    const ProductPage({super.key});

    @override
    State<ProductPage> createState() => _ProductPageState();
  }

  class _ProductPageState extends State<ProductPage> {
    Future<List<Product>> fetchProduct(CookieRequest request) async {
      final response = await request.get('http://localhost:8000/json/');

      // Decoding the response into JSON
      var data = response;

      // Convert json data to a Product object
      List<Product> listProduct = [];
      for (var d in data) {
        if (d != null) {
          listProduct.add(Product.fromJson(d));
        }
      }
      return listProduct;
    }

    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
          future: fetchProduct(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error fetching products: ${snapshot.error}',
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'No products found. Add some products!',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red, // Color of the border
                            width: 1, // Width of the border
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.price}"),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.description}"),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.gothness}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      );
    }
  }
  ```

#### ✔️Create a detail page for each item listed on the Product list page.
- Create a new file named ```product_details.dart``` under the ```widgets ``` subdirectory and add the following code.
```dart
import 'package:flutter/material.dart'; 
import 'package:goth_store/models/product_entry.dart'; 

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name), 
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context), 
          ),
        ], // Widget[]
      ), // AppBar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 10),
            Text("Description: ${product.fields.description}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Price: ${product.fields.price}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Gothness: ${product.fields.gothness}", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
```