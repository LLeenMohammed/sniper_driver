import 'package:flutter/material.dart';
import 'package:sniperdriver/controller/getallRequest.dart';
import 'package:sniperdriver/controller/updatereuestStatus.dart';
import 'package:sniperdriver/model/requestmodel.dart';
import 'package:sniperdriver/widgets/color.dart';

class AcceptedRequest extends StatefulWidget {
  const AcceptedRequest({super.key});

  @override
  State<AcceptedRequest> createState() => _HomePageScreenState();
}

UpdateReuestStatusController _reuestStatusController =
    UpdateReuestStatusController();
GetAllRequestController _allRequestController = GetAllRequestController();
List<Request_model> myrequet = [];
bool isloading = false;

class _HomePageScreenState extends State<AcceptedRequest> {
  @override
  void initState() {
    _allRequestController.getallbydriver().then((value) {
      myrequet = value!;
      setState(() {
        isloading = true;
      });
    });
    super.initState();
  }

  // final NavigationBarWidget navigationBar = NavigationBarWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: darkPurple,
        title: Text(
          "تفاصيل الرحلات",
          style: TextStyle(color: white, fontSize: 26),
        ),
      ),
      body: Center(
          child: isloading
              ? Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: myrequet.length, // عدد الطلبات
                    itemBuilder: (context, index) {
                      print("sssss" + myrequet[index].status.toString());

                      return myrequet[index].status.toString() == "2"
                          ? Container(
                              margin: EdgeInsets.all(5),
                              color: darkPurple,
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "الرحلة",
                                      style:
                                          TextStyle(color: white, fontSize: 22),
                                    ),
                                    const Divider(
                                      color: white,
                                      thickness: 2,
                                      height: 10,
                                      indent: 10,
                                      endIndent: 20,
                                    ),
                                    Text(
                                      'من: ${myrequet[index].from}',
                                      style:
                                          TextStyle(color: white, fontSize: 20),
                                    ),
                                    Text(
                                      'إلى: ${myrequet[index].to}',
                                      style:
                                          TextStyle(color: white, fontSize: 20),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  'تاريخ الطلب: ${myrequet[index].date}',
                                  style: TextStyle(color: white, fontSize: 20),
                                ),
                                trailing: MaterialButton(
                                  color: grey,
                                  child: Text(
                                    "انتهت الرحلة", style: TextStyle(color: black, fontSize:18)
                                  ),
                                  onPressed: () {
                                    _reuestStatusController.updateRequestStatus(
                                        myrequet[index].id, "3", context);
                                  },
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.all(5),
                              color: darkPurple,
                              child: Column(
                                children: [
                                  const Text(
                                      "الرحلة",
                                      style:
                                          TextStyle(color: white, fontSize: 22),
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
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'من: ${myrequet[index].from}',
                                          style: TextStyle(
                                              color: white, fontSize: 20),
                                        ),
                                        Text(
                                          'إلى: ${myrequet[index].to}',
                                          style: TextStyle(
                                              color: white, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      'تاريخ الطلب: ${myrequet[index].date}',
                                      style: TextStyle(color: white, fontSize: 20),
                                    ),
                                    trailing: Text(
                                      filterrequest(myrequet[index].status),
                                      style: TextStyle(color: white, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                )
              : SizedBox()),
    );
  }
}

filterrequest(String s) {
  if (s == "1") {
    return "لم يتم الدفع بعد";
  } else {
    return "انتهت الرحلة";
  }
}
