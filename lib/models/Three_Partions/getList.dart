import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pos_final/models/Three_Partions/list_view.dart';

import '../../assets/Colors/Config.dart';
import '../../head bar widget/Head_Bar.dart';



class orders_page extends StatefulWidget {
  int filter;
  orders_page({Key? key,required this.filter});

   @override
   _orders_pageState createState() => _orders_pageState();
 }

 class _orders_pageState extends State<orders_page> {

   int ActiveFilter = 0;

   @override
   Widget build(BuildContext context) {
     return Container(
       decoration:BoxDecoration(color: Color(Config.darkColor),

         borderRadius: BorderRadius.circular(35),
       ),
       child: Column(
         children: [
           Bar(onFilter: (v){
             setState(() {
               ActiveFilter = v;
             });
           },),
           Expanded(child:
           Row(
             children: [
               Expanded(
                 flex: 2,
                 child: Listview(filterMain: widget.filter,filterSecond: ActiveFilter,),
               )
             ],
           ) ),
         ],
       ),
     );
   }
 }

