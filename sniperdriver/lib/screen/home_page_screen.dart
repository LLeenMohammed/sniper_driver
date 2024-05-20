import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sniperdriver/controller/getallRequest.dart';
import 'package:sniperdriver/controller/updatereuestStatus.dart';
import 'package:sniperdriver/model/requestChildModel.dart';
import 'package:sniperdriver/model/requestmodel.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/drivermap.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

UpdateReuestStatusController _reuestStatusController =
    UpdateReuestStatusController();
GetAllRequestController _allRequestController = GetAllRequestController();
List<Request_model> myrequet = [];
List<Request_model_Child> child = [];
bool isloading = false;
bool isloadingchild = false;

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    _allRequestController.getallQuestion().then((value) {
      myrequet = value!;
      setState(() {
        isloading = true;
      });
    });
    _allRequestController.getallRequestchild().then((value) {
      child = value!;
      setState(() {
        isloadingchild = true;
      });
    });
    super.initState();
  }

  // final NavigationBarWidget navigationBar = NavigationBarWidget();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                  height: height - 90,
                  child: MapScreen(lat: 21.5292, lng: 39.1611)),
              Positioned(
                bottom: 0,
                child: Container(
                  height: myrequet.isNotEmpty ? 540 : 270,
                  width: width,
                  child: Column(
                    children: [
                      child.isNotEmpty
                          ? Center(
                              child: isloading
                                  ? Container(
                                      height: 270,
                                      child: ListView.builder(
                                        itemCount: child.length, // عدد الطلبات
                                        itemBuilder: (context, index) {
                                          return child[index].status == "0"
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    color: darkPurple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20), // تعيين حواف دائية
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(0,
                                                            3), // تعيين ظل الـ container
                                                      ),
                                                    ],
                                                  ),
                                                  margin: EdgeInsets.all(5),
                                                  child: Column(
                                                    children: [
                                                      const Text(
                                                        "طلب رحلة جديد",
                                                        style: TextStyle(
                                                            color: white,
                                                            fontSize: 22),
                                                      ),
                                                      const Divider(
                                                        color: white,
                                                        thickness: 2,
                                                        height: 10,
                                                        indent: 10,
                                                        endIndent: 20,
                                                      ),
                                                      ListTile(
                                                        leading: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                                width: 130,
                                                                
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                      'تفاصيل الطفل: ${child[index].childname}',
                                                                      style: TextStyle(
                                                                          color:
                                                                              white,
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                    
                                                                    Text(
                                                                      'العدد: ${child[index].childnumber}',
                                                                      style: TextStyle(
                                                                          color:
                                                                              white,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                        title: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'من: ${child[index].from}',
                                                              style: TextStyle(
                                                                  color: white,fontSize: 19),
                                                            ),
                                                            Text(
                                                              'إلى: ${child[index].to}',
                                                              style: TextStyle(
                                                                  color: white,fontSize: 19),
                                                            ),
                                                          ],
                                                        ),
                                                        subtitle: Text(
                                                          'تاريخ الطلب: ${child[index].date}',
                                                          style: TextStyle(
                                                              color:
                                                                  white, fontSize: 19),
                                                        ),
                                                        trailing: Image.asset(
                                                            'assets/images/yellowCar.png'),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          MaterialButton(
                                                            color: darkPurple,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                color:
                                                                    grey, // لون الحواف الرمادي
                                                                width: 4.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15), //شكل الزر
                                                            ),
                                                            child: Text(
                                                              "موافق",
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 18),
                                                            ),
                                                            onPressed: () {
                                                              print(child[index].id.toString());
                                                              _reuestStatusController
                                                                  .updateRequestStatusChild(
                                                                      child[
                                                                              index]
                                                                          .id,
                                                                      "1",
                                                                      context);
                                                            },
                                                          ),
                                                          MaterialButton(
                                                            color: darkPurple,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                color:
                                                                    grey, // لون الحواف الرمادي
                                                                width: 4.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15), //شكل الزر
                                                            ),
                                                            child: Text(
                                                              "رؤية الموقع",
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 18),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                return MapScreen(
                                                                  lat: double.parse(
                                                                      child[index]
                                                                          .lat),
                                                                  lng: double.parse(
                                                                      child[index]
                                                                          .lng),
                                                                );
                                                                //     return const MainScreenState();
                                                              }));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : SizedBox();
                                        },
                                      ),
                                    )
                                  : CircularProgressIndicator(),
                            )
                          : SizedBox(),
                      myrequet.isNotEmpty
                          ? Center(
                              child: isloading
                                  ? Container(
                                      height: 270,
                                      child: ListView.builder(
                                        itemCount:
                                            myrequet.length, // عدد الطلبات
                                        itemBuilder: (context, index) {
                                          return myrequet[index].status == "-1"
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    color: darkPurple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20), // تعيين حواف دائية
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(0,
                                                            5), // تعيين ظل الـ container
                                                      ),
                                                    ],
                                                  ),
                                                  margin: EdgeInsets.all(5),
                                                  child: Column(
                                                    children: [
                                                      const Text(
                                                        "طلب رحلة جديد",
                                                        style: TextStyle(
                                                            color: white,
                                                            fontSize: 22),
                                                      ),
                                                      const Divider(
                                                        color: white,
                                                        thickness: 2,
                                                        height: 10,
                                                        indent: 10,
                                                        endIndent: 20,
                                                      ),
                                                      ListTile(
                                                        title: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'من: ${myrequet[index].from} ',
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 20),
                                                            ),
                                                            Text(
                                                              'إلى: ${myrequet[index].to}',
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 20),
                                                            ),
                                                            Text(
                                                              'تاريخ الطلب: ${myrequet[index].date}',
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 20),
                                                            ),
                                                          ],
                                                        ),
                                                        trailing: SizedBox(
                                                          width: 70,
                                                          height: 70,
                                                          child: Image.asset(
                                                              'assets/images/yellowCar.png'),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          MaterialButton(
                                                            color: darkPurple,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                color:
                                                                    grey, // لون الحواف الرمادي
                                                                width: 4.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15), //شكل الزر
                                                            ),
                                                            child: Text(
                                                              "موافق",
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 18),
                                                            ),
                                                            onPressed: () {
                                                              _reuestStatusController
                                                                  .updateRequestStatus(
                                                                      myrequet[
                                                                              index]
                                                                          .id,
                                                                      "1",
                                                                      context);
                                                            },
                                                          ),
                                                          MaterialButton(
                                                            color: darkPurple,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                color:
                                                                    grey, // لون الحواف الرمادي
                                                                width: 4.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15), //شكل الزر
                                                            ),
                                                            child: Text(
                                                              "رؤية الموقع",
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 18),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                return MapScreen(
                                                                  lat: double.parse(
                                                                      myrequet[
                                                                              index]
                                                                          .lat),
                                                                  lng: double.parse(
                                                                      myrequet[
                                                                              index]
                                                                          .lng),
                                                                );
                                                                //     return const MainScreenState();
                                                              }));
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : SizedBox();
                                        },
                                      ),
                                    )
                                  : CircularProgressIndicator(),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
