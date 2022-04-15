import 'package:flutter/material.dart';
import 'package:loyverse_demo/db/functions/db_functions.dart';
import 'package:loyverse_demo/db/models/data_model.dart';
import 'package:loyverse_demo/presentation/screens/landing_screen.dart';
import 'package:loyverse_demo/presentation/widgets/drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllDatat();
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
      drawer: const DrawerWidget(),
      body: Center(
        child: Column(),
      ),
    );
  }
}
