import 'dart:async';
import '../../Models/Medicine_List_Model/Medicine_Model.dart';
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';
import '../../Service/Medicine_List_Service/medicine_list_service.dart';
import '../bloc.dart';

class MedicineListBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  MedicineListService medicineListservice = MedicineListService();
  List<Medicine> listOfMedicine = [];
  MedicineOrderModel medicinePlan = MedicineOrderModel();

  Future<void> initPage() async {
    medicinePlan.draftMedicinePlans = [];
    await medicineListservice.getMedicineList().then(
        (value) => {listOfMedicine = value, getDataController.sink.add(true)});
  }

  void increseMedicine(Medicine data) {
    if (medicinePlan.draftMedicinePlans!.isNotEmpty) {
      if (medicinePlan.draftMedicinePlans!
          .where((x) => x.id == data.id)
          .isNotEmpty) {
        medicinePlan.draftMedicinePlans!
            .firstWhere((x) => x.id == data.id)
            .amount = medicinePlan.draftMedicinePlans!
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
        medicinePlan.draftMedicinePlans!.add(mockData);
        getDataController.sink.add(true);
      }
    } else {
      DraftMedicinePlan mockData = DraftMedicinePlan(
          id: data.id,
          medicineName: data.name,
          weight: data.weight,
          amount: 1,
          properties: data.properties);
      medicinePlan.draftMedicinePlans!.add(mockData);
      getDataController.sink.add(true);
    }
  }

  void decreseMedicine(Medicine data) {
    if (medicinePlan.draftMedicinePlans!.isNotEmpty) {
      if (medicinePlan.draftMedicinePlans!
          .where((x) => x.id == data.id)
          .isNotEmpty) {
        medicinePlan.draftMedicinePlans!
            .firstWhere((x) => x.id == data.id)
            .amount = medicinePlan.draftMedicinePlans!
                .firstWhere((x) => x.id == data.id)
                .amount! -
            1;
        getDataController.sink.add(true);
      }
    }
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
