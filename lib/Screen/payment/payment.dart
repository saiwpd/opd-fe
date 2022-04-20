import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Bloc/Payment_Bloc copy/payment_bloc.dart';
import '../../SharedWidget/app_loading.dart';

class Payment extends StatefulWidget {
  String data;
  //Payment({Key? key}) : super(key: key);
  Payment({Key? key, required this.data}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

enum BankSeletor { SiamCommercialBank, KasikornBank, KrungThaiBank, BangkokBank }

class bankHelper {
  static String getbankname(BankSeletor bankName) {
    switch (bankName) {
      case BankSeletor.SiamCommercialBank:
        return "ธนาคารไทยพาณิชย์";
      case BankSeletor.KasikornBank:
        return "ธนาคารกสิกรไทย";
      case BankSeletor.KrungThaiBank:
        return "ธนาคารกรุงไทย";
      case BankSeletor.BangkokBank:
        return "ธนาคารกรุงเทพ";
    }
  }
}

class _PaymentState extends State<Payment> {
  PaymentBloc bloc = PaymentBloc();
    BankSeletor? seletor = BankSeletor.SiamCommercialBank;
    String? _bank = bankHelper.getbankname(BankSeletor.KasikornBank);
    

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
        centerTitle: true,
        title: Text(
          "ชำระค่าบริการ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
                        height: 20,
                      ),
                      Column(
                        children: <Widget>[
                          RadioListTile<BankSeletor>(
                            title: const Text('ธนาคารไทยพาณิชย์'),
                            value: BankSeletor.SiamCommercialBank,
                            groupValue: seletor,
                            onChanged: (BankSeletor? value) {
                              setState(() {
                                seletor = BankSeletor.SiamCommercialBank;
                                bloc.paymentModel.bank = bankHelper.getbankname(value!);
                              });
                            },
                          ),
                          RadioListTile<BankSeletor>(
                            title: const Text('ธนาคารกสิกรไทย'),
                            value: BankSeletor.KasikornBank,
                            groupValue: seletor,
                            onChanged: (BankSeletor? value) {
                              setState(() {
                                seletor = BankSeletor.KasikornBank;
                                bloc.paymentModel.bank = bankHelper.getbankname(value!);
                              });
                            },
                          ),
                          RadioListTile<BankSeletor>(
                            title: const Text('ธนาคารกรุงไทย'),
                            value: BankSeletor.KrungThaiBank,
                            groupValue: seletor,
                            onChanged: (BankSeletor? value) {
                              setState(() {
                                seletor = BankSeletor.KrungThaiBank;
                                bloc.paymentModel.bank = bankHelper.getbankname(value!);
                              });
                            },
                          ),
                          RadioListTile<BankSeletor>(
                            title: const Text('ธนาคารกรุงเทพ'),
                            value: BankSeletor.BangkokBank,
                            groupValue: seletor,
                            onChanged: (BankSeletor? value) {
                              setState(() {
                                seletor = BankSeletor.BangkokBank;
                                bloc.paymentModel.bank = bankHelper.getbankname(value!);
                              });
                            },
                          ),
                        ],
                      ),
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
            }),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              primary: Colors.green,
              fixedSize: const Size(100, 50),
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {
            bloc.confirmPayment(context);
          },
          child: const Text('ยืนยัน'),
        ),
      ]),
    );
  }
}
