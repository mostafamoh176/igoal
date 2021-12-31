import 'package:app_igoal/Screens/CountriesNews/countriesNewsView.dart';
import 'package:app_igoal/Screens/Description/descriptionView.dart';
import 'package:app_igoal/Screens/NewsList/newListViewModel.dart';
import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/themeService.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/serivces/networks/Loader.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class NewsListView extends StatefulWidget {
  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView>
    with AutomaticKeepAliveClientMixin<NewsListView> {
  NewsListViewModel newsListViewModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsListViewModel>(
        init: NewsListViewModel(),
        builder: (viewModel) {
          return Stack(
            children: [
              if (viewModel.viewState == ViewState.Idle)
                Scaffold(
                  backgroundColor:
                      (ThemeService().theme.toString() == "ThemeMode.dark")
                          ? Colors.black
                          : Colors.white,
                  body: SafeArea(
                    bottom: false,
                    top: false,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        (viewModel.newsList.isNotEmpty)
                            ? Container(
                                height: 202,
                                child: CarouselSlider.builder(
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    height: 202,
                                    enlargeCenterPage: false,
                                    viewportFraction: 1.0,
                                    enableInfiniteScroll: true,
                                    autoPlayInterval: Duration(seconds: 5),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                  ),
                                  itemCount: viewModel.newsList.length,
                                  itemBuilder: (context, index, realIdx) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(() => DescriptionView(
                                              newsDetail:
                                                  viewModel.newsList[index],
                                            ));
                                      },
                                      child: newsListTopItem(
                                          context, viewModel, index),
                                    );
                                  },
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 60,
                          // height:MediaQuery.of(context).size.height*0.1,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: context.theme.backgroundColor,
                          ),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: CustomNewTabBarItem(
                                  title: 'اخباري',
                                  isSelected: viewModel.isTabSelected_1,
                                  titleSize: 18,
                                  onTap: () {
                                    viewModel.onTab1Selected();
                                  },
                                ),
                              ),
                              InkWell(
                                  splashColor:Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor:Colors.transparent,
                                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                                  onTap: () {
                                    _modalBottomSheet(context, viewModel);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 35,
                                    color: Colors.red,
                                  )),
                              Expanded(
                                child: CustomNewTabBarItem(
                                  title: 'اخبار',
                                  isSelected: viewModel.isTabSelected_2,
                                  titleSize: 18,
                                  onTap: () {
                                    viewModel.onTab2Selected();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: GestureDetector(
                          onHorizontalDragEnd: (DragEndDetails details) {
                            if (details.primaryVelocity > 0) {
                              if (viewModel.isTabSelected_2 == true) {
                                viewModel.onTab1Selected();
                              }
                            } else if (details.primaryVelocity < 0) {
                              if (viewModel.isTabSelected_1 == true) {
                                viewModel.onTab2Selected();
                              }
                            }
                          },
                          child: Container(
                            child: viewModel.isTabSelected_1 == true
                                ? (viewModel.favId.isNotEmpty)
                                    ? ListView.builder(
                                        padding: EdgeInsets.all(3),
                                        itemCount:
                                        viewModel.myNewsList.length,
                                            //  (viewModel.myNewsList.length>0 && viewModel.myNewsList.length>4 )? 10 : 0,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return videoItem(
                                              context, viewModel, index);
                                        },
                                      )
                                    : Container(
                                        color:
                                            (ThemeService().theme.toString() ==
                                                    "ThemeMode.dark")
                                                ? Colors.black
                                                : Colors.white,
                                      )
                                : ListView.builder(
                                    padding: EdgeInsets.all(3),
                                    itemCount: 
                                    viewModel.newsList.length,
                                    //  (viewModel.newsList.length>0 && viewModel.newsList.length>4 )? 10 : 0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return videoItemSecond(
                                          context, viewModel, index);
                                    },
                                  ),
                          ),
                        ))
                      ],
                    ),
                  ),
                )
              else
                (viewModel.viewState == ViewState.Busy
                    ? Positioned.fill(child: Loading())
                    : Container()),
            ],
          );
        });
  }

  Widget newsListTopItem(
      BuildContext context, NewsListViewModel viewModel, int index) {
    return Container(
      height: 202,

      ///MediaQuery.of(context).devicePixelRatio,
      //height: MediaQuery.of(context).size.height*0.27,
      width: MediaQuery.of(context).size.width,
      //color: Colors.white,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xff000000).withOpacity(0),
                  Color(0xff000000).withOpacity(1)
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.darken,
            child: Container(
                height: 202,
                //height: MediaQuery.of(context).size.height*0.27,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  viewModel.newsList[index]['nesimgurl'],
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
              bottom: 16,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Directionality(
                    textDirection: ui.TextDirection.rtl,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 5,
                            decoration: BoxDecoration(
                                color: Color(0xffD7191D),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          viewModel.newsList[index]['newstitle'],
                          maxLines: 1,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        )),
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }

  Widget videoItem(
      BuildContext context, NewsListViewModel viewModel, int index) {
    return InkWell(
      onTap: () {
        Get.to(() => DescriptionView(
              newsDetail: viewModel.myNewsList[index],
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 4, top: 4, right: 8),
        child: Container(
          // height: MediaQuery.of(context).size.height*0.15,
          height: 95,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: context.theme.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          padding: EdgeInsets.only(right: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: Text(
                    viewModel.myNewsList[index]['newstitle'],
                    maxLines: 5,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  height: 95,
                  width: 95,
                  //color: Colors.purple,
                  decoration: BoxDecoration(
                    //  color: Color(0xff1F1F1F),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Image.network(
                    viewModel.myNewsList[index]['nesimgurl'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget videoItemSecond(
      BuildContext context, NewsListViewModel viewModel, int index) {
    return InkWell(
      onTap: () {
        Get.to(() => DescriptionView(
              newsDetail: viewModel.newsList[index],
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 4, top: 4, right: 8),
        child: Container(
          // height: MediaQuery.of(context).size.height*0.15,
          height: 95,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: context.theme.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          padding: EdgeInsets.only(right: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: Text(
                    viewModel.newsList[index]['newstitle'],
                    maxLines: 5,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  height: 95,
                  width: 95,
                  //color: Colors.purple,
                  decoration: BoxDecoration(
                    //  color: Color(0xff1F1F1F),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: Image.network(
                    viewModel.newsList[index]['nesimgurl'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _modalBottomSheet(context, NewsListViewModel viewModel) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext bc) {
          return FractionallySizedBox(
            heightFactor: 0.8,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1F1F1F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: CountriesNewsView(
                istrue: false,
              ),
            ),
          );
        }).whenComplete(() {
      print("Here");
      viewModel.getNewsList();
      viewModel.getFavouriteNewsId();
      if (viewModel.favId.isNotEmpty) viewModel.getFavouriteNewsList();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
