import 'dart:collection';
import 'package:flutter/material.dart';

import '../../Calender/Caleend.dart';
import '../../assets/Colors/Config.dart';
import '../../config/Important/HiddenGlobal.dart';
import '../../config/Models/HistoryModel.dart';



class HistoryPage extends StatefulWidget {

  @override
  State<HistoryPage> createState() => _HistoryPageState();
  Size get preferredSize => throw UnimplementedError();

}

class _HistoryPageState extends State<HistoryPage> {

  int ItemSelected = 3;

  Operations currentOrder = Operations();
  String change = 'Delivery';


  ScrollController controller = ScrollController();
  TextEditingController SearchCTRL = TextEditingController();

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Scaffold(
        body: GestureDetector(
          onTap: (){
            change = 'None';
            print('clicked');
            setState(() {
              SearchCTRL.clear();
            });
          },
          // inifinty widh viewport pixels, wtf
          child: Container(color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,//*0.83,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'All Orders History', style: TextStyle(
                            color: Color(Config.yellowColor),
                            fontFamily: "Cairo_Regular",
                            fontWeight: FontWeight.bold,
                            fontSize: 25,),),

                          ElevatedButton(
                            onPressed: () async {
                              DateTime? _newDate = await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2019), lastDate: DateTime(3000));
                              if (_newDate != null){
                                setState((){
                                  _dateTime = _newDate;
                                  _dateTime = DateTime.now();
                                });
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty
                                    .all(Colors.white70)),
                            child: Text('${now.year}:${now.month}:${now
                                .day}  ${now.hour}:${now.minute}:${now
                                .second}', style: const TextStyle(
                              color: Color(Config.darkColor),
                              fontFamily: "Cairo_Regular",
                              fontWeight: FontWeight.bold,
                              fontSize: 12,),),
                          ),
/*
                          StreamBuilder<UnmodifiableListView<Operations>>(
                              stream: bLoC.HistoryStream,
                              initialData: UnmodifiableListView<Operations>([]),
                              builder: (context, snapshot) {
                                return ElevatedButton(
                                    onPressed: () async {
                                      DateTime? _newDate = await showDatePicker(context: context, initialDate: _dateTime, firstDate: DateTime(2019), lastDate: DateTime(3000));
                                      if (_newDate != null){
                                        setState((){
                                          _dateTime = _newDate;
                                          //_dateTime = snapshot.data!.where((element) => element.acceptingDate == _dateTime) as DateTime;
                                          _dateTime = DateTime.now();
                                        });
                                      }
                                      */
/*setState(() {
                                  SizedBox(width: 100,
                                      height: 100,
                                      child: Calend());
                                });*//*

                                    },
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all(Colors.white70)),
                                    child: Text('${now.year}:${now.month}:${now
                                        .day}  ${now.hour}:${now.minute}:${now
                                        .second}', style: const TextStyle(
                                      color: Color(Config.darkColor),
                                      fontFamily: "Cairo_Regular",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,)));}),
*/
                        ],
                      ),

                      GestureDetector(
                        onTap: () {
                          //search = 1;
                          change = 'None';
                          //showSearch(context: context, delegate: SearchHistory());
                          print("Tapped a Container");
                          setState(() {
                          });
                        },
                        child: Container(
                          width: 200,
                          height: 40,
                          // decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: TextField(
                                controller:SearchCTRL,
                                onChanged: (v){
                                  setState((){});
                                },
                                decoration: InputDecoration(
                                  //prefix: Icon(Icons.search,color: Config.ButtonColor),
                                  prefixIcon: Icon(Icons.search,color: Config.ButtonColor),
                                  fillColor: Colors.black12,
                                  //filled: true,
                                  hintStyle: TextStyle(color: Color(Config.darkColor),
                                    fontFamily: "Cairo_Regular",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  hintText: 'Search',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black12)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black12)
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.black12)
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: SizedBox(

                          width: 110,
                          height: 40,

                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => Delivery(),));
                                change = 'Delivery';
                                // widget.Filter(0);
                              });
                            },
                            child: Text('Delivery',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo_Regular',
                                color: Color(
                                    change == 'Delivery'
                                        ? Config.darkColor
                                        : Config.yellowColor),

                              ),

                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .all(Color(change == 'Delivery'
                                  ? Config.yellowColor
                                  : Config.darkColor)),
                              //  elevation: MaterialStateProperty.all(1),
                              // shape: MaterialStateProperty.all(
                              //     RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.all(Radius.circular(15)),
                              //         side: BorderSide(color: Color(Config.yellowColor))
                              //     )
                              // )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 180),
                        child: SizedBox(

                          width: 110,
                          height: 40,

                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => TakeAwa(),));
                                change = 'DeliveryTakeAway';
                                // widget.Filter(1);
                              });
                            },
                            child: Text('TakeAway',
                              style: TextStyle(
                                color: Color(change == 'DeliveryTakeAway'
                                    ? Config.darkColor
                                    : Config.yellowColor),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo_Regular',
                              ),

                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .all(Color(change == 'DeliveryTakeAway'
                                  ? Config.yellowColor
                                  : Config.darkColor)),
                              elevation: MaterialStateProperty.all(2),
                              // shape: MaterialStateProperty.all(
                              //     RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.all(Radius.circular(15)),
                              //         side: BorderSide(color: Color(Config.yellowColor))
                              //     )
                              // )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<UnmodifiableListView<Operations>>(
                    stream: bLoC.HistoryStream,
                    initialData: UnmodifiableListView<Operations>([]),
                    builder: (context, snapshot) {
                      return SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height-250,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15 ),
                            child: SingleChildScrollView(
                              controller: controller,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: DataTable(
                                  border: const TableBorder(left: BorderSide(color: Color(Config.darkColor), width: 1 ),
                                      right: BorderSide(color: Color(Config.darkColor), width: 1)),

                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  columns: const [
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 65.0),
                                        child: Text(
                                          'OrderId',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Cairo_Regular',
                                            color: Color(Config.darkColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 65.0),
                                        child: Text(
                                          'Employee',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Cairo_Regular',
                                            fontSize: 15,
                                            color: Color(Config.darkColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 58.0),
                                        child: Text(
                                          'Status',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Cairo_Regular',
                                            fontSize: 15,
                                            color: Color(Config.darkColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 58.0),
                                        child: Text(
                                          'Customer',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Cairo_Regular',
                                            fontSize: 15,
                                            color: Color(Config.darkColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 62.0),
                                        child: Text(
                                          'Delivery Man',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Cairo_Regular',
                                            fontSize: 15,
                                            color: Color(Config.darkColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  //((element.type == 'Delivery' && (SearchCTRL.text.isNotEmpty ? element.orderId == int.tryParse(SearchCTRL.text) : element.type!.contains(''))) && (change == 1)) || ((element.type == 'DeliveryTakeAway' &&  (SearchCTRL.text.isNotEmpty ?element.orderId == int.tryParse(SearchCTRL.text) : element.type!.contains(''))) || (SearchCTRL.text.isNotEmpty ?element.orderId == int.tryParse(SearchCTRL.text) : element.type!.contains('')) && (change == 2))
                                  // ignore: unnecessary_null_comparison
                                  rows: snapshot.data!.where((element) => element.type == change && (SearchCTRL.text.isNotEmpty ? element.orderId == int.tryParse(SearchCTRL.text) : ''=='') || (_dateTime != null ? _dateTime == element.acceptingDate : _dateTime == DateTime.now())).map((e) =>
                                      DataRow( cells: [
                                        DataCell(
                                          Center(
                                            child: Text(
                                              '${e.orderId}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo_Regular',
                                                fontSize: 15,
                                                color: Color(Config.darkColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(
                                              '${e.ccName}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo_Regular',
                                                fontSize: 15,
                                                color: Color(Config.darkColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(e.status!,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo_Regular',
                                                fontSize: 15,
                                                color: Color(Config.darkColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(e.custoemrName!,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo_Regular',
                                                fontSize: 15,
                                                color: Color(Config.darkColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Center(
                                            child: Text(e.agentName!,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo_Regular',
                                                fontSize: 15,
                                                color: Color(Config.darkColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ])).toList(),

                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),


              ],
            ),


          ),
        ));
  }
}
