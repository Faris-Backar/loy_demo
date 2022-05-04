import 'package:flutter/material.dart';
import 'package:loyverse_demo/presentation/screens/all_item_screen.dart';
import 'package:loyverse_demo/presentation/widgets/drawer_widget.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Items'),
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
            leading: const Icon(Icons.list_rounded),
          ),
          const Divider(
            indent: 60,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Categories'),
            leading: const Icon(Icons.add_to_photos),
          ),
          const Divider(
            indent: 60,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Discount'),
            leading: const Icon(Icons.discount_rounded),
          ),
          const Divider(
            indent: 60,
          ),
        ],
      ),
    );
  }
}
