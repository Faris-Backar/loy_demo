import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyverse_demo/core/config/config.dart';
import 'package:loyverse_demo/core/config/pref_resources.dart';
import 'package:loyverse_demo/main.dart';
import 'package:loyverse_demo/presentation/bloc/item_bloc.dart';
import 'package:loyverse_demo/presentation/widgets/drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalesScreen extends StatefulWidget {
  static const routeName = '/SalesScreen';
  const SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  int totalPrice = 0;
  String dropdownvalue = '';
  var items = [
    'All Items.',
    'Discount Items.',
  ];
  bool isSearchEnabled = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemBloc>(context).add(GetAllItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final _height = Config.screenHeight(context);
    final _width = Config.screenHeight(context);
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Ticket'),
            const SizedBox(
              width: 10,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.receipt,
                  size: 30,
                ),
                Container(
                  height: 18,
                  width: 18,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: ValueListenableBuilder(
                    valueListenable: valueNotifier,
                    builder: (context, value, child) => Text(
                      value.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt_1_rounded),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              var list = <PopupMenuEntry<Object>>[];
              list.add(
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Text('Clear Ticket')
                    ],
                  ),
                  value: 1,
                  onTap: () async {
                    valueNotifier.value = 0;
                    priceNotifier.value = 0;
                  },
                ),
              );
              list.add(
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.sync,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Text('Sync')
                    ],
                  ),
                  value: 2,
                  onTap: () async {},
                ),
              );
              return list;
            },
          )
        ],
      ),
      drawer: const DrawerWidget(indexValue: 0),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: _height * .08,
              width: double.infinity,
              color: Colors.lightGreen,
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: priceNotifier,
                  builder: (context, value, child) => Text(
                    'CHARGE \n \t\t\t\t\t $value.00',
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: _height * 0.765,
            width: _width,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: _height * 0.08,
                  width: _width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[350]!),
                  ),
                  child: Row(
                    children: [
                      isSearchEnabled
                          ? Container(
                              width: _width * .39,
                              padding: const EdgeInsets.all(16.0),
                              alignment: Alignment.center,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                cursorColor: Colors.grey,
                                cursorHeight: 30,
                                autofocus: true,
                              ),
                            )
                          : Container(
                              width: _width * .39,
                              padding: const EdgeInsets.all(16.0),
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                value: items[0],
                                underline: Container(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(7.8),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(color: Colors.grey[350]!),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isSearchEnabled = !isSearchEnabled;
                              });
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ItemBloc, ItemState>(
                  builder: (context, state) {
                    if (state is GetAllItemsInitial) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is GetAllItemsLoaded) {
                      print(state.itemList.length);
                      print(state.itemList);
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.itemList.length,
                        separatorBuilder: (context, index) => const Divider(
                          indent: 60,
                        ),
                        itemBuilder: (context, index) => ListTile(
                          onTap: () async {
                            valueNotifier.value++;
                            valueNotifier.notifyListeners();
                            priceNotifier.value += state.itemList[index].price;
                            print('total price=>' + totalPrice.toString());
                          },
                          title: Text(state.itemList[index].name),
                          leading: Container(
                            height: 30,
                            width: 30,
                            color: Colors.grey,
                          ),
                          trailing: Text('${state.itemList[index].price}'),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
