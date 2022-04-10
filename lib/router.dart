import 'package:appname/Models/Fee_List_Model/Fee_Model.dart';
import 'package:appname/Models/Prescription_Model/Prescription_Model.dart';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'Models/Medicine_Plan_Model/medicine_plan_model.dart';
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
                data: settings.arguments as PrescriptionModel,
              ));
    case medicine_plan:
      return MaterialPageRoute(builder: (context) => MedicinePlan());
    case fee_list:
      return MaterialPageRoute(
          builder: (context) => FeeList(
              //data: settings.arguments,
              ));
    case fee_invioce:
      return MaterialPageRoute(
          builder: (context) => FeeInvoice(
                data: settings.arguments as Fee,
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
