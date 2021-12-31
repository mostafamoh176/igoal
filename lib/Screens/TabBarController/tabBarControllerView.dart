import 'package:app_igoal/Screens/TabBarController/tabBarControllerViewModel.dart';
import 'package:app_igoal/helpers/constants.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TabarControllerView extends StatefulWidget {
  @override
  _TabarControllerViewState createState() => _TabarControllerViewState();
}

class _TabarControllerViewState extends State<TabarControllerView> {
  String _timezone = 'Unknown';

  Future<void> initPlatformState() async {
    String timezone;
    try {
      timezone = await FlutterNativeTimezone.getLocalTimezone();
    } on PlatformException {
      timezone = 'Failed to get the timezone.';
    }
    if (!mounted) return;
    setState(() {
      _timezone = timezone;
      TZ.kuwaitTimeZone = _timezone;
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarControllerViewModel>(
        init: TabBarControllerViewModel(),
        builder: (viewModel) {
          return Scaffold(

            body: Container(
              color: (ThemeService().theme.toString() == "ThemeMode.dark")
                  ? Colors.black
                  : Colors.white,
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.screens.length,
                onPageChanged: (index) {
                  viewModel.onPageChanged(index);
                },
                controller: viewModel.controller,
                itemBuilder: (BuildContext context, int index) {
                  return viewModel.getScreen(index);
                },
              ),
            ),
            bottomNavigationBar: bottomNavigationBar(viewModel),
          );
        });
  }

  Widget bottomNavigationBar(TabBarControllerViewModel viewModel) =>
      Container(
    color:   (ThemeService().theme.toString() == "ThemeMode.dark")
                    ? Colors.black
                    : Colors.white,


    child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          child: BottomNavigationBar(

              type: BottomNavigationBarType.fixed,
              // backgroundColor:Theme.of(context).primaryColor,
              // (ThemeService().theme.toString() == "ThemeMode.dark")
              //     ? Colors.black
              //     : Colors.white, //Theme.of(context).backgroundColor,

              currentIndex: viewModel.index,
              unselectedItemColor: Colors.blueGrey,
              selectedItemColor: Color(0xffD7191D),
              selectedIconTheme: IconThemeData(color: Colors.red),
              unselectedIconTheme: IconThemeData(color: Colors.white),
              onTap: (index) => viewModel.onPageChanged(index),
              items: [
                BottomNavigationBarItem(

                  icon: Container(
                    padding: const EdgeInsets.all(0.0),
                    child: SvgPicture.asset(
                      'assets/images/newspaper.svg',
                      color: viewModel.index == 0 ? Colors.red : ((ThemeService().theme.toString() ==
                          "ThemeMode.dark") ? Colors.white :Colors.black),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  label: 'الاخبار',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(0.0),
                    child: SvgPicture.asset(
                      'assets/images/football.svg',
                      color: viewModel.index == 1 ? Colors.red : ((ThemeService().theme.toString() ==
                          "ThemeMode.dark") ? Colors.white :Colors.black),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  label: 'المباريات',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(0.0),
                    child: SvgPicture.asset(
                      'assets/images/home (4).svg',
                      color: viewModel.index == 2 ? Colors.red : ((ThemeService().theme.toString() ==
                          "ThemeMode.dark") ? Colors.white :Colors.black),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(0.0),
                    child: SvgPicture.asset(
                      'assets/images/wall-clock.svg',
                      color: viewModel.index == 3 ? Colors.red : ((ThemeService().theme.toString() ==
                          "ThemeMode.dark") ? Colors.white :Colors.black),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  label: 'فريقي',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(0.0),
                    child: SvgPicture.asset(
                      'assets/images/trophy.svg',
                      color: viewModel.index == 4 ? Colors.red : ((ThemeService().theme.toString() ==
                          "ThemeMode.dark") ? Colors.white :Colors.black),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  label: 'الدوريات',
                ),
                // barItem(icon: 'assets/images/newspaper.svg', title: 'الاخبار'),
                // barItem(icon: 'assets/images/football.svg', title: 'المباريات'),
                // barItem(icon: 'assets/images/home (4).svg', title: 'الرئيسية'),
                // barItem(icon: 'assets/images/wall-clock.svg', title: 'فريقي'),
                // barItem(icon: 'assets/images/trophy.svg', title: 'الدوريات'),
              ]),
        ),
  );
  BottomNavigationBarItem barItem({String icon, String title}) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(0.0),
        child: SvgPicture.asset(
          icon,
          color: (ThemeService().theme.toString() == "ThemeMode.dark")
              ? Colors.white
              : Colors.black,
          height: 20,
          width: 20,
        ),
      ),
      label: title,
    );
  }
}
