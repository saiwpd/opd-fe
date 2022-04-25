import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Bloc/Notification_Bloc/notification_bloc.dart';
import '../../SharedWidget/app_loading.dart';

class NotificationList extends StatefulWidget {
  String data;
  NotificationList({Key? key, required this.data}) : super(key: key);
  //NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  NotificationBloc bloc = NotificationBloc();

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
          "แจ้งเตือน",
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
                          itemCount: bloc.notiList.length,
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
                                height: 70,
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Image.asset('assets/images/notification-bell.png', fit: BoxFit.fitHeight,),
                                      height: 40,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Text(
                                          //     '${bloc.notiList[index].status == "PAID" ? bloc.notiList[index].refId : bloc.notiList[index].refId}'),
                                          Text(
                                              '${bloc.notiList[index].message.toString()}'),
                                          // Text(
                                          //     'ค่าบริการ ${bloc.notiList[index].price} บาท'),
                                        ],
                                      )),
                                  // Expanded(
                                  //   flex: 3,
                                  //   child: Container(
                                  //     height: 50,
                                  //     width: 100,
                                  //     child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceEvenly,
                                  //         children: <Widget>[
                                  //           Container(
                                  //             child: Container(
                                  //               height: 50,
                                  //               width: 100,
                                  //               child: ElevatedButton(
                                  //                 style: ElevatedButton.styleFrom(
                                  //                     shape:
                                  //                         RoundedRectangleBorder(
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         50)),
                                  //                     primary: 
                                  //                         bloc.notiList[index]
                                  //                                     .status ==
                                  //                                 "PAID"
                                  //                             ? Colors.green
                                  //                             : Colors.blue,
                                  //                     textStyle:
                                  //                         const TextStyle(
                                  //                             fontSize: 14)),
                                  //                 onPressed: () {
                                  //                   Navigator.pushNamed(
                                  //                       context, fee_invioce,
                                  //                       arguments: bloc
                                  //                           .notiList[index]);
                                  //                 },
                                  //                 child: Text(
                                  //                     '${bloc.notiList[index].status == "PAID" ? "VIEW" : "PAY"}'),
                                  //               ),
                                  //             ),
                                  //             //child: Text('${bloc.notiList[index].invoice?.status == "PAID" ? "ชำระเงินแล้ว" : "ชำระเงิน"}'),
                                  //           ),
                                  //           // Container(
                                  //           //   child: Text('icon'),
                                  //           // ),
                                  //         ]),
                                  //   ),
                                  // ),
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
