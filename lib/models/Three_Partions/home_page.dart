// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:pos_final/assets/colors/Config.dart';
import 'package:pos_final/models/Three_Partions/getList.dart';
import 'package:pos_final/head%20bar%20widget/side_bar_menu.dart';

import '../History/History.dart';




class Home_Page extends StatefulWidget {


  @override
  _Home_PageState createState() => _Home_PageState();
}
class _Home_PageState extends State<Home_Page> {

  int ItemSelected = 1;

/*
  void AcceptOrder(id) async{
    var userToken='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NWIzODg2NC03OWVjLTRkMWItYmRhMy0zNGYyNjBhNDdjZDIiLCJqdGkiOiI0ZDIxN2M2NmE2NDcwNzRjOWRlY2JmNzNiMWUyODlmYmU2YWI0OGY2ZGE5ODE5ODYyMGQ5YjEyYjgxMzFmMDczMmY1ODU5ZTRmOGQ3NDRkZCIsImlhdCI6MTY0NTk4MzI0Ny4wOTEyNzQsIm5iZiI6MTY0NTk4MzI0Ny4wOTEyODEsImV4cCI6MTY3NzUxOTI0Ny4wODExNTgsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.wnQmz3olPaF-K0Z5GKjm0kgFFRYDCY7kST0GKzYAThh7b5THCFae3DRze1q1cK8jt2ueaQ-TtvkzZYcQz28FT2xlDffAGpbMuvleW_D_7PgQJiedhudC4dPbUHUfUPqlkmOEl6ntf83JBdZgODXPIiDzOZDyq6SzFBMOm8mimOg-ZGGCeGrWYp3Bjj4fpuccdOKJABbczE53LrVrIVm8yMKpc6CFH167HreuHwqJn2vSHPwcOBzPURKHlZbcMELFxqmQknM5X9dF5OHHELdYLf9RoBd4sHHinmSUZ7fpHwA1-kKz-FhGt7RwPTzzVUepH8c5bT6GW0HIXCmfqv3aKGjpsfj9W7wj0tQxzp2sZqVPB2xQ-RYqQEb3QhM7rhQCxk2UzRxV6k_XxsPSMT5IIl4scdGucovYkg-Xmm47Gb-H0ID3fvp_z0JThvrxEcqklkMfBm1e2QOVs9jjkRWVwur14WogF1bsi7lpl28xjuu01G0lZwSfpMdCBJaoZzp984-mnsQiWhFKhnBb74DsQH2Kxh9UIleNWR3QTqx9WBzyfJ-GSAjDl7T1L3lEYxKEkZGuJq0FOD4hjaeCTmH-j4YgwGhxME991Jr9O3dx_1s9Uxwx2rOlGLieqx5cy4Dujm2Ans3FYPACtkzVHIjczaxpMmfJGO74UO2P46R0MJ4';
    Response response =  await post(Uri.parse("https://osharif.xyz/api/Dispatching/getOrders"),
        headers: {
          'Authorization':'Bearer ${userToken}',
          'Accept':'application/json'
        },
        body: {


        }
        );

  }
*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Config.darkColor),
      body: SafeArea(
        child: Row(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            //Side Button Menu
            SizedBox(
              width: MediaQuery.of(context).size.width*0.17,
              child: Side_bar(onItemSelected: (v){
                setState(() {
                  ItemSelected = v;
                });
              },),
            ),


            //Mian Body
            ItemSelected == 3 ? Container(width:MediaQuery.of(context).size.width-261.2,height: MediaQuery.of(context).size.height,child: HistoryPage()): Expanded(
                flex: 4,
                child: Container(
                  child: orders_page(filter: ItemSelected),
                )),

          ],
        ),
      ),

    );
  }
}
