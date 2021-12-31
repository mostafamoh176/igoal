import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  bool isTabSelected_1 = true;
  bool isTabSelected_2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Image.asset(
                  'assets/images/Ronaldo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(top: 16, left: 8, child: backBtn()),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 4, top: 16),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTabBarItem(
                  title: "اخبار",
                  titleSize: 24,
                  // image: 'assets/images/icon_calendar.png',
                  isSelected: isTabSelected_1,
                  onTap: () {
                    setState(() {
                      isTabSelected_1 = true;
                      isTabSelected_2 = false;
                    });
                  },
                ),
                SizedBox(
                  width: 50,
                ),
                CustomTabBarItem(
                  title: 'اخبار',
                  titleSize: 24,
                  isSelected: isTabSelected_2,
                  onTap: () {
                    setState(() {
                      isTabSelected_1 = false;
                      isTabSelected_2 = true;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xff22272C),
              width: MediaQuery.of(context).size.width,
              child: (isTabSelected_1 == true)
                  ? ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return newsItem(context);
                      })
                  : ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return newsItem(context);
                      }),
            ),
          )
        ],
      ),
    );
  }

  Widget newsItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        // color: Colors.grey,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Image.asset(
                    'assets/images/Ronaldo.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Text(
                        'ادخل تفاصيل الكتابة الخاصة بك ادخل تفاصيل الكتابة الخاصة بك',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.right,
                      )),
                ))
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  InkWell backBtn() {
    return InkWell(
        splashColor:Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor:Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
              height: 23.62,
              width: 13.5,
              child: Icon(
                Icons.navigate_before,
                color: Colors.white,
              )),
        ));
  }
}
