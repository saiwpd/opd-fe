import 'dart:async';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Models/Medicine_List_Model/Medicine_Model.dart';
import '../../Models/Medicine_Order_Model/Medicine_Order_Model.dart' as order_model;
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart' as plan_model;
import '../../Service/Medicine_List_Service/medicine_list_service.dart';
import '../../Service/Medicine_Order_Service/medicine_order_service.dart';
import '../bloc.dart';

class MedicineListBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  MedicineListService medicineListservice = MedicineListService();
  List<Medicine> listOfMedicine = [];
  order_model.MedicineOrderModel medicineOrderModel = order_model.MedicineOrderModel();
  plan_model.MedicinePlanModel medicinePlanModel = plan_model.MedicinePlanModel();
  MedicineOrderService medicineOrderservice = MedicineOrderService();

  Future<void> initPage() async {
    medicineOrderModel.draftMedicinePlans = [];
    medicinePlanModel.draftMedicinePlans = [];
    await medicineListservice.getMedicineList().then(
        (value) => {listOfMedicine = value, getDataController.sink.add(true)});
  }

  Future<void> getData(order_model.MedicineOrderModel data) async {
    medicineOrderModel = data;
    getDataController.sink.add(true);
  }

  void increseMedicine(Medicine data) {
    if (medicineOrderModel.draftMedicinePlans!.isNotEmpty) {
      if (medicineOrderModel.draftMedicinePlans!
          .where((x) => x.medicineName == data.name)
          .isNotEmpty) {
        medicineOrderModel.draftMedicinePlans!
            .firstWhere((x) => x.medicineName == data.name)
            .amount = medicineOrderModel.draftMedicinePlans!
                .firstWhere((x) => x.medicineName == data.name)
                .amount! +
            1;
        getDataController.sink.add(true);
      } else {
        order_model.DraftMedicinePlan mockData = order_model.DraftMedicinePlan(
            //id: data.id,
            medicineName: data.name,
            weight: data.weight,
            amount: 1,
            properties: data.properties);
        medicineOrderModel.draftMedicinePlans!.add(mockData);
        getDataController.sink.add(true);
      }
    } else {
      order_model.DraftMedicinePlan mockData = order_model.DraftMedicinePlan(
          //id: data.id,
          medicineName: data.name,
          weight: data.weight,
          amount: 1,
          properties: data.properties);
      medicineOrderModel.draftMedicinePlans!.add(mockData);
      getDataController.sink.add(true);
    }
  }

  void decreseMedicine(Medicine data) {
    if (medicineOrderModel.draftMedicinePlans!.isNotEmpty) {
      if (medicineOrderModel.draftMedicinePlans!
          .where((x) => x.medicineName == data.name)
          .isNotEmpty) {
        medicineOrderModel.draftMedicinePlans!
            .firstWhere((x) => x.medicineName == data.name)
            .amount = medicineOrderModel.draftMedicinePlans!
                .firstWhere((x) => x.medicineName == data.name)
                .amount! -
            1;
        getDataController.sink.add(true);
      }
    }
  }

  void createOrder(BuildContext context) async {
    medicineOrderModel.patientId = "1";
    medicineOrderModel.doctorId = "2";

    medicineOrderModel.draftMedicinePlans!.forEach((x) {
      //x.id = null;
      x.dosage = 0;
      if (x.dosageTimes == null) {
        x.dosageTimes = [];
      }
      if (x.dosageMeals == null) {
        x.dosageMeals = [];
      }
    });

    var result = await medicineListservice.addMedicineOrder(medicineOrderModel); 
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
