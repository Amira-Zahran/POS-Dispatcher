import 'package:flutter/material.dart';

import 'package:pos_final/config/Important/Imports.dart';

import '../config/Important/HiddenGlobal.dart';
import '../config/Models/orderModel.dart';
import '../models/Three_Partions/list_view.dart';

class Side_bar extends StatefulWidget implements PreferredSizeWidget{

  ValueChanged<int>? onItemSelected;

  Side_bar({Key? key, this.onItemSelected}) : super(key: key);

  @override
  _Side_barState createState() => _Side_barState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _Side_barState extends State<Side_bar> {
  ScrollController sideBar = new ScrollController();

  int activeButton = 1 ;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.17,
        color: Config.BarColor,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
            controller: sideBar,
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        children: [
                          Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('lib/assets/imgs/Logo.png'),
                                    fit: BoxFit.contain)),
                          )]),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          print(currentOrder.id);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> home_page()));
                          currentOrder = Orders(id: 0);
                          print(currentOrder.id);
                          setState(() {
                            print(currentOrder.id);
                            activeButton = 1;
                            widget.onItemSelected!(1);
                            hidden.value = true;
                            hidden.notifyListeners();

                          });
                        },
                        child: Text(
                          'New',
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
                      height: 60,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          print(currentOrder.id);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> on_the_way_orders()));
                          currentOrder = Orders(id: 0);
                          setState(() {
                            activeButton = 2;
                            widget.onItemSelected!(2);
                            hidden.value = true;
                            hidden.notifyListeners();

                          });
                        },
                        child: Text(
                          'On The Way',
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
                      height: 60,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> on_the_way_orders()));
                          setState(() {
                            activeButton = 3;
                            widget.onItemSelected!(3);
                            hidden.value = true;
                            hidden.notifyListeners();
                            currentOrder = Orders(id: 0);
                          });
                        },
                        child: Text(
                          'History',
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
                    SizedBox(height: 60,),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all((
                              activeButton == 4
                                  ? Config.ButtonColor
                                  : Config.BarColor)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  side: BorderSide(
                                      color: Config.ButtonColor)))),
                        onPressed: (){
                        
                        }, child: Text('Log Out',
                      style: TextStyle(
                        fontFamily: 'Cairo_Regular',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: (activeButton == 4
                            ? Config.BarColor
                            : Config.ButtonColor)),)),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'System State :',
                              style: TextStyle(
                                  color: Config.ButtonColor,
                                  fontFamily: "Cairo_Regular",
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Text('Connected',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: "Cairo_Regular",
                                  fontSize: 22
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),

                  ],
                ))));
  }
}