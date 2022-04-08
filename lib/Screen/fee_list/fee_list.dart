import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Models/Fee_List_Model/Fee_Model.dart';
import '../../Service/Fee_List_Service/fee_list_service.dart';

class FeeList extends StatefulWidget {
  FeeList({Key? key}) : super(key: key);

  @override
  State<FeeList> createState() => _FeeListState();
}

class _FeeListState extends State<FeeList> {
  FeeListService service = FeeListService();
  List<Fee> listOfFees = [];

  @override
  void initState() {
    super.initState();
    getListMedicine();
  }

  void getListMedicine() async {
    listOfFees = await service.getFeeList();
    print(listOfFees.length);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "รายการใบสรุปค่าบริการ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        Container(
          height: 30,
        ),
        Container(
          height: 40,
        ),
        Container(
          height: 10,
        ),
      ]),
    );
  }
}
