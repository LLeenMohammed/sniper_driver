import 'package:flutter/material.dart';
import 'package:sniperdriver/screen/AcceptedRequest.dart';
import 'package:sniperdriver/widgets/app_bar.dart';
import 'package:sniperdriver/widgets/color.dart';
import 'package:sniperdriver/widgets/page_design.dart';
import 'package:sniperdriver/widgets/phone_design.dart';

class EarningPageScreen extends StatefulWidget {
  const EarningPageScreen({super.key});

  @override
  State<EarningPageScreen> createState() => _EarningPageScreenState();
}

class _EarningPageScreenState extends State<EarningPageScreen> {
  PageDesign myPageDesign = PageDesign(
    header: "مكسب السائق",
  );
  int selectedIndex = 1;
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
              myPageDesign.buildHeader(190.0),
              myPageDesign.buildDivider(180.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ButtonDesign(
                        //   hintStyle: TextStyle(color: grey, fontSize: 18),
                        //   hintText: "أرباح الرحلات:",
                        //   keyboardType: TextInputType.name,
                        //   textAlign: TextAlign.right,
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        // ButtonDesign(
                        //   hintStyle: TextStyle(color: grey, fontSize: 18),
                        //   hintText: "عدد الرحلات:",
                        //   keyboardType: TextInputType.name,
                        //   textAlign: TextAlign.right,
                        // ),
                      ],
                    ),
             
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myPageDesign.buildElevatedButton(
                            buttonText: "تفاصيل الرحلات",
                            onPressed: () {
                              Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                                  return AcceptedRequest();
                         //     return const MainScreenState();
                            }));
                            },
                            icon: Icons.ads_click),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: NavigationBarWidget(),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedIndex,
      //   onTap: (index) {
      //     // Handle bottom navigation tap
      //     setState(() {
      //       selectedIndex = index;
      //       // Navigate to the selected screen
      //       if (index == 0) {
      //         // Navigate to 'الحساب'
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => AccountPageScreen()),
      //         );
      //       } else if (index == 2) {
      //         // Navigate to 'الرئيسية'
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => HomePageScreen()),
      //         );
      //       }
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "الحساب"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_balance_wallet),
      //       label: "الأرباح",
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
      //   ],
      // ),
    );
  }
}
  //    bottomNavigationBar: navigationBar.NavigationBarWidget(), // Use the alias here
      
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "الحساب"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_balance_wallet),
      //       label: "الأرباح",
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
      //   ],
      // ),
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[current],
//       bottomNavigationBar: buildBottomNavigationBar(),
//     );
//   }

//   BottomNavigationBar buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       selectedItemColor: darkPurple,
//       unselectedItemColor: grey,
//       currentIndex: current,
//       onTap: (value) {
//         setState(() {
//           current = value;
//         });
//       },
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: "الحساب"),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.account_balance_wallet),
//           label: "الأرباح",
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
//       ],
//     );
//   }
// }



