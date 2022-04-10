import 'dart:async';
import 'package:appname/Models/Prescription_Model/Prescription_Model.dart';
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
  PrescriptionModel prescriptionModel = PrescriptionModel();

  Future<void> initPage(PrescriptionModel data) async {
    prescriptionModel = data;
    getDataController.sink.add(true);
  }

  void increseMedicine(int index) {
    prescriptionModel.draftMedicinePlans![index].amount =
        prescriptionModel.draftMedicinePlans![index].amount! + 1;
    getDataController.sink.add(true);
  }

  void decreseMedicine(int index) {
    if (prescriptionModel.draftMedicinePlans![index].amount! > 0) {
      prescriptionModel.draftMedicinePlans![index].amount =
          prescriptionModel.draftMedicinePlans![index].amount! - 1;
      getDataController.sink.add(true);
      if (prescriptionModel.draftMedicinePlans![index].amount! == 0) {
        prescriptionModel.draftMedicinePlans!.removeAt(index);
        getDataController.sink.add(true);
      }
    }
  }

  void confirmOrder(BuildContext context) async {
    // prescriptionModel.draftMedicinePlans!.forEach((x) {
    //   x.remark = x.remark == null ? "" : x.remark;
    //   x.dosage = x.dosage == null ? 1 : x.dosage;
    //   if (x.dosageMeals == null) {
    //     x.dosageMeals = ["MORNING", "AFTERNOON", "EVENING", "NIGHT"];
    //   }
    //   if (x.dosageTimes == null) {
    //     x.dosageTimes = ["BEFORE", "AFTER"];
    //   }
    // });

    await medicineOrderservice.confirmMedicineOrder(prescriptionModel.id).then((value) => {
          if (value) {Navigator.pushNamed(context, fee_list)}
        });
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
