import 'package:appname/Models/Fee_List_Model/Fee_Model.dart';
import 'package:appname/Models/Medicine_Plan_Model/medicine_plan_model.dart';
import 'package:appname/Models/Medicine_Plan_Model/medicine_plan_model.dart' as plan_model;
import 'package:appname/Models/Prescription_List_model/Prescription_Model.dart';
import 'package:appname/Models/Prescription_Model/Prescription_Model.dart';
import 'package:appname/Screen/prescription_list/prescription_list.dart';
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
                data: settings.arguments as MedicinePlanModel,
              ));
    case medicine_plan:
      return MaterialPageRoute(
          builder: (context) => MedicinePlan(
                data: settings.arguments as plan_model.DraftMedicinePlan,
              ));
    case fee_list:
      return MaterialPageRoute(
          builder: (context) => FeeList(
              //data: settings.arguments,
              ));
    case fee_invioce:
      return MaterialPageRoute(
          builder: (context) => FeeInvoice(
                data: settings.arguments as FeeModel,
              ));
    case fee_reciept:
      return MaterialPageRoute(
          builder: (context) => FeeReciept(
              //data: settings.arguments,
              ));
    case prescription_list:
      return MaterialPageRoute(
        builder: ((context) => PrescriptionList())
      );
    default:
      return MaterialPageRoute(builder: (context) => MedicineList());
  }
}
