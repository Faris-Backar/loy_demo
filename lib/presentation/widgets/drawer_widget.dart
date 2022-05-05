// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:loyverse_demo/core/config/config.dart';
import 'package:loyverse_demo/presentation/screens/item_screen.dart';
import 'package:loyverse_demo/presentation/screens/landing_screen.dart';
import 'package:loyverse_demo/presentation/screens/sales_screen.dart';

class DrawerWidget extends StatefulWidget {
  final int indexValue;
  const DrawerWidget({
    Key? key,
    required this.indexValue,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late int _currentSelected;
  @override
  Widget build(BuildContext context) {
    double height = Config.screenHeight(context);
    double width = Config.screenWidth(context);
    _currentSelected = widget.indexValue;
    List drawerList = [
      {
        'name': 'Sales',
        'navigation': SalesScreen.routeName,
        'icon': const Icon(Icons.shopping_basket),
        'isSelected': true
      },
      {
        'name': 'Reciept',
        'navigation': SalesScreen.routeName,
        'icon': const Icon(Icons.receipt),
        'isSelected': false
      },
      {
        'name': 'Items',
        'navigation': ItemScreen.routeName,
        'icon': const Icon(Icons.list_rounded),
        'isSelected': false
      },
      {
        'name': 'Settings',
        'navigation': SalesScreen.routeName,
        'icon': const Icon(Icons.settings),
        'isSelected': false
      },
      {
        'name': 'Back Office',
        'navigation': SalesScreen.routeName,
        'icon': const Icon(Icons.bar_chart_outlined),
        'isSelected': false
      },
      {
        'name': 'Apps',
        'navigation': SalesScreen.routeName,
        'icon': const Icon(Icons.apple),
        'isSelected': false
      },
      {
        'name': 'Support',
        'navigation': SalesScreen.routeName,
        'icon': const Icon(Icons.info),
        'isSelected': false
      },
    ];
    return SafeArea(
      child: Drawer(
        child: SizedBox(
          height: height,
          child: Column(
            children: [
              Container(
                height: 100,
                width: width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    tileMode: TileMode.mirror,
                    colors: [
                      Color(0xFF56ab2f),
                      Color(0xFFa8e063),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Owner',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'POS',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'PM DressMakers',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height - 178,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: drawerList.length,
                  itemBuilder: (context, index) => ListTile(
                    tileColor: _currentSelected == index
                        ? Colors.grey[100]
                        : Colors.white,
                    title: Text(
                      drawerList[index]['name'],
                      style: TextStyle(
                          color: _currentSelected == index
                              ? Colors.lightGreen
                              : Colors.black),
                    ),
                    leading: drawerList[index]['icon'],
                    iconColor: _currentSelected == index
                        ? Colors.lightGreen
                        : Colors.grey[600],
                    onTap: () {
                      setState(() {
                        _currentSelected = index;
                      });
                      Navigator.of(context).pushReplacementNamed(
                          drawerList[index]['navigation']);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
