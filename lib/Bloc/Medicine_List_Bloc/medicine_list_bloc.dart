import 'dart:async';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Models/Medicine_List_Model/Medicine_Model.dart';
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';
import '../../Service/Medicine_List_Service/medicine_list_service.dart';
import '../../Service/Medicine_Order_Service/medicine_order_service.dart';
import '../bloc.dart';

class MedicineListBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  MedicineListService medicineListservice = MedicineListService();
  List<Medicine> listOfMedicine = [];
  MedicineOrderModel medicineOrder = MedicineOrderModel();
  MedicineOrderService medicineOrderservice = MedicineOrderService();

  Future<void> initPage() async {
    medicineOrder.draftMedicinePlans = [];
    await medicineListservice.getMedicineList().then(
        (value) => {listOfMedicine = value, getDataController.sink.add(true)});
  }

  Future<void> getData(MedicineOrderModel data) async {
    medicineOrder = data;
    getDataController.sink.add(true);
  }

  void increseMedicine(Medicine data) {
    if (medicineOrder.draftMedicinePlans!.isNotEmpty) {
      if (medicineOrder.draftMedicinePlans!
          .where((x) => x.id == data.id)
          .isNotEmpty) {
        medicineOrder.draftMedicinePlans!
            .firstWhere((x) => x.id == data.id)
            .amount = medicineOrder.draftMedicinePlans!
                .firstWhere((x) => x.id == data.id)
                .amount! +
            1;
        getDataController.sink.add(true);
      } else {
        DraftMedicinePlan mockData = DraftMedicinePlan(
            id: data.id,
            medicineName: data.name,
            weight: data.weight,
            amount: 1,
            properties: data.properties);
        medicineOrder.draftMedicinePlans!.add(mockData);
        getDataController.sink.add(true);
      }
    } else {
      DraftMedicinePlan mockData = DraftMedicinePlan(
          id: data.id,
          medicineName: data.name,
          weight: data.weight,
          amount: 1,
          properties: data.properties);
      medicineOrder.draftMedicinePlans!.add(mockData);
      getDataController.sink.add(true);
    }
  }

  void decreseMedicine(Medicine data) {
    if (medicineOrder.draftMedicinePlans!.isNotEmpty) {
      if (medicineOrder.draftMedicinePlans!
          .where((x) => x.id == data.id)
          .isNotEmpty) {
        medicineOrder.draftMedicinePlans!
            .firstWhere((x) => x.id == data.id)
            .amount = medicineOrder.draftMedicinePlans!
                .firstWhere((x) => x.id == data.id)
                .amount! -
            1;
        getDataController.sink.add(true);
      }
    }
  }

  void createOrder(BuildContext context) async {
    medicineOrder.draftMedicinePlans!.forEach((x) {
      x.id = null;
      x.remark = x.remark == null ? "" : x.remark;
      x.dosage = x.dosage == null ? 1 : x.dosage;
      if (x.dosageMeals == null) {
        x.dosageMeals = ["MORNING", "AFTERNOON", "EVENING", "NIGHT"];
      }
      if (x.dosageTimes == null) {
        x.dosageTimes = ["BEFORE", "AFTER"];
      }
    });

    var result = await medicineListservice.addMedicineOrder(medicineOrder); 
    if (result != null) 
    {
      Navigator.pushNamed(context, medicine_order,arguments: result);
    }


    // await medicineListservice.addMedicineOrder(medicineOrder).then((value) => {
    //       if (value) {Navigator.pushNamed(context, medicine_order,
    //               arguments: medicineOrder)}
    //     });
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
