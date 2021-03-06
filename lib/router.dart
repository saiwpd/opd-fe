import 'package:appname/Models/Fee_List_Model/Fee_Model.dart';
import 'package:appname/Models/Medicine_Plan_Model/medicine_plan_model.dart';
import 'package:appname/Models/Medicine_Plan_Model/medicine_plan_model.dart'
    as plan_model;
import 'package:appname/Models/Prescription_List_model/Prescription_Model.dart';
import 'package:appname/Models/Prescription_Model/Prescription_Model.dart';
import 'package:appname/Screen/menu/menu.dart';
import 'package:appname/Screen/sign_in/sign_in.dart';
import 'package:appname/Screen/otp_form/otp_form.dart';
import 'package:appname/Screen/payment/payment.dart';
import 'package:appname/Screen/prescription_list/prescription_list.dart';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'Models/Payment_Model/payment_model.dart';
import 'Models/Sign_In/Sign_In.dart';
import 'Screen/medicine_list/medicine_list.dart';
import 'Screen/medicine_order/medicine_order.dart';
import 'Screen/medicine_plan/medicine_plan.dart';
import 'Screen/fee_invoice/fee_invoice.dart';
import 'Screen/fee_list/fee_list.dart';
import 'Screen/fee_receipt/fee_receipt.dart';
import 'Screen/mock_bank/mock_bank.dart';
import 'Screen/otp_form/otp_form.dart';
import 'Screen/menu/menu.dart';
import 'Screen/notification/notification.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(builder: (context) => Sign_in());
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
      return MaterialPageRoute(builder: ((context) => PrescriptionList()));
    case payment:
      return MaterialPageRoute(
          builder: (context) => Payment(
                data: settings.arguments as String,
              ));
    case otp_form:
      return MaterialPageRoute(
          builder: (context) => Otp_form(
              data: settings.arguments as String,
              ));
    case menu:
      return MaterialPageRoute(
          builder: (context) => Menu(
              //data: settings.arguments,
              ));
    // case notification:
    //   return MaterialPageRoute(builder: (context) => NotificationList());
    case notification:
      return MaterialPageRoute(
          builder: (context) => NotificationList(
                data: settings.arguments as String,
              ));
    case mock_bank:
      return MaterialPageRoute(
          builder: (context) => MockBank(
                data: settings.arguments as PaymentModel,
              ));
    default:
      return MaterialPageRoute(builder: (context) => Menu());
  }
}
