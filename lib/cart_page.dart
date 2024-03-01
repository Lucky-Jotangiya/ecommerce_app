import 'dart:math';

import 'package:ecommerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'mydb.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool showProgress = true;

  @override
  void initState() {
    super.initState();
    viewData();
    stopProcess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Cart',
              style:
                  TextStyle(fontFamily: 'Font-1', fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Text(
                  '8 ',
                  style: TextStyle(
                      fontFamily: 'Font-1',
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text('Items  ',
                    style: TextStyle(fontFamily: 'Font-1', fontSize: 12)),
                Text('Deliver To: ',
                    style: TextStyle(fontFamily: 'Font-1', fontSize: 12)),
                Text(
                  'London',
                  style: TextStyle(
                      fontFamily: 'Font-1',
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      'Change',
                      style:
                          TextStyle(fontFamily: 'Font-1', color: Colors.black),
                    ),
                  ],
                )),
          ),
        ],
      ),
      body: showProgress
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Subtotal  ',
                                  style: TextStyle(
                                      fontFamily: 'Font-1', fontSize: 20),
                                ),
                                Text(
                                  '\$3,599',
                                  style: TextStyle(
                                      fontFamily: 'Font-2',
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  CupertinoIcons.checkmark_circle_fill,
                                  color: Colors.red,
                                  size: 28,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Your order is eligible for free Delivery',
                                  style: TextStyle(
                                      fontFamily: 'Font-1',
                                      fontSize: 15,
                                      color: Colors.pink.shade600),
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              cartData[index]['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 10,
                                          top: 10,
                                          child: Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.heart,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartData[index]['name'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                cartData[index]['price'],
                                                style: TextStyle(
                                                    fontFamily: 'Font-2',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '\$95',
                                                style: TextStyle(
                                                    fontFamily: 'Font-1',
                                                    fontSize: 13,
                                                    color: Colors.pink.shade400,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.lime,
                                                size: 15,
                                              ),
                                              Text(
                                                '(2k Reviews)',
                                                style: TextStyle(
                                                    fontFamily: 'Font-1',
                                                    fontSize: 10,
                                                    color:
                                                        Colors.pink.shade400),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Free Delivary',
                                            style: TextStyle(
                                                color: Colors.pink.shade700,
                                                fontFamily: 'Font-1'),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Center(
                                                  child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('1'),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Center(
                                                  child: Text(
                                                    '+',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    int id =
                                                        cartData[index]['id'];
                                                    Db()
                                                        .remove(
                                                            id, SplashScreen.db)
                                                        .then((value) {
                                                      viewData();
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Item Removed ! !');
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.delete_outline,
                                                        color: Colors
                                                            .pink.shade800,
                                                      ),
                                                      Text(
                                                        'Remove',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .pink.shade800),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                              itemCount: cartData.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 30, child: Divider());
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 60),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: Center(
                          child: Text(
                        'Proceed To Buy(${cartData.length} Items)',
                        style: TextStyle(fontFamily: 'Font-1'),
                      ))),
                )
              ],
            ),
    );
  }

  void viewData() {
    Db().viewCartData(SplashScreen.db).then((value) {
      setState(() {
        cartData = value;
      });
    });
  }

  List<Map> cartData = [];

  void stopProcess() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        setState(() {
          showProgress = false;
        });
      },
    );
  }
}
