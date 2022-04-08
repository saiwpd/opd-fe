import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'Screen/medicine_list/medicine_list.dart';
import 'Screen/medicine_order/medicine_order.dart';
import 'Screen/medicine_plan/medicine_plan.dart';
import 'Screen/fee_invoice/fee_invoice.dart';
import 'Screen/fee_list/fee_list.dart';
import 'Screen/fee_receipt/fee_receipt.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(builder: (context) => MedicineList());
    case medicine_list:
      return MaterialPageRoute(builder: (context) => MedicineList());
    case medicine_order:
      return MaterialPageRoute(
          builder: (context) => MedicineOrder(
              //data: settings.arguments,
              ));
    case medicine_plan:
      return MaterialPageRoute(
          builder: (context) => MedicinePlan(
              //data: settings.arguments,
              ));
    case fee_list:
      return MaterialPageRoute(
          builder: (context) => FeeList(
              //data: settings.arguments,
              ));
    case fee_invioce:
      return MaterialPageRoute(
          builder: (context) => FeeInvoice(
              //data: settings.arguments,
              ));
    case fee_reciept:
      return MaterialPageRoute(
          builder: (context) => FeeReciept(
              //data: settings.arguments,
              ));
    default:
      return MaterialPageRoute(builder: (context) => MedicineList());
  }
}
