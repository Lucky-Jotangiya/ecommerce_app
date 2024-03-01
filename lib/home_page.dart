import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          leading: Container(
            height: 5,
            width: 5,
            margin: const EdgeInsets.all(9),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                    image: AssetImage('images/appbaricon.jpg'))),
          ),
          title: const Text(
            "Hello' Roopa",
            style: TextStyle(
                fontFamily: 'Font-1',
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            badges.Badge(
              position: badges.BadgePosition.custom(end: 5),
              showBadge: true,
              ignorePointer: false,
              badgeStyle: const badges.BadgeStyle(padding: EdgeInsets.all(2)),
              badgeContent: const Text(
                '14',
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 270,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Make Your Fashion Look Mire Charming',
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Font-1'),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Price',
                                      style: TextStyle(fontFamily: 'Font-1'),
                                    ),
                                    Text(
                                      '\$168',
                                      style: TextStyle(
                                          fontFamily: 'Font-2', fontSize: 30),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: SizedBox(
                                height: 70,
                                child: Column(
                                  children: [
                                    const Text(
                                      'Select Size',
                                      style: TextStyle(fontFamily: 'Font-1'),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Transform(
                                      transform: Matrix4.identity()
                                        ..translate(20.0, 0.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child:
                                                const Center(child: Text('X')),
                                          ),
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child:
                                                const Center(child: Text('M')),
                                          ),
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child:
                                                const Center(child: Text('S')),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('View Details')),
                          )
                        ],
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(
                        50.0,
                      ),
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'images/appbaricon.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.yellow.shade300,
              height: 200,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Featured Categories',
                      style: TextStyle(fontFamily: 'Font-1', fontSize: 21),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 30.0, left: 20),
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/img-1.png',
                                  height: 100,
                                  width: 100,
                                ),
                                Container(
                                  height: 26,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white),
                                  child: const Center(
                                    child: Text(
                                      't-Shirt',
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: 'Font-1'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/img-2.webp',
                                  height: 100,
                                  width: 100,
                                ),
                                Container(
                                  height: 26,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white),
                                  child: const Center(
                                    child: Text(
                                      'Shirt',
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: 'Font-1'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/img-3.webp',
                                  height: 100,
                                  width: 100,
                                ),
                                Container(
                                  height: 26,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white),
                                  child: const Center(
                                    child: Text(
                                      'Jeans',
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: 'Font-1'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/img-4.webp',
                                  height: 100,
                                  width: 100,
                                ),
                                Container(
                                  height: 26,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white),
                                  child: const Center(
                                    child: Text(
                                      'Shorts',
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: 'Font-1'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Set Your Wardrobe With Our Amazing Selection!',
                      style: TextStyle(fontSize: 20, fontFamily: 'Font-1'),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                                image: AssetImage(
                                  'images/img-5.webp',
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {}, child: const Text('Child')),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                                image: AssetImage(
                                  'images/img-6.jpg',
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {}, child: const Text('Woman')),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                                image: AssetImage(
                                  'images/appbaricon.jpg',
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {}, child: const Text('Other')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
