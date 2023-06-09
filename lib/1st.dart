import 'package:loveshairy/second.dart';
import 'package:loveshairy/shayaricat.dart';
import 'package:flutter/material.dart';
import 'package:loveshairy/second.dart';
import 'package:loveshairy/shayaricat.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: app(),
    debugShowCheckedModeBanner: false,
  ));
}

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  List emoji = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    var status = await Permission.storage.status;

    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      // print(statuses[Permission.location]);
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Love shayari"),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.grey,
        body: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return shayari(index);
                    },
                  ));
                },
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Container(margin: EdgeInsets.all(5),
                    child: Image.asset("image/${categary.im[index]}",
                        height: 50, width: 50, fit: BoxFit.cover),
                  ),
                  title: Text(
                    "${categary.shayari_Cat[index]}",
                    style: TextStyle(
                      color: Colors.green,),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 5,
                color: Colors.grey,
              );
            },
            itemCount: categary.shayari_Cat.length));
  }
}