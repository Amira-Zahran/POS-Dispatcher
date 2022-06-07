import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../assets/Colors/Config.dart';
import '../config/Important/HiddenGlobal.dart';
import '../config/Models/orderModel.dart';


class Bar extends StatefulWidget {

  ValueChanged<int> onFilter;


  Bar({Key? key,required this.onFilter});
  @override
  _BarState createState() => _BarState();
}
class _BarState extends State<Bar> {
  TextEditingController? _textEditingController=TextEditingController();
  int activeButton =0 ;


  @override
  Widget build(BuildContext context) {
    List<Orders> _orders = [];
    return Container(
      height: 57,
      color: Config.BarColor,
      child:Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              width: 30,
            ),

            /*Container(
              width: 200,
              height: 40,
              // decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: TextField(
                    controller: SearchController,
                    onChanged: (value){

                      setState(() {
                        SearchValue.value = value;
                        SearchValue.notifyListeners();
                      });

                    },
                    decoration: InputDecoration(
                      //prefix: Icon(Icons.search,color: Config.ButtonColor),
                      prefixIcon: Icon(Icons.search,color: Config.ButtonColor),
                      fillColor: Color(Config.yellowColor),
                      //filled: true,
                      hintStyle: TextStyle(color: Color(Config.yellowColor),
                        fontFamily: "Cairo_Regular",
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(Config.yellowColor))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(Config.yellowColor))
                      ),

                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(Config.yellowColor))
                      ),
                    )
                ),
              ),
            ),*/
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(color: Config.ButtonColor,borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(

                onChanged: (value){

                  setState(() {
                    SearchValue.value = value;
                    SearchValue.notifyListeners();
                  });

                },
                controller: SearchController,
                decoration:  InputDecoration(
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                    hintText: "Search"
                ),
              ),
            ),

            SizedBox(
              width: 30,
            ),

            SizedBox(
              width:120,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Waitingorders()));
                  setState(() {
                    widget.onFilter(0);
                    activeButton = 0;
                  });
                },
                child: Text(
                  'All',
                  style: TextStyle(
                      fontFamily: 'Cairo_Regular',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: (activeButton == 0
                          ? Config.BarColor
                          : Config.ButtonColor)),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all((
                        activeButton == 0
                            ? Config.ButtonColor
                            : Config.BarColor)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(color: Config.ButtonColor)))),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            SizedBox(
              width:120,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Waitingorders()));
                  setState(() {
                    widget.onFilter(1);
                    activeButton = 1;
                  });
                },
                child: Text(
                  'Waiting',
                  style: TextStyle(
                      fontFamily: 'Cairo_Regular',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: (activeButton == 1
                          ? Config.BarColor
                          : Config.ButtonColor)),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all((
                        activeButton == 1
                            ? Config.ButtonColor
                            : Config.BarColor)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(
                                color: Config.ButtonColor)))),
              ),
            ),

            SizedBox(
              width: 30,
            ),

            SizedBox(
              width:120,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Preparingorders()));
                  setState(() {
                    widget.onFilter(2);
                    activeButton = 2;
                  });
                },
                child: Text(
                  'Preparing',
                  style: TextStyle(
                      fontFamily: 'Cairo_Regular',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: (activeButton == 2
                          ? Config.BarColor
                          : Config.ButtonColor)),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all((
                        activeButton == 2
                            ? Config.ButtonColor
                            : Config.BarColor)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(
                                color: Config.ButtonColor)))),
              ),
            ),


            SizedBox(
              width: 30,
            ),

            SizedBox(
              width:120,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Doneorders()));
                  setState(() {
                    widget.onFilter(3);
                    activeButton = 3;
                  });
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontFamily: 'Cairo_Regular',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: (activeButton == 3
                          ? Config.BarColor
                          : Config.ButtonColor)),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all((
                        activeButton == 3
                            ? Config.ButtonColor
                            : Config.BarColor)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(
                                color: Config.ButtonColor)))),
              ),
            ),

            Expanded(child:   Text("Dispatcher",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo_Regular',
                color: Config.ButtonColor,
              ),),),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),

          ],
        ),
      ),
    );
  }
}

