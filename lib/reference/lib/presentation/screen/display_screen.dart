import 'package:db_demo/core/db/db.dart';
import 'package:db_demo/core/utility.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  List<Item> itemlist = [];

  Future<int> getDbLength() async {
    itemlist = await AppDatabase().getAllItem();
    return itemlist.length;
  }

  @override
  void initState() {
    super.initState();
    getDbLength();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: StreamBuilder(
        stream: AppDatabase().watchAllItem(),
        builder: (context, AsyncSnapshot<List<Item>> snapshot) {
          return ListView.builder(
            itemBuilder: (_, index) {
              final image =
                  Utility.imageFromBase64String(snapshot.data![index].userName);
              return Card(
                color: Colors.orangeAccent,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                    radius: 20,
                  ),
                  title: Text(snapshot.data![index].name),
                  subtitle: image,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      setState(() {
                        AppDatabase().deleteItem(snapshot.data![index]);
                      });
                    },
                    color: Colors.red,
                  ),
                ),
              );
            },
            itemCount: snapshot.data!.length,
          );
        },
      ),
    );
  }
}
