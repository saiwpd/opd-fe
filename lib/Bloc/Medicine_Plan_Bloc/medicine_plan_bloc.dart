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
  bool? isMorning = false;
  bool? isAfternoon = false;
  bool? isEvening = false;
  bool? isNight = false;
  bool? isBeforeFood = false;
  bool? isAfterFood = false;

  // List<String> dosageSplit;

  TextEditingController dosage = TextEditingController();
  TextEditingController scale = TextEditingController();
  TextEditingController note = TextEditingController();
  // PrescriptionModel prescriptionModel = PrescriptionModel();

  Future<void> initPage(DraftMedicinePlan data) async {
    medicinePlanModel.draftMedicinePlans = [];
    medicinePlanModel.draftMedicinePlans?.add(data);

    String? dosageString = medicinePlanModel.draftMedicinePlans?[0].dosage.toString();

    dosage.text = dosageString!;

    if(medicinePlanModel.draftMedicinePlans?[0].dosageTimes?.length != 0){
      isMorning = medicinePlanModel.draftMedicinePlans?[0].dosageTimes?.contains("เช้า");
      isAfternoon = medicinePlanModel.draftMedicinePlans?[0].dosageTimes?.contains("กลางวัน");
      isEvening = medicinePlanModel.draftMedicinePlans?[0].dosageTimes?.contains("เย็น");
      isNight = medicinePlanModel.draftMedicinePlans?[0].dosageTimes?.contains("ก่อนนอน");

    }
    if(medicinePlanModel.draftMedicinePlans?[0].dosageMeals?.length != 0){
      isBeforeFood = medicinePlanModel.draftMedicinePlans?[0].dosageMeals?.contains("หลังอาหาร");
      isAfterFood = medicinePlanModel.draftMedicinePlans?[0].dosageMeals?.contains("ก่อนอาหาร");
    }
    getDataController.sink.add(true);
  }

  void confirmPlan(BuildContext context) async {
    medicinePlanModel.draftMedicinePlans?[0].dosage = int.parse(dosage.text);
    medicinePlanModel.draftMedicinePlans?[0].remark = note.text;

    if (isMorning!) {
      medicinePlanModel.draftMedicinePlans?[0].dosageTimes?.add("เช้า");
    }
    if (isAfternoon!) {
      medicinePlanModel.draftMedicinePlans?[0].dosageTimes?.add("กลางวัน");
    }
    if (isEvening!) {
      medicinePlanModel.draftMedicinePlans?[0].dosageTimes?.add("เย็น");
    }
    if (isNight!) {
      medicinePlanModel.draftMedicinePlans?[0].dosageTimes?.add("ก่อนนอน");
    }
    if (isAfterFood!) {
      medicinePlanModel.draftMedicinePlans?[0].dosageMeals?.add("หลังอาหาร");
    }
    if (isBeforeFood!) {
      medicinePlanModel.draftMedicinePlans?[0].dosageMeals?.add("ก่อนอาหาร");
    }

    await medicinePlanService
        .editMedicinePlan(medicinePlanModel)
        .then((value) => {
              Navigator.pop(context, value.draftMedicinePlans?[0])
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MedicineOrder(
              //           data: settings.arguments as MedicinePlanModel,
              //         )));
            });
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
