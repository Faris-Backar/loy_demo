import 'package:flutter/material.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_add_alt_1_rounded),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
        ],
      ),
      drawer: Drawer(
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
              onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
