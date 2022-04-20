import 'package:appname/Bloc/Fee_List_Bloc/fee_list_bloc.dart';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Models/Fee_List_Model/Fee_Model.dart';
import '../../Service/Fee_List_Service/fee_list_service.dart';
import '../../SharedWidget/app_loading.dart';

class FeeList extends StatefulWidget {
  FeeList({Key? key}) : super(key: key);

  @override
  State<FeeList> createState() => _FeeListState();
}

class _FeeListState extends State<FeeList> {
  FeeListBloc bloc = FeeListBloc();

  @override
  void initState() {
    super.initState();
    bloc.initPage();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        title: Text(
          "รายการใบสรุปค่าบริการ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        StreamBuilder(
            stream: bloc.getDataController.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                if (!snapshot.hasError) {
                  return Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(20.0),
                          itemCount: bloc.feeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                margin: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 111, 54, 244),
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                height: 100,
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: (bloc.feeList[index].status == "PAID" ? Image.asset('assets/images/payment.png', fit: BoxFit.fitHeight,) : Image.asset('assets/images/invoice.png', fit: BoxFit.fitHeight,)),
                                      height: 50,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              '${bloc.feeList[index].status == "PAID" ? bloc.feeList[index].refId : bloc.feeList[index].refId}'),
                                          Text(
                                              '${bloc.feeList[index].createdAt.toString()}'),
                                          Text(
                                              'ค่าบริการ ${bloc.feeList[index].price} บาท'),
                                        ],
                                      )),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              child: Container(
                                                height: 50,
                                                width: 100,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50)),
                                                      primary: 
                                                          bloc.feeList[index]
                                                                      .status ==
                                                                  "PAID"
                                                              ? Colors.green
                                                              : Colors.blue,
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 14)),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, fee_invioce,
                                                        arguments: bloc
                                                            .feeList[index]);
                                                  },
                                                  child: Text(
                                                      '${bloc.feeList[index].status == "PAID" ? "VIEW" : "PAY"}'),
                                                ),
                                              ),
                                              //child: Text('${bloc.feeList[index].invoice?.status == "PAID" ? "ชำระเงินแล้ว" : "ชำระเงิน"}'),
                                            ),
                                            // Container(
                                            //   child: Text('icon'),
                                            // ),
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    width: 10,
                                  )
                                ]));
                          }));
                } else {
                  return AppLoaderIndicator();
                }
              } else {
                return AppLoaderIndicator();
              }
            }),
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
