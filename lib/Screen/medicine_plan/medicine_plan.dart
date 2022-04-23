import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Bloc/Medicine_Plan_Bloc/medicine_plan_bloc.dart';
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';
import '../../SharedWidget/app_loading.dart';

class MedicinePlan extends StatefulWidget {
  DraftMedicinePlan data;
  MedicinePlan({Key? key, required this.data}) : super(key: key);

  @override
  State<MedicinePlan> createState() => _MedicinePlanState();
}

class _MedicinePlanState extends State<MedicinePlan> {
  MedicinePlanBloc bloc = MedicinePlanBloc();
  bool _isChecked = true;
  String _currText = '';
  List<String> dosageTimes = ["เช้า", "กลางวัน", "เย็น", "ก่อนนอน"];
  List<String> dosageMeals = ["ก่อนอาหาร", "หลังอาหาร"];
  late TextEditingController controller;

  void initState() {
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
    bloc.initPage(widget.data);
  }

  @override
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
                Navigator.pop(context, widget.data);
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, notification, arguments: "2");
              },
            )
          ],
          centerTitle: true,
          title: Text(
            "Paracetamol",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        body: StreamBuilder(
            stream: bloc.getDataController.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                if (!snapshot.hasError) {
                  return SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 0, top: 0),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('ชื่อยา : '),
                            TextField(
                              readOnly: true,
                              controller: new TextEditingController(
                                  text: widget.data.medicineName),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 0, top: 0),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('สรรพคุณ : '),
                            TextField(
                              readOnly: true,
                              controller: new TextEditingController(
                                  text: widget.data.properties),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                right: 5, left: 20, bottom: 0, top: 0),
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('ครั้งละ : '),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly],
                                  controller: bloc.dosage,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                right: 20, left: 5, bottom: 0, top: 0),
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.32,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('หน่วย : '),
                                TextField(
                                  readOnly: true,
                                  controller:
                                       new TextEditingController(text: 'เม็ด'),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 20, top: 0),
                        height: 250,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('ช่วง : '),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 75, 75, 75),
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Column(
                                  children: [
                                   CheckboxListTile(
                                            title: Text(dosageTimes[0]),
                                            value: bloc.isMorning,
                                            onChanged: (val) {
                                              setState(() {
                                                bloc.isMorning = val!;
                                           
                                              });
                                            },
                                          ),
                                          CheckboxListTile(
                                            title: Text(dosageTimes[1]),
                                            value: bloc.isAfternoon,
                                            onChanged: (val) {
                                              setState(() {
                                                bloc.isAfternoon = val!;
                                          
                                              });
                                            },
                                          ),
                                          CheckboxListTile(
                                            title: Text(dosageTimes[2]),
                                            value: bloc.isEvening,
                                            onChanged: (val) {
                                              setState(() {
                                                bloc.isEvening = val!;
                                              
                                              });
                                            },
                                          ),
                                          CheckboxListTile(
                                            title: Text(dosageTimes[3]),
                                            value: bloc.isNight,
                                            onChanged: (val) {
                                              setState(() {
                                                bloc.isNight = val!;
                                              });
                                            },
                                          )
                                  ]
                                ),
                              )
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 0, top: 0),
                        height: 150,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('มื้ออาหาร : '),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 75, 75, 75),
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: Column(
                                  children: [
                                     CheckboxListTile(
                                            title: Text(dosageMeals[0]),
                                            value: bloc.isBeforeFood,
                                            onChanged: (val) {
                                              setState(() {
                                                bloc.isBeforeFood = val!;
                                              });
                                            },
                                          ),
                                           CheckboxListTile(
                                            title: Text(dosageMeals[1]),
                                            value: bloc.isAfterFood,
                                            onChanged: (val) {
                                              setState(() {
                                                bloc.isAfterFood = val!;
                                              });
                                            },
                                          )
                                  ]
                                ),
                              )
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 0, top: 0),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('หมายเหตุ : '),
                            TextField(
                              controller: bloc.note,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 70,
                          child: Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    primary: Colors.green,
                                    fixedSize: const Size(100, 50),
                                    textStyle: const TextStyle(fontSize: 20)),
                                onPressed: () {
                                  bloc.confirmPlan(context);
                                  //loc.confirmOrder(context);
                                  //null;
                                },
                                child: const Text('ยืนยัน'),
                              ),
                            ],
                          ))),
                      Container(
                        height: 20,
                      )
                    ]),
                  );
                } else {
                  return AppLoaderIndicator();
                }
              } else {
                return AppLoaderIndicator();
              }
            }));
  }
}
