import 'dart:async';
import 'package:appname/Models/Payment_Model/payment_model.dart';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Service/Payment_Service/payment_service.dart';
import '../bloc.dart';

class PaymentBloc implements Bloc {
  PaymentService paymentService = new PaymentService();
  StreamController<bool> getDataController = StreamController<bool>();
  PaymentModel paymentModel = new PaymentModel();

  Future<void> initPage() async {
    paymentModel;
    getDataController.sink.add(true);
  }

  void createPayment(BuildContext context, String refId) async {
    var result = await paymentService.CreatePayment(paymentModel); 
    if (result != null) 
    {
      Navigator.pushNamed(context, mock_bank, arguments: refId);
    }
  }

  void confirmPayment(BuildContext context) async {
    var result = await paymentService.Payments(paymentModel); 
    if (result != null) 
    {
      Navigator.pushNamed(context, homeRoute);
    }
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
