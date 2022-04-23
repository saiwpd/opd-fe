import 'dart:async';
import '../../Models/Fee_List_Model/Fee_Model.dart';
import '../../Models/Medicine_List_Model/Medicine_Model.dart';
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';
import '../../Service/Fee_List_Service/fee_list_service.dart';
import '../../Service/Medicine_List_Service/medicine_list_service.dart';
import '../bloc.dart';

class FeeListBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  FeeListService feeListService = FeeListService();
  List<FeeModel> feeList = [];

  Future<void> initPage() async {
    await feeListService.getFeeList().then((value) => {feeList = value});
    feeList.forEach((x) {
      x.createdAt = x.createdAt?.add(const Duration(hours: 7));
      getDataController.sink.add(true);
    });
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
