import 'package:flutter/material.dart';
import 'package:sniperdriver/screen/account_page_screen.dart';
import 'package:sniperdriver/screen/earning_page_screen.dart';
import 'package:sniperdriver/screen/home_page_screen.dart';
import 'package:sniperdriver/widgets/color.dart';

class MainScreenState extends StatefulWidget {
  const MainScreenState({super.key});

  @override
  State<MainScreenState> createState() => _MainScreenStateState();
}

class _MainScreenStateState extends State<MainScreenState>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
         controller: tabController,
        children: const [
          HomePageScreen(),
           EarningPageScreen(),
            AccountPageScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const   [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,size: 35,),
          label: "الرئيسية",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined,size: 35,),
          label: "الأرباح",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,size: 35,),
          label: "الحساب",
        ),
      ],
      unselectedItemColor: grey,
      selectedItemColor: darkPurple,
      backgroundColor: backgroundColor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontSize: 21),
      unselectedFontSize: 20 ,
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap: onItemClicked,
      ),
    );
  }
}
