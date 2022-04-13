import 'package:appname/Models/Medicine_List_Model/Medicine_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Bloc/Medicine_List_Bloc/medicine_list_bloc.dart';
import '../../Service/Medicine_List_Service/medicine_list_service.dart';
import '../../SharedWidget/app_loading.dart';
import '../../routing_constants.dart';

class MedicineList extends StatefulWidget {
  MedicineList({Key? key}) : super(key: key);

  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  MedicineListBloc bloc = MedicineListBloc();

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
        title: Text(
          "รายการยาทั้งหมด",
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
        StreamBuilder(
            stream: bloc.getDataController.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                if (!snapshot.hasError) {
                  return Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(20.0),
                          itemCount: bloc.listOfMedicine.length,
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
                                        '${bloc.listOfMedicine[index].name}'),
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
                                                bloc.decreseMedicine(
                                                    bloc.listOfMedicine[index]);
                                              },
                                              child: SizedBox(
                                                child: Container(
                                                  child: Text(
                                                    '-',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white),
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                              ),
                                              // 60%
                                              width: 20,
                                              height: 30,
                                              child: Text(
                                                  bloc.medicineOrderModel
                                                          .draftMedicinePlans!
                                                          .where((x) =>
                                                              x.medicineName ==
                                                              bloc
                                                                  .listOfMedicine[
                                                                      index]
                                                                  .name)
                                                          .isNotEmpty
                                                      ? '${bloc.medicineOrderModel.draftMedicinePlans!.firstWhere((x) => x.medicineName == bloc.listOfMedicine[index].name).amount}'
                                                      : "0",
                                                  textAlign: TextAlign.center),

                                              // child: Text(
                                              //     bloc.medicineOrder
                                              //             .draftMedicinePlans!
                                              //             .where((x) =>
                                              //                 x.id ==
                                              //                 bloc
                                              //                     .listOfMedicine[
                                              //                         index]
                                              //                     .id)
                                              //             .isNotEmpty
                                              //         ? '${bloc.medicineOrder.draftMedicinePlans!.firstWhere((x) => x.id == bloc.listOfMedicine[index].id).amount}'
                                              //         : "0",
                                              //     textAlign: TextAlign.center),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                print("+");
                                                bloc.increseMedicine(
                                                    bloc.listOfMedicine[index]);
                                              },
                                              child: SizedBox(
                                                child: Container(
                                                  child: Text(
                                                    '+',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    width: 20,
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
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                primary: Colors.green,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {
              bloc.createOrder(context);
            },
            child: const Text('ดูรายการที่สั่ง'),
          ),
        ),
        Container(
          height: 10,
        ),
      ]),
    );
  }
}
