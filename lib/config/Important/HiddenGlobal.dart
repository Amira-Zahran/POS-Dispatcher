import 'package:flutter/material.dart';
import '../BLOC/BLOC_All.dart';
import '../Models/orderModel.dart';

ValueNotifier hidden  = ValueNotifier<bool>(true);
ValueNotifier SearchValue  = ValueNotifier<String>('');
TextEditingController SearchController = TextEditingController();
BLoC bLoC = BLoC();
Orders currentOrder = Orders(id: 0);
