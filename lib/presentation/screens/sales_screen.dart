import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyverse_demo/core/config/config.dart';
import 'package:loyverse_demo/presentation/bloc/item_bloc.dart';
import 'package:loyverse_demo/presentation/widgets/drawer_widget.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = Config.screenHeight(context);
    final _width = Config.screenHeight(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt_1_rounded),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 80,
              width: double.infinity,
              color: Colors.lightGreen,
              child: const Center(
                child: Text(
                  'CHARGE \n   0.00',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: _height * 0.714,
            width: _width,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: _height * 0.1,
                  width: _width,
                  color: Colors.black,
                ),
                BlocBuilder<ItemBloc, ItemState>(
                  builder: (context, state) {
                    if (state is GetAllItemsInitial) {}
                    return Container();
                  },
                ),
                Container(
                  height: 70,
                  width: _width,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                      Text('Books')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
