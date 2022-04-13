import 'package:appname/Models/Prescription_Model/Prescription_Model.dart';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Bloc/Medicine_Order_Bloc/medicine_order_bloc.dart';
import '../../Models/Medicine_List_Model/Medicine_Model.dart';
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';
import '../../Service/Medicine_List_Service/medicine_list_service.dart';
import '../../SharedWidget/app_loading.dart';

class MedicineOrder extends StatefulWidget {
  MedicinePlanModel data;
  MedicineOrder({Key? key, required this.data}) : super(key: key);

  @override
  State<MedicineOrder> createState() => _MedicineOrderState();
}

class _MedicineOrderState extends State<MedicineOrder> {
  MedicineOrderBloc bloc = MedicineOrderBloc();
  List<Medicine> listOfMedicine = [];

  @override
  void initState() {
    super.initState();
    bloc.initPage(widget.data);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          "รายการยาที่สั่ง",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        Container(
          height: 10,
        ),
        // Center(
        //     child: Container(
        //   alignment: Alignment.center,
        //   width: 350,
        //   height: 50,
        //   child: TextField(
        //     textAlignVertical: TextAlignVertical.bottom,
        //     textAlign: TextAlign.left,
        //     decoration: new InputDecoration(
        //       focusedBorder: const OutlineInputBorder(
        //           borderSide:
        //               const BorderSide(color: Colors.transparent, width: 0.0),
        //           borderRadius: BorderRadius.all(Radius.circular(50))),
        //       enabledBorder: const OutlineInputBorder(
        //           borderSide:
        //               const BorderSide(color: Colors.transparent, width: 0.0),
        //           borderRadius: BorderRadius.all(Radius.circular(50))),
        //       fillColor: Color(0xffE8DEF8),
        //       filled: true,
        //       suffixIcon: Icon(
        //         Icons.search,
        //         color: Color(0xFF65676B),
        //       ),
        //       hintText: 'ค้นหา...',
        //       hintStyle: TextStyle(
        //           fontWeight: FontWeight.w300,
        //           color: Color(0xFF65676B),
        //           fontSize: 16),
        //     ),
        //   ),
        // )),
        // Container(
        //   child: Column(children: <Widget>[
        //     SizedBox(height: 20.0),
        //     ExpansionTile(
        //       title: Text(
        //         "Title",
        //         style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        //       ),
        //       children: <Widget>[
        //         ListTile(
        //           title: Text('data'),
        //         )
        //       ],
        //     ),
        //   ]),
        // ),
        StreamBuilder(
            stream: bloc.getDataController.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                if (!snapshot.hasError) {
                  return Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(20.0),
                          itemCount: widget.data.draftMedicinePlans!.length,
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
                                height: 250,
                                child: Column(children: <Widget>[
                                  Container(height: 20),
                                  Row(
                                    children: <Widget>[
                                      Container(width: 20),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 111, 54, 244),
                                                width: 1),
                                            //borderRadius: BorderRadius.all(Radius.circular(100.0)), color: Color(0xffE8DEF8),
                                          ),
                                          height: 40,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                            '${widget.data.draftMedicinePlans![index].medicineName}'),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 111, 54, 244),
                                                width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            color: Color(0xff6750A4),
                                          ),
                                          height: 40,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: () {
                                                    print("-");
                                                    bloc.decreseMedicine(index);
                                                  },
                                                  child: SizedBox(
                                                    child: Container(
                                                      child: Text(
                                                        '-',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255, 111, 54, 244),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                  ),
                                                  // 60%
                                                  width: 20,
                                                  height: 30,

                                                  child: Text(
                                                      '${bloc.medicinePlanModel.draftMedicinePlans![index].amount}',
                                                      textAlign:
                                                          TextAlign.center),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    print("+");
                                                    bloc.increseMedicine(index);
                                                  },
                                                  child: SizedBox(
                                                    child: Container(
                                                      child: Text(
                                                        '+',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      Container(width: 20),
                                    ],
                                  ),
                                  Divider(
                                    indent: 20,
                                    endIndent: 20,
                                    color: Colors.black,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          child: Text(
                                            'สรรพคุณ : ${widget.data.draftMedicinePlans![index].properties}',
                                            textAlign: TextAlign.left,
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          child: Text(
                                            'จำนวน : ${widget.data.draftMedicinePlans![index].amount} หน่วย',
                                            textAlign: TextAlign.left,
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          child: Text(
                                            'ครั้งละ : ${widget.data.draftMedicinePlans![index].dosage} เม็ด ',
                                            textAlign: TextAlign.left,
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          child: Text(
                                            'ช่วง : ' +
                                                widget
                                                    .data
                                                    .draftMedicinePlans![index]
                                                    .dosageTimes
                                                    .toString(),
                                            textAlign: TextAlign.left,
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          child: Text(
                                            'มื้อ : ' +
                                                widget
                                                    .data
                                                    .draftMedicinePlans![index]
                                                    .dosageMeals
                                                    .toString(),
                                            textAlign: TextAlign.left,
                                          )),
                                      // Container(
                                      //     width: MediaQuery.of(context)
                                      //             .size
                                      //             .width *
                                      //         1,
                                      //     child: Text(
                                      //       'Date : Null',
                                      //       textAlign: TextAlign.left,
                                      //     )),
                                      Container(
                                        padding: EdgeInsets.only(right: 20),
                                        height: 50,
                                        alignment: Alignment.centerRight,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              primary: Color(0xffE8DEF8),
                                              textStyle: const TextStyle(
                                                  fontSize: 14)),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                        context, medicine_plan,
                                                        arguments: widget.data.draftMedicinePlans![index]);
                                          },
                                          child: const Text('Edit',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 111, 54, 244))),
                                        ),
                                      ),
                                    ],
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
            width: MediaQuery.of(context).size.width * 1,
            height: 50,
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Color(0xFFB65F5F),
                      fixedSize: const Size(100, 50),
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    //bloc.confirmOrder(context);
                    null;
                  },
                  child: const Text('ยกเลิก'),
                ),
                Container(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      primary: Colors.green,
                      fixedSize: const Size(100, 50),
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    bloc.confirmOrder(context);
                    //null;
                  },
                  child: const Text('ยืนยัน'),
                ),
              ],
            ))),
        Container(
          height: 10,
        ),
      ]),
    );
  }
}
