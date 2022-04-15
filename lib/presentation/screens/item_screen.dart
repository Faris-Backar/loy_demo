import 'package:flutter/material.dart';
import 'package:loyverse_demo/presentation/screens/all_item_screen.dart';
import 'package:loyverse_demo/presentation/widgets/drawer_widget.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AllItemScreen(),
              ));
            },
            title: const Text('Items'),
            leading: Icon(Icons.list_rounded),
          ),
          Divider(
            indent: 60,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Categories'),
            leading: Icon(Icons.add_to_photos),
          ),
          Divider(
            indent: 60,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Discount'),
            leading: Icon(Icons.discount_rounded),
          ),
          Divider(
            indent: 60,
          ),
        ],
      ),
    );
  }
}
