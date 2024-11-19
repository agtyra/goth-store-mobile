import 'package:flutter/material.dart';
import 'package:goth_store/screens/list_product.dart';
import 'package:goth_store/screens/menu.dart';
import 'package:goth_store/screens/productentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
               decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Column(
                children: [
                  Text(
                    'Goth Store',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "Discover the Shadows in Style!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    )
                  ),
                ],
              ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text(
                'Home Page'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              title: const Text(
                'Add Product'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GothEntryFormPage(),
                    ));
              },
            ),  
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Product List'),
              onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}