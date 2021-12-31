import 'package:app_igoal/Screens/Description/descriptionViewModel.dart';
import 'package:app_igoal/Screens/HomeScreen/homeScreenView.dart';
import 'package:app_igoal/Widgets/topLogoWidget.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class DescriptionView extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();
  dynamic newsDetail;
  DescriptionView({this.newsDetail});

  @override
  _DescriptionViewState createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
              useShouldOverrideUrlLoading: true, javaScriptEnabled: true)));
  DescriptionView viewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // expandedHeight: 230,
            backgroundColor:(ThemeService().theme.toString() == "ThemeMode.dark")
                ? Colors.black
                : Colors.white, //Theme.of(context).secondaryHeaderColor,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.navigate_before),
              color: Theme.of(context).buttonColor,
            ),
            floating: false,
            title: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.width*0.50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Color(4288880644), BlendMode.modulate),
                        image: AssetImage(
                          'assets/images/app_logo.png',
                        ),
                      )),
                ),
              ),
            ),
            pinned: true,
            // flexibleSpace: FlexibleSpaceBar(
            //   background: TopLogoItem(),
            // ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(_buildList()),
          ),
        ],
      ),
    );
  }

  List _buildList() {
    List<Widget> listItems = [];

    listItems.add(
      GetBuilder<DescriptionViewModel>(
          init: DescriptionViewModel(newsDetail: widget.newsDetail),
          builder: (viewModel) {
            return Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  color: Colors.transparent,
                  child: Expanded(
                    child: Text(
                      viewModel.newsDetail['newstitle'],
                      style: Theme.of(context).primaryTextTheme.headline6,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  child: Image.network(
                    viewModel.newsDetail['nesimgurl'],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      viewModel.newsDetail['newslongdesc'],
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.headline1,
                      textAlign: TextAlign.right,
                    )),
                InkWell(
                  splashColor:Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor:Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    widget.browser.openUrlRequest(
                        urlRequest: URLRequest(
                            url: Uri.parse(viewModel.newsDetail['newslink'])),
                        options: options);
                  },
                  child: Icon(
                    Icons.expand_more,
                    size: 35,
                    color: Color(0xffD7191D),
                  ),
                ),
              ],
            );
          }),
    );

    return listItems;
  }
}

class NewLogWidget extends StatelessWidget {
  const NewLogWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 30, 15),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.50,
            decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Color(4288880644), BlendMode.modulate),
              image: AssetImage(
                'assets/images/app_logo.png',
              ),
            )),
          ),
        ),
      ),
    );
  }
}
