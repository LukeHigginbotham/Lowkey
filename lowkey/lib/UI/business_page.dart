import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../UI/components/businesses.dart';
import 'create_new.dart';
import '../UI/components/business_comps.dart';
import '../UI/components/bottom_navbar.dart';
import '../UI/components/sidebar.dart';
import 'components/global.dart';

class BusinessPage extends StatefulWidget {
  final bool? showBackButton;
  final bool? isOwner;
  const BusinessPage({Key? key, this.showBackButton, this.isOwner}) : super(key: key);
  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  void onPressed() {
    setState(() {
      deleteCards = !deleteCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldState,
      drawer: const Sidebar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top:20),
            child: ListView(
              children: <Widget>[
                header(context),
                SizedBox(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      pageDetails(0),
                      pageDetails(1),
                      pageDetails(2),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: 70,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.black),
                        child: const Center(
                            child: Text('Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))))])),
                const Divider(thickness: 2, height: 30),
                const DealsComponent()])),
          BottomNavbar(
            iconRight: Icons.add,
            backgroundColor: Colors.white,
            onMenuPressed: () => _scaffoldState.currentState?.openDrawer(),
            onIconRightPressed: () => {Navigator.push( context, 
      MaterialPageRoute(builder: (context) => const CreateNew()))},
          )
        ]
      )
    );
  }
}

 List<Business> businesses = <Business>[
    Business('Starbucks', 'Doja Cat will be performing live on Saturday', 'lib/assets/highland.png'),
    Business('Reginelli’s Pizzeria', 'Buy two, get a third one free every weekend', 'lib/assets/reg.jpeg'),
  ];

pageDetails(index) {
  List categories = ['Address', 'Menu', 'Reviews'];
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: <Widget>[
        Text(categories[index], style: const TextStyle(color: Color(0xff303030)),),
        const SizedBox(width: 3),
        businessDetails(index)
      ]
    ),
  );
}

businessDetails(index) {
  switch (index) {
    case 0: return const Icon(Icons.map);
    case 1: return const Icon(Icons.menu_book);
  }
  return const Text('2k', style: TextStyle(fontWeight: FontWeight.bold),);
}

header(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 60,
              child: Image(
                image: AssetImage(businesses[0].getLogo()))),
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    businesses[0].getName(),
                    style: const TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold)),
                  const Text(
                    '40.1K Followers',
                    style: TextStyle(
                      fontSize: 13, 
                      color: Color(0xff303030)))
                ]
              )
            )
          ]
        ),
        const Icon(Icons.notifications_active, size: 30)
      ]
    )
  );
}