import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sniperdriver/controller/getallRating.dart';
import 'package:sniperdriver/controller/logincontroller.dart';
import 'package:sniperdriver/model/RateModel.dart';
import 'package:sniperdriver/screen/log_in_screen.dart';
import 'package:sniperdriver/widgets/rate_page_widget.dart';
import 'package:sniperdriver/widgets/app_bar.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';
import 'package:sniperdriver/widgets/phone_design.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPageScreen extends StatefulWidget {
  const AccountPageScreen({super.key});

  @override
  State<AccountPageScreen> createState() => _AccountPageScreenState();
}

List<RateModel> myrating = [];
bool isloading = false;
GetAllRatringController _allRatringController = GetAllRatringController();
double average = 0.0;
int number = 0;
double total = 0.0;

class _AccountPageScreenState extends State<AccountPageScreen> {
  @override
  void initState() {
    number = 0;
    total = 0;
    _allRatringController.getallRateing().then((value) {
      myrating = value!;
      for (var i = 0; i < myrating.length; i++) {
        number = number + 1;
        total = total + double.parse(myrating[i].rate);
      }
      average = total / number;
      setState(() {
        isloading = true;
      });
    });
    super.initState();
  }

  PageDesign myPageDesign = PageDesign(
    header: "معلومات السائق",
  );

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LogInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBarDesign.buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              myPageDesign.buildHeader(160.0),
              myPageDesign.buildDivider(140.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myPageDesign.buildText(
                            text: "الاسم:", coloring: darkPurple),
                        Text("${myname}",
                            style: TextStyle(color: black, fontSize: 20)),
                        const Divider(
                          color: darkPurple,
                          thickness: 0.5,
                          height: 10,
                          indent: 1,
                          endIndent: 120,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myPageDesign.buildText(
                            text: "رقم الجوال:", coloring: darkPurple),
                        Text("${myphone}",
                            style: TextStyle(color: black, fontSize: 20)),
                        const Divider(
                          color: darkPurple,
                          thickness: 0.5,
                          height: 10,
                          indent: 1,
                          endIndent: 120,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myPageDesign.buildText(
                            text: "الرقم الوطني:", coloring: darkPurple),
                        Text("${N_id}",
                            style: TextStyle(color: black, fontSize: 20)),
                        const Divider(
                          color: darkPurple,
                          thickness: 0.5,
                          height: 10,
                          indent: 1,
                          endIndent: 120,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myPageDesign.buildText(
                          text: "معلومات السيارة:",
                          coloring: darkPurple,
                        ),
                        Text("{${cartype} - $color - $model - $mynumber}",
                            style: TextStyle(color: black, fontSize: 20)),
                        const Divider(
                          color: darkPurple,
                          thickness: 0.5,
                          height: 10,
                          indent: 1,
                          endIndent: 120,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    myPageDesign.buildText(
                      text: "رخصة قيادة:",
                      coloring: darkPurple,
                    ),
                    Image.network("$carlisence"),
                    const Divider(
                      color: darkPurple,
                      thickness: 0.5,
                      height: 10,
                      indent: 1,
                      endIndent: 120,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    myPageDesign.buildText(
                      text: "استمارة السيارة:",
                      coloring: darkPurple,
                    ),
                    Image.network("$Driverlisence"),
                    const Divider(
                      color: darkPurple,
                      thickness: 0.5,
                      height: 10,
                      indent: 1,
                      endIndent: 120,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    myPageDesign.buildText(
                      text: "معلومات تقرير نجم:", 
                      coloring: darkPurple,
                    ),
                    Image.network("$helth"),
                    const Divider(
                      color: darkPurple,
                      thickness: 0.5,
                      height: 10,
                      indent: 1,
                      endIndent: 120,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    myPageDesign.buildText(
                      text: "معلومات السجل الصحي:",
                      coloring: darkPurple,
                    ),
                    Image.network("$report"),
                    const Divider(
                      color: darkPurple,
                      thickness: 0.5,
                      height: 10,
                      indent: 1,
                      endIndent: 120,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myPageDesign.buildText(
                          text: "تقييم السائق:",
                          coloring: darkPurple,
                        ),
                        Text("${myname}",
                            style: TextStyle(color: black, fontSize: 20)),
                        const Divider(
                          color: darkPurple,
                          thickness: 0.5,
                          height: 10,
                          indent: 1,
                          endIndent: 120,
                        ),
                        const SizedBox(height: 8),
                        RatingBar.builder(
                          initialRating: average,
                          minRating: 1,
                          unratedColor: Colors.grey,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 35,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          onRatingUpdate: (double value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                       
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(fixedSize: const Size(350, 50),),
                          onPressed: _logout,
                          child: Text('تسجيل خروج',style: TextStyle(fontSize: 16),),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //    bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
