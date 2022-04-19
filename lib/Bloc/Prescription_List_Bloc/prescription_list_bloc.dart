import 'dart:async';
import 'package:appname/Bloc/bloc.dart';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Models/Prescription_List_model/Prescription_Model.dart';
import '../../Service/Prescription_List_Service/prescription_list_service.dart';

class PrescriptionListBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  PrescriptionListService prescriptionListService = PrescriptionListService();
  List<Prescription> listOfPrescription = [];

  Future<void> initPage() async {
    await prescriptionListService.getPrescriptionList().then(
      (value) => {listOfPrescription = value, getDataController.sink.add(true)}
      );
  }

  Future<void> getData() async {

  }

  @override
  void dispose() {
    getDataController.close();
  }
}