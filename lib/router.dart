import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'Screen/medicine_list/medicine_list.dart';
import 'Screen/medicine_order/medicine_order.dart';
import 'Screen/medicine_plan/medicine_plan.dart';
import 'Screen/service_invoice/service_invoice.dart';
import 'Screen/service_list/service_list.dart';
import 'Screen/service_receipt/service_receipt.dart';

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
    case service_list:
      return MaterialPageRoute(
          builder: (context) => ServiceList(
              //data: settings.arguments,
              ));
    case service_invioce:
      return MaterialPageRoute(
          builder: (context) => ServiceInvoice(
              //data: settings.arguments,
              ));
    case service_reciept:
      return MaterialPageRoute(
          builder: (context) => ServiceReciept(
              //data: settings.arguments,
              ));
    default:
      return MaterialPageRoute(builder: (context) => MedicineList());
  }
}
