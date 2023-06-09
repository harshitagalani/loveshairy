import 'package:loveshairy/shayaricat.dart';
import 'package:loveshairy/third page.dart';
import 'package:flutter/material.dart';

class shayari extends StatefulWidget {
  int index;

  shayari(this.index);

  @override
  State<shayari> createState() => _shayariState();
}

class _shayariState extends State<shayari> {
  List sh = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.index == 0) {
      sh.addAll(categary.shubh);
    } else if (widget.index == 1) {
      sh.addAll(categary.dosti);
    } else if (widget.index == 2) {
      sh.addAll(categary.majedar);
    } else if (widget.index == 3) {
      sh.addAll(categary.bhagvan);
    } else if (widget.index == 4) {
      sh.addAll(categary.prerna);
    } else if (widget.index == 5) {
      sh.addAll(categary.jivan);
    } else if (widget.index == 6) {
      sh.addAll(categary.mohabat);
    } else if (widget.index == 7) {
      sh.addAll(categary.yade);
    } else if (widget.index == 8) {
      sh.addAll(categary.anny);
    } else if (widget.index == 9) {
      sh.addAll(categary.rajniti);
    } else if (widget.index == 10) {
      sh.addAll(categary.prem);
    } else if (widget.index == 11) {
      sh.addAll(categary.dard);
    } else if (widget.index == 12) {
      sh.addAll(categary.sharab);
    } else if (widget.index == 13) {
      sh.addAll(categary.bevfa);
    } else if (widget.index == 14) {
      sh.addAll(categary.janamdin);
    } else if (widget.index == 15) {
      sh.addAll(categary.holi);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${categary.shayari_Cat[widget.index]}"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return love(sh, index);
                    },
                  ));
                },
                child: ListTile(
                  tileColor: Colors.pink,
                  title: Text(
                    " ${categary.emoji[index]} ${sh[index]}",maxLines: 2, ),
                  leading: Container(
                    margin: EdgeInsets.all(5),
                    child: Image(
                        image: AssetImage(
                          "image/${categary.im[widget.index]}",
                        )),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                height: 5,
              );
            },
            itemCount: sh.length),
      ),
    );
  }
}