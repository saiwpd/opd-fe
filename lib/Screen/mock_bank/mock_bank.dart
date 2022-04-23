import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Bloc/Payment_Bloc copy/payment_bloc.dart';
import '../../SharedWidget/app_loading.dart';

class MockBank extends StatefulWidget {
  String data;
  //Payment({Key? key}) : super(key: key);
  MockBank({Key? key, required this.data}) : super(key: key);

  @override
  State<MockBank> createState() => _MockBankState();
}

class _MockBankState extends State<MockBank> {
  PaymentBloc bloc = PaymentBloc();    

  void initState() {
    super.initState();
    bloc.initPage();
    bloc.paymentModel.refId = widget.data.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xff2b3a42),
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context, widget.data);
            }),
        centerTitle: true,
        title: Text(
          "ยืนยันการโอนเงิน",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        StreamBuilder(
            stream: bloc.getDataController.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                if (!snapshot.hasError) {
                  return SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        child: Image.asset(
                          'assets/images/MockBank.png',
                          fit: BoxFit.fitHeight,
                        ),
                        height: 500,
                      ),
                      Container(
                        child: Image.asset(
                          'assets/images/BG_White.png',
                          fit: BoxFit.fitWidth,
                        ),
                        width: 400,
                        height: 150,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            primary: Colors.white,
                            fixedSize: const Size(400, 70),
                            textStyle: const TextStyle(fontSize: 20)),
                        onPressed: () {
                          //Navigator.pushNamed(context, fee_list);
                          bloc.confirmPayment(context);
                        },
                        child: Image.asset(
                          'assets/images/Tool_Mock_Bank.png',
                          fit: BoxFit.fitHeight),
                      ),
                      // Container(
                      //   child: Image.asset(
                      //     'assets/images/Tool_Mock_Bank.png',
                      //     fit: BoxFit.fitHeight,
                      //   ),
                      //   height: 65,
                      // ),
                    ]),
                  );
                } else {
                  return AppLoaderIndicator();
                }
              } else {
                return AppLoaderIndicator();
              }
            }),
        
      ]),
    );
  }
}
