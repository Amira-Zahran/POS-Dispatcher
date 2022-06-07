import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:pos_final/assets/colors/Config.dart';
import 'package:pos_final/config/Models/deliveryAgent.dart';
import '../../config/BLOC/BLOC_All.dart';
import '../../config/Important/HiddenGlobal.dart';
import '../../config/Models/orderModel.dart';

class Listview extends StatefulWidget {
  Listview({Key? key, required this.filterMain, required this.filterSecond})
      : super(key: key);

  int filterMain;
  int filterSecond;

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  int? selectedName;
  List<Orders>? filteredOrders;

  // Orders currentOrder = Orders(id: 0);

  ScrollController sideBar = ScrollController();

  int activeButton = 0;
  final ScrollController controllerOne = ScrollController();
  final ScrollController controllerTwo = ScrollController();

  // bool vl.value = true;

  double daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inMinutes / 60);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(249, 183, 0, 1),
          body: GestureDetector(
            onTap: (){
              activeButton = 0;
              print('clicked');
              setState(() {
                hidden.value = true;

              });
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  part1(),
                  const SizedBox(
                    width: 10,
                    height: 100,
                  ),
                  part2(),
                  const SizedBox(
                    width: 10,
                    height: 100,
                  ),
                  part3(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget part1() => AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    width: (widget.filterMain != 1
        ? 0.4
        : (MediaQuery.of(context).size.width - (hidden.value ? 159 : 0)) *
        (hidden.value ? 0.45 : 0.275)),
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 183, 0, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Takeaway Orders',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'Cairo_Regular',
                color: Color.fromRGBO(14, 35, 46, 1),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<UnmodifiableListView<Orders>>(
          stream: bLoC.OrdersStream,
          initialData: UnmodifiableListView<Orders>([]),
          builder: (context, snapshot) {
            return Container(width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Scrollbar(
                controller: controllerOne,
                isAlwaysShown: true,
                child: GridView(
                  controller: controllerTwo,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: hidden.value ? 3 : 2),
                  children: snapshot.data!.where((element) => (element.type == 'DeliveryTakeAway' &&
                      (widget.filterMain == 1
                          ? (widget.filterSecond == 0
                          ? !element.status!.contains('OnWay')
                          : element.status!.contains(filterTrans()))
                          : element.status!.contains('OnWay')) &&
                      (SearchController.text.isNotEmpty
                          ? element.orderId ==
                          int.parse(SearchController.text)
                          : '' == ''))).map((e) => Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        part3();
                        currentOrder = e;
                        setState(() {
                          currentOrder = e;
                          activeButton = e.id!;
                          hidden.value = false;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color(activeButton == e.id!
                                  ? Config.yellowColor
                                  : Config.darkColor)),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                                /*side: BorderSide(
                                                      color: Color(Config.yellowColor))*/
                              ))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          State(e.status!),
                          //State(DateTime.now().difference(DateTime.parse(e.date!)).inMinutes),
                          Center(
                            child: Text('${e.orderId}',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Cairo_Regular',
                                  color: Color(activeButton == e.id!
                                      ? Config.darkColor
                                      : Config.yellowColor),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const Center(
                              child: SizedBox(
                                height: 8,
                              )),
                          Center(
                              child: Text(
                                //!.split('').last
                                DateTime.now().difference(DateTime.parse(e.date!)).inMinutes.toString() + "\nMinuets Ago",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Cairo_Regular',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),).toList(),),
              ),
            );
          }),
    ),
  );

  Widget part2() => AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    width: (widget.filterMain != 1
        ? MediaQuery.of(context).size.width * 0.555
        : (MediaQuery.of(context).size.width - (hidden.value ? 185 : 0)) *
        (hidden.value ? 0.45 : 0.275)),
    child: Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(249, 183, 0, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Delivery Orders',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: 'Cairo_Regular',
                    color: Color.fromRGBO(14, 35, 46, 1),
                  )),
            ],
          ) //text.center),
      ),
      body: StreamBuilder<UnmodifiableListView<Orders>>(
          stream: bLoC.OrdersStream,
          initialData: UnmodifiableListView<Orders>([]),
          builder: (context, snapshot) {
            return Scrollbar(
              controller: controllerTwo,
              isAlwaysShown: true,
              child: GridView(
                  controller: controllerOne,
                  //semanticChildCount: length ,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: hidden.value ? 3 : (widget.filterMain != 1 ? 4 : 2)),
                  children: snapshot.data!.where((element) => (element.type == 'Delivery' && (widget.filterMain == 1
                      ? (widget.filterSecond == 0
                      ? !element.status!.contains('OnWay')
                      : element.status!.contains(filterTrans()))
                      : element.status!.contains('OnWay')) &&
                      (SearchController.text.isNotEmpty
                          ? element.orderId == int.parse(SearchController.text)
                          : '' == ''))).map((e) => Container(
                    padding:  EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        part3();
                        currentOrder = e;
                        setState(() {
                          activeButton = e.id!;
                          hidden.value = false;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Color(
                              activeButton == e.id!
                                  ? Config.yellowColor
                                  : Config.darkColor)),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                /*side: BorderSide(
                                                    color: Color(Config.yellowColor))*/
                              ))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          State(e.status!),
                          //State(DateTime.now().difference(DateTime.parse(e.date!)).inMinutes),
                          Center(
                            child: Text('${e.orderId}',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Cairo_Regular',
                                  color: Color(activeButton == e.id!
                                      ? Config.darkColor
                                      : Config.yellowColor),
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const Center(
                              child: SizedBox(
                                height: 8,
                              )),
                          Center(
                              child: Text(
                                //!.split('').last
                                DateTime.now().difference(DateTime.parse(e.date!)).inMinutes.toString() + "\nMinuets Ago",
                                textAlign: TextAlign.center,                                    style: const TextStyle(
                                fontFamily: 'Cairo_Regular',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              )),
                        ],
                      ),
                    ),),).toList()),
            );
          }),
    ),
  );

  Widget part3() => SizedBox(
    width: hidden.value ? 0 : 400,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(249, 183, 0, 1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Order Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: 'Cairo_Regular',
                    color: Color.fromRGBO(14, 35, 46, 1),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: StreamBuilder<UnmodifiableListView<Orders>>(
                  stream: bLoC.OrdersStream,
                  initialData: UnmodifiableListView<Orders>([]),
                  builder: (context, snapshot) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Order ID: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        14, 35, 46, 1),
                                  ),
                                ),
                                Text(
                                  '${currentOrder.orderId}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        249, 183, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Cus-name: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        14, 35, 46, 1),
                                  ),
                                ),
                                Text(
                                  currentOrder.customer?.name ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        249, 183, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Number: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        14, 35, 46, 1),
                                  ),
                                ),
                                Text(
                                  currentOrder.customer?.phones![0]
                                      .phoneNumber ??
                                      '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        249, 183, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Delivery-fee: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        14, 35, 46, 1),
                                  ),
                                ),
                                Text(
                                  '${double.parse(currentOrder.total!) -
                                      double.parse(
                                          currentOrder.subtotal!)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        249, 183, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Total: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        14, 35, 46, 1),
                                  ),
                                ),
                                Text(
                                  currentOrder.total.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        249, 183, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Date: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        14, 35, 46, 1),
                                  ),
                                ),
                                Text(
                                  currentOrder.date ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        249, 183, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Time: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        14, 35, 46, 1),
                                  ),
                                ),
                                Text(
                                  '${currentOrder.id != 0
                                      ? daysBetween(DateTime.parse(
                                      currentOrder.date!),
                                      DateTime.parse(
                                          currentOrder.updated_at!))
                                      : ''}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Color.fromRGBO(
                                        249, 183, 0, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // ignore: unnecessary_null_comparison
                          currentOrder != null ? (currentOrder.status == 'Ready' ? SafeArea(
                            child: StreamBuilder<UnmodifiableListView<Agents>>(
                                stream: bLoC.AgentsStream,
                                initialData: UnmodifiableListView<Agents>([]),
                                builder: (context, snapshot) {
                                  // print(snapshot.data![1].name);
                                  return Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: DropdownButton(
                                      dropdownColor: Colors.white, iconSize: 30,
                                      hint: Text('Select Delivery Man',
                                        style: TextStyle(color: Color(Config.darkColor),
                                            fontFamily: 'Cairo_Regular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      items: snapshot.data!.map((e) => DropdownMenuItem(value: e.id,
                                        child: Text(e.name!,
                                          style: TextStyle(color: Config.BarColor,
                                              fontFamily: 'Cairo_Regular',
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),),)).toList(),
                                      onChanged: (int? theName) {
                                        // print(theName!.name);
                                        setState(() {
                                          selectedName = theName;
                                          // print(selectedName!.name);
                                        });
                                      },
                                      value: selectedName,
                                    ),

                                  );
                                }
                            ),
                          ) : const Text('')) : const Text(''),

                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                button(),
                                /*click here with order number*/
                                Padding(
                                  padding: const EdgeInsets.only(top: 15 ),
                                  child: SizedBox(
                                    width: 400,
                                    child: DataTable(
                                        decoration: BoxDecoration(color: const Color(Config.darkColor),borderRadius: BorderRadius.circular(10)),
                                        columns: const [
                                          DataColumn(
                                            label: Center(
                                              child: Text(
                                                'Item',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cairo_Regular',
                                                  color: Color(Config.yellowColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Center(
                                              child: Text(
                                                'Quantaty',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cairo_Regular',
                                                  fontSize: 15,
                                                  color: Color(Config.yellowColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Center(
                                              child: Text(
                                                'Note',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cairo_Regular',
                                                  fontSize: 15,
                                                  color: Color(Config.yellowColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                        rows: currentOrder.items != null ?
                                        currentOrder.items!.map((e) => DataRow(cells: [
                                          DataCell(
                                            Center(
                                              child: Text(
                                                e.itemName!,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cairo_Regular',
                                                  fontSize: 15,
                                                  color: Color(0xffF9B700),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(
                                                '${e.quantity}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cairo_Regular',
                                                  fontSize: 15,
                                                  color: Color(0xffF9B700),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Center(
                                              child: Text(e.comment!,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cairo_Regular',
                                                  fontSize: 15,
                                                  color: Color(0xffF9B700),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ])).toList() :
                                        []
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        );
      },
    ),
  );

  Widget button() {
    switch (currentOrder.status) {
      case 'Added':
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(
                      currentOrder.id == currentOrder.id!
                          ? Config.yellowColor
                          : Config.darkColor)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    /*side: BorderSide(
                                          color: Color(Config.yellowColor))*/
                  ))),
              onPressed: () {
                setState(() {
                  activeButton = currentOrder.id!;
                  bLoC.acceptOrder(currentOrder.id!);
                });
              },
              child: const Text(
                'Accept',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Cairo_Regular',
                  color: Colors.white,
                ),
              )),
        );
        break;
      case 'Preparing':
        return Text('');
      case 'Ready':
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(
                      currentOrder.id == currentOrder.id!
                          ? Config.yellowColor
                          : Config.darkColor)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ))),
              onPressed: () {
                bLoC.dispatch(selectedName: selectedName, currentOrder: currentOrder.id);
                setState(() {
                  currentOrder.id = currentOrder.id!;
                  // bLoC.(currentOrder.id!);
                });
              },
              child: const Text(
                'Dispatch',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Cairo_Regular',
                  color: Colors.white,
                ),
              )),
        );
        break;
      case 'OnWay':
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(
                      currentOrder.id == currentOrder.id!
                          ? Config.yellowColor
                          : Config.darkColor)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    /*side: BorderSide(
                                          color: Color(Config.yellowColor))*/
                  ))),
              onPressed: () {
                bLoC.updateOrderState(id: currentOrder.id!,status: 'Done');
                setState(() {
                  activeButton = currentOrder.id!;
                  // bLoC.(currentOrder.id!);
                });
              },
              child: const Text(
                'Done',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Cairo_Regular',
                  color: Colors.white,
                ),
              )),
        );
      default:
        return Text('');
    }
  }
  Widget State(String status) {
    switch (status) {
      case 'Added':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 10, height: 10,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),

          ),
        );
      case 'Preparing':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 10, height: 10,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10)
            ),

          ),
        );
      case 'Ready':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 10, height: 10,
            decoration: BoxDecoration(
                color: Colors.green
                , borderRadius: BorderRadius.circular(10)
            ),

          ),
        );
      case 'OnWay':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 10, height: 10,
            decoration: BoxDecoration(
                color: Colors.red
                , borderRadius: BorderRadius.circular(10)
            ),

          ),
        );
      default:
        return const Text('');
    }
  }

/*  Widget State(int DateTime) {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: DateTime < 20 ? Colors.white : Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),),);
  }*/

  String filterTrans(){
    switch(widget.filterSecond){
      case 1:
        return 'Added';
      case 2:
        return 'Preparing';
      case 3:
        return 'Done';
      default:
        return '';
    }
  }

}
