import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:core';

import '../../main.dart';
import '../API/api_Helper.dart';
import '../Important/Printing.dart';
import '../Models/HistoryModel.dart';
import '../Models/Login/User.dart';
import '../Models/deliveryAgent.dart';
import '../Models/orderModel.dart';

class BLoC {

  User user = User();

  late Timer _time;

  List<Orders> _orders = [];
  final _ordersSubject = BehaviorSubject<UnmodifiableListView<Orders>>();

  Stream<UnmodifiableListView<Orders>> get OrdersStream => _ordersSubject.stream;

  List<Agents> _agents = [];

  final _agentsSubject = new BehaviorSubject<UnmodifiableListView<Agents>>();

  Stream<UnmodifiableListView<Agents>> get AgentsStream =>
      _agentsSubject.stream;

  List<Operations> _history = [];

  final _historySubject = BehaviorSubject<UnmodifiableListView<Operations>>();

  Stream<UnmodifiableListView<Operations>> get HistoryStream => _historySubject.stream;

  Future<Null> getHistory({String? query}) async {

    Response response = await post(Uri.parse(API.history), headers: {
      "Authorization":
      "Bearer ${user.token}" });
    // print(response.body);
    Map<String, dynamic> data = json.decode(response.body);

    _history =
        (data['orders'] as List).map((v) => Operations.fromJson(v)).toList();

    _historySubject.add(UnmodifiableListView(_history));
  }
  Future<Null> login(username, password) async{
    Response response = await post(Uri.parse(API.login),body: {'email':username,'password':password});
    // print(response.request);
    // print(response.body);
    Map<String, dynamic> data = json.decode(response.body);
    user = User.fromJson(data);
    runApp(const MyApp());
  }

  Future<Null> getAgents() async {
    Response response = await post(Uri.parse(API.getAgent), headers: {
      "Authorization":
      "Bearer ${user.token}"  });
    // print(response.body);
    Map<String, dynamic> data = json.decode(response.body);
    _agents = (data['agents'] as List).map((v) => Agents.fromJson(v)).toList();
    // _agents.add(Agents(id: 0,name: 'Select'));
    _agentsSubject.add(UnmodifiableListView(_agents));
  }

  Future<Null> dispatch({int? selectedName,int? currentOrder}) async{
    Response response =
    await post(Uri.parse(API.createOp), headers: {
      "Authorization":
      "Bearer ${user.token}"
    }, body: {
      'agent': selectedName.toString(),
      'order': currentOrder.toString()
    });
    response.statusCode ==  200 ? PrintingServices().printFromURL(url: API.printReceipt,id: currentOrder.toString(),printType: PrintType.DEFAULT_PRINTER) : null;
  }

  Future<Null> getOrders({String? query}) async {

    // MenuItem(item_name: 'fai')
    Response response = await post(Uri.parse(API.getOrders), headers: {
      "Authorization":
      "Bearer ${user.token}"
    });
    // print(response.body);
    Map<String, dynamic> data = json.decode(response.body);
    _orders =
        (data['orders'] as List).map((v) => Orders.fromJson(v)).toList();
    if(query != null){
      _orders= _orders.where((element) => element.orderId!.toString().contains(query.toLowerCase())).toList();
    }

    _ordersSubject.add(UnmodifiableListView(_orders));
  }

  Future<void> acceptOrder(id) async{
    Response response = await post(Uri.parse(API.acceptOrder),
        headers: {
          "Authorization": "Bearer ${user.token}"
        },
        body: {
          "id" : id.toString()
        }

    );
    print(response.body);
  }

  Future<void> updateOrderState({int? id,String? status}) async{
    Response response = await post(Uri.parse(API.updateStatus),
        headers: {
          "Authorization": "Bearer ${user.token}"
        },
        body: {
          "id" : id.toString(),
          "status" : status!,
        }

    );
    print(response.body);
  }
  BLoC() {
    _time = Timer.periodic(const Duration(seconds: 5), (timer) {
      getOrders();
      getAgents();
      getHistory();
    });

  }



}
