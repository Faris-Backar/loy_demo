import 'package:flutter/material.dart';
import 'package:loyverse_demo/presentation/screens/create_item_screen.dart';

class AllItemScreen extends StatelessWidget {
  const AllItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Items'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 70,
              backgroundColor: Colors.grey[350],
              child: Icon(
                Icons.list_sharp,
                color: Colors.grey,
                size: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You have no items yet',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 08,
            ),
            Text(
              'To add an item, press the (+) button',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CreateItemScreen(),
          ));
        },
        child: const Icon(Icons.add),
        heroTag: const Text('Add items'),
      ),
    );
  }
}
