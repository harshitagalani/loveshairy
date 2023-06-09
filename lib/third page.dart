import 'package:loveshairy/four page.dart';
import 'package:loveshairy/second.dart';
import 'package:loveshairy/shayaricat.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';

class love extends StatefulWidget {
  List shayari_list = [];
  int cindex;

  love(this.shayari_list, this.cindex);

  @override
  State<love> createState() => _loveState();
}

class _loveState extends State<love> {
  int cur_ind = 0;
  List sh = [];
  bool status = false;
  Color clr = Colors.pink;
  int clr_ind = 0;


  PageController? controller;
  List<Color> myclr = [];
  List Emoge = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cur_ind = widget.cindex;
    controller = PageController(initialPage: widget.cindex);
    myclr.addAll(categary.myColor);
    myclr.shuffle();
  }

  Widget build(BuildContext context) {
    double statusbarheight = MediaQuery.of(context).viewPadding.top;
    double appbarheight = kToolbarHeight;
    double total = statusbarheight + appbarheight;
    double height = MediaQuery.of(context).size.height - total;
    // print(height);

    return Scaffold(
      appBar: AppBar(
        title: Text("love shayari"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        height: height,
                        color: Colors.white,
                        child: GridView.builder(
                          itemCount: 10,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                status = true;
                                clr_ind = index;
                                Navigator.pop(context);
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                child: Text(
                                    "${categary.emoji[cur_ind]} \nLove Shayari \n${categary.emoji[cur_ind + 1]}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black)),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      myclr[index],
                                      myclr[index + 1],
                                      myclr[index + 2],
                                    ])),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0),
                      image: DecorationImage(
                          image: AssetImage("image/29.png"))),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("${cur_ind + 1}/${widget.shayari_list.length}"),
                margin: EdgeInsets.all(5),
                height: 30,
                width: 40,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.white)),
              ),
              InkWell(
                onTap: () {
                  setState(() {});
                 if(cur_ind<=myclr.length)
                   {
                     status=true;
                     clr_ind++;
                     if(clr_ind==myclr.length)
                       {
                         clr_ind=0;
                       }
                     setState(() {

                     });
                   }
                },
                child: Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0),
                    image:
                    DecorationImage(image: AssetImage("image/28.png")),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: (status == false) ? clr : null,
              gradient: (status == true)
                  ? LinearGradient(colors: [myclr[clr_ind], myclr[clr_ind + 1]])
                  : null,
            ),
            margin: EdgeInsets.all(5),
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  cur_ind = value;
                });
              },
              itemCount: widget.shayari_list.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${categary.emoji[index]} ${widget.shayari_list[cur_ind]} ${categary.emoji[index]}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 300,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(5),
              color: Colors.green,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      FlutterClipboard.copy("${widget.shayari_list[cur_ind]}")
                          .then((value) => print('copied'));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("image/30.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (cur_ind > 0) {
                        cur_ind--;
                        controller?.jumpToPage(cur_ind);
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("image/31.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return demo(
                              widget.shayari_list[cur_ind], widget.cindex);
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("image/32.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (cur_ind <= widget.shayari_list.length - 2) {
                        cur_ind++;
                        controller?.jumpToPage(cur_ind);
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("image/33.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Share.share("${widget.shayari_list[cur_ind]}");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          image: DecorationImage(
                              image: AssetImage("image/34.jpg.png"))),
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}