import 'dart:async';
import 'package:flutter/material.dart';

import '../../Models/Medicine_List_Model/Medicine_Model.dart';
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';
import '../../Service/Medicine_Order_Service/medicine_order_service.dart';
import '../../routing_constants.dart';
import '../bloc.dart';

class MedicineOrderBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  MedicineOrderService medicineOrderservice = MedicineOrderService();
  MedicineOrderModel medicineOrder = MedicineOrderModel();

  Future<void> initPage(MedicineOrderModel data) async {
    medicineOrder = data;
    getDataController.sink.add(true);
  }

  void increseMedicine(int index) {
    medicineOrder.draftMedicinePlans![index].amount =
        medicineOrder.draftMedicinePlans![index].amount! + 1;
    getDataController.sink.add(true);
  }

  void decreseMedicine(int index) {
    if (medicineOrder.draftMedicinePlans![index].amount! > 0) {
      medicineOrder.draftMedicinePlans![index].amount =
          medicineOrder.draftMedicinePlans![index].amount! - 1;
      getDataController.sink.add(true);
      if (medicineOrder.draftMedicinePlans![index].amount! == 0) {
        medicineOrder.draftMedicinePlans!.removeAt(index);
        getDataController.sink.add(true);
      }
    }
  }

  void createOrder(BuildContext context) async {
    medicineOrder.draftMedicinePlans!.forEach((x) {
      x.remark = x.remark == null ? "" : x.remark;
      x.dosage = x.dosage == null ? 1 : x.dosage;
      if (x.dosageMeals == null) {
        x.dosageMeals = ["MORNING", "AFTERNOON", "EVENING", "NIGHT"];
      }
      if (x.dosageTimes == null) {
        x.dosageTimes = ["BEFORE", "AFTER"];
      }
    });

    await medicineOrderservice.addMedicineOrder(medicineOrder).then((value) => {
          if (value) {Navigator.pushNamed(context, medicine_list)}
        });
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
