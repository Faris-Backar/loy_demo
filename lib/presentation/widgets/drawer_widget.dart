import 'package:flutter/material.dart';
import 'package:loyverse_demo/presentation/screens/item_screen.dart';
import 'package:loyverse_demo/presentation/screens/landing_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Sales'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Reciept'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.list_rounded),
            title: Text('Items'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ItemScreen(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bar_chart_outlined),
            title: Text('Back Office'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Apps'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text('Support'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: Text('Logout'),
            onTap: () async {
              final _sharedPrefs = await SharedPreferences.getInstance();
              _sharedPrefs.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LandingScreen(),
                  ),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
