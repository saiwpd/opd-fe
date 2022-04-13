import 'dart:async';
import 'package:appname/Models/Prescription_Model/Prescription_Model.dart';
import 'package:appname/Screen/medicine_order/medicine_order.dart';
import 'package:flutter/material.dart';

import '../../Models/Medicine_List_Model/Medicine_Model.dart';
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';
import '../../Service/Medicine_Order_Service/medicine_order_service.dart';
import '../../routing_constants.dart';
import '../bloc.dart';

class MedicineOrderBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  MedicineOrderService medicineOrderservice = MedicineOrderService();
  MedicinePlanModel medicinePlanModel = MedicinePlanModel();
  // PrescriptionModel prescriptionModel = PrescriptionModel();

  Future<void> initPage(MedicinePlanModel data) async {
    medicinePlanModel = data;
    getDataController.sink.add(true);
  }

  void increseMedicine(int index) {
    medicinePlanModel.draftMedicinePlans![index].amount =
        medicinePlanModel.draftMedicinePlans![index].amount! + 1;
    getDataController.sink.add(true);
  }

  void decreseMedicine(int index) {
    if (medicinePlanModel.draftMedicinePlans![index].amount! > 0) {
      medicinePlanModel.draftMedicinePlans![index].amount =
          medicinePlanModel.draftMedicinePlans![index].amount! - 1;
      getDataController.sink.add(true);
      if (medicinePlanModel.draftMedicinePlans![index].amount! == 0) {
        medicinePlanModel.draftMedicinePlans!.removeAt(index);
        getDataController.sink.add(true);
      }
    }
  }

  void confirmOrder(BuildContext context) async {
    await medicineOrderservice.confirmMedicineOrder(medicinePlanModel).then((value) => {
          if (value) {Navigator.pushNamed(context, fee_list)}
        });
  }

  void sendDataToPlan(BuildContext context) async {
    Navigator.pushNamed(context, medicine_plan);
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
