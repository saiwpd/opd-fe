import 'package:appname/Models/Fee_List_Model/Fee_Model.dart';
import 'package:appname/Screen/fee_receipt/fee_receipt.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../routing_constants.dart';

class FeeInvoice extends StatefulWidget {
  FeeModel data;
  FeeInvoice({Key? key, required this.data}) : super(key: key);

  @override
  State<FeeInvoice> createState() => _FeeInvoiceState();
}

class _FeeInvoiceState extends State<FeeInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, notification, arguments: "1");
            },
          )
        ],
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: //Text('${listOfFees[index].invoice?.status == "PAID" ? "VIEW" : "PAY"}',
            Text(
          "ใบสรุปค่าบริการ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        Container(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
          decoration: BoxDecoration(
            color: const Color(0xffE8DEF8),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 180,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                            widget.data.status == "PAID"
                                ? 'เลขที่ใบเสร็จ'
                                : 'เลขที่ใบแจ้งหนี้',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(widget.data.refId!),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text('วันที่รับบริการ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(DateFormat('yyyy-MM-dd – kk:mm')
                            .format(widget.data.createdAt!)),
                      ),
                    ],
                  ),
                  widget.data.status == "PAID"
                      ? Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5, top: 20),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text('',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5, top: 20),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(''),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5, top: 20),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text('ธนาคาร',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 5, top: 20),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(widget.data.bank.toString()),
                            ),
                          ],
                        )
                      : Container()
                ],
              )
            ],
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
        //   decoration: BoxDecoration(
        //     color: const Color(0xffE8DEF8),
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   height: 150,
        //   width: MediaQuery.of(context).size.width * 1,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Container(
        //         padding: EdgeInsets.only(left: 20, top: 20),
        //         child: Text('ไปยัง',
        //             style: TextStyle(fontWeight: FontWeight.bold)),
        //       ),
        //       Container(
        //         padding: EdgeInsets.only(left: 20, top: 20),
        //         child: Text(widget.data),
        //       ),
        //       Container(
        //         padding: EdgeInsets.only(left: 20, top: 20),
        //         child: Text('ที่อยู่ xxxxx'),
        //       )
        //     ],
        //   ),
        // ),
        Container(
          height: 450,
          child: Container(
            margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
            decoration: BoxDecoration(
              color: const Color(0xffE8DEF8),
              borderRadius: BorderRadius.circular(12),
            ),            
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text('รายละเอียด',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Text('รายการ'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('จำนวน'),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text('คิดเป็นเงิน (บาท)'),
                        ),
                      ]),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Text('ค่าวินิจฉัยแพทย์'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('1'),
                        ),
                        Expanded(
                          flex: 4,
                          child:
                              Text(widget.data.summary!.serviceFee!.toString()),
                        ),
                      ]),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      // padding: const EdgeInsets.all(20.0),
                      itemCount: widget.data.summary!.medicineFee!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Text(widget.data.summary!
                                      .medicineFee![index].medicineName!),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(widget
                                      .data.summary!.medicineFee![index].amount
                                      .toString()),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(widget.data.summary!
                                      .medicineFee![index].price
                                      .toString()),
                                ),
                              ]),
                        );
                      }),
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text('รวมทั้งหมด'),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(widget.data.price.toString()),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),

        Container(
          height: 10,
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.75,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                primary:
                    widget.data.status == "PAID" ? Colors.grey : Colors.green,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {
              if (widget.data.status == "UNPAID") {
                Navigator.pushNamed(context, payment,
                    arguments: widget.data.refId.toString());
              } else {
                null;
              }
            },
            child: Text(
              widget.data.status == "PAID" ? 'ชำระเงินแล้ว'
                                : 'ชำระเงิน',),
          ),
        ),
      ]),
    );
  }
}
