import 'dart:async';
import 'package:appname/Service/Medicine_Plan_Service/medicine_plan_service.dart';
import 'package:flutter/material.dart';

import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';
import '../../Screen/medicine_order/medicine_order.dart';
import '../../routing_constants.dart';
import '../bloc.dart';

class MedicinePlanBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  MedicinePlanModel medicinePlanModel = MedicinePlanModel();
  DraftMedicinePlan draftMedicinePlan = DraftMedicinePlan();
  MedicinePlanService medicinePlanService = MedicinePlanService();
  // PrescriptionModel prescriptionModel = PrescriptionModel();

  Future<void> initPage(DraftMedicinePlan data) async {
    medicinePlanModel.draftMedicinePlans = [];
    medicinePlanModel.draftMedicinePlans?.add(draftMedicinePlan);
    draftMedicinePlan = data;
    getDataController.sink.add(true);
  }

  void confirmPlan(BuildContext context) async {
    // medicinePlanModel.draftMedicinePlans?.add(draftMedicinePlan);
    // medicinePlanModel.draftMedicinePlans!.forEach((x) {
    //   //x.id = null;
    //   if (x.dosageMeals == null) {
    //     x.dosageMeals = ["MORNING", "AFTERNOON", "EVENING", "NIGHT"];
    //   }
    //   if (x.dosageTimes == null) {
    //     x.dosageTimes = ["BEFORE", "AFTER"];
    //   }
    // });
    
    var result = await medicinePlanService.editMedicinePlan(medicinePlanModel);
    if (result != null) {
      Navigator.pop(context, result);
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MedicineOrder(
      //           data: settings.arguments as MedicinePlanModel,
      //         )));
      
    };
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
