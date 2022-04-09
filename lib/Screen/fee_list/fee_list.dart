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
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: listOfFees.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 111, 54, 244), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 100,
                      child: Row(children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color.fromARGB(255, 111, 54, 244),
                                  width: 1),
                              //borderRadius: BorderRadius.all(Radius.circular(100.0)), color: Color(0xffE8DEF8),
                            ),
                            height: 40,
                          ),
                        ),
                        Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${listOfFees[index].invoice?.refId}'),
                                Text(
                                    '${listOfFees[index].invoice?.createdAt.toString()}'),
                                Text(
                                    'ค่าบริการ ${listOfFees[index].invoice?.amount} บาท'),
                              ],
                            )),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 111, 54, 244),
                                  width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xffE8DEF8),
                            ),
                            height: 50,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Text('ชำระเงืน'),
                                  ),
                                  Container(
                                    child: Text('icon'),
                                  ),
                                ]),
                          ),
                        )
                      ]));
                })),
        Container(
          height: 40,
        ),
        Container(
          height: 10,
        ),


        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: listOfFees.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 111, 54, 244), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 100,
                      child: Row(children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color.fromARGB(255, 111, 54, 244),
                                  width: 1),
                              //borderRadius: BorderRadius.all(Radius.circular(100.0)), color: Color(0xffE8DEF8),
                            ),
                            height: 40,
                          ),
                        ),
                        Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${listOfFees[index].reciept?.refId}'),
                                Text(
                                    '${listOfFees[index].reciept?.createdAt.toString()}'),
                                Text(
                                    'ค่าบริการ ${listOfFees[index].invoice?.amount} บาท'),
                              ],
                            )),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 111, 54, 244),
                                  width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xffE8DEF8),
                            ),
                            height: 50,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    child: Text('ชำระเงืน'),
                                  ),
                                  Container(
                                    child: Text('icon'),
                                  ),
                                ]),
                          ),
                        )
                      ]));
                })),
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
