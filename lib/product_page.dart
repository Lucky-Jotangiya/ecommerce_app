import 'package:ecommerce/bottom_navigationbar.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/mydb.dart';
import 'package:ecommerce/product_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.yellow.shade300,
        leading: Icon(Icons.arrow_back_ios_new),
        title: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          height: 50,
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(CupertinoIcons.search),
              hintText: 'Search Products',
              border: InputBorder.none,
            ),
          ),
        ),
        actions: [
          Icon(Icons.menu),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20.0),
            child: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  padding: EdgeInsets.all(5),
                ),
                badgeContent: Center(
                    child: Text(
                  '${cartData.length}',
                  style: TextStyle(color: Colors.white),
                )),
                child: Icon(CupertinoIcons.cart)),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Crazy Deals',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Font-1',
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Budget Buys',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Font-1',
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Best Offer',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Font-1',
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'More',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Font-1',
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'images/img-10.jpg',
                  fit: BoxFit.cover,
                )),
            margin: EdgeInsets.symmetric(horizontal: 10),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                ProductList.productList[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 120,
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.only(top: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 160,
                              child: InkWell(
                                onTap: () async {
                                  await Future.delayed(
                                    Duration(milliseconds: 100),
                                    () {
                                      String name = ProductList
                                          .productList[index]['name'];
                                      String price = ProductList
                                          .productList[index]['price'];
                                      String image = ProductList
                                          .productList[index]['image'];

                                      Db().addToCart(
                                          name, price, image, SplashScreen.db);
                                    },
                                  );
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return BottomNav(2);
                                    },
                                  ));
                                  viewData();
                                  Fluttertoast.showToast(
                                      msg: 'Added In Cart !');
                                },
                                child: Container(
                                  height: 40,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                      child: Text(
                                    'Add To Cart',
                                    style: TextStyle(
                                        fontFamily: 'Font-1',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ProductList.productList[index]['name'],
                        style: TextStyle(fontFamily: 'Font-2', fontSize: 17),
                      ),
                      Row(
                        children: [
                          Text(
                            ProductList.productList[index]['price'],
                            style: TextStyle(
                                fontFamily: 'Font-2',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
                                decoration: TextDecoration.lineThrough),
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
                                color: Colors.pink.shade400),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: ProductList.productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 310,
              ),
            ),
          ),
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
}
