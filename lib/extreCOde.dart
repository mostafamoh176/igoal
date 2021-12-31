/*SafeArea(
            bottom: false,
            top: false,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme
                    .of(context)
                    .secondaryHeaderColor,
                elevation: 0.0,
                iconTheme: IconThemeData(color: Colors.black),
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.navigate_before),
                  color: Theme
                      .of(context)
                      .buttonColor,
                ),
              ),
              body: Stack(
                children: [
                  if (viewModel.viewState == ViewState.Idle)
                    Column(
                      children: [
                        Container(
                          height: 240.toDouble(),
                          child: Column(
                            children: [
                              (viewModel.leagueData != null)
                                  ? leagueTopItem(context, viewModel)
                                  : Container()
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            height: 65,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: Colors.grey
                              color: Theme
                                  .of(context)
                                  .secondaryHeaderColor,
                            ),
                            padding:
                            EdgeInsets.only(top: 16, left: 20, right: 20),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetwee,
                              controller: _controller,
                              children: [
                                //(viewModel.leagueData['country']['data']['id'].toString()=="35376")?Container():
                                CustomTabBarItem(
                                  title: 'الفرق',
                                  isSelected: viewModel.isTabSelected_1,
                                  titleSize: 18,
                                  onTap: () {
                                    viewModel.onTab1Changed();
                                  },
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                CustomTabBarItem(
                                  title: 'قصا',
                                  titleSize: 16,
                                  isSelected: viewModel.isTabSelected_7,
                                  onTap: () {
                                    viewModel.onTab7Changed();
                                  },
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                CustomTabBarItem(
                                  title: 'الترتيب',
                                  isSelected: viewModel.isTabSelected_2,
                                  titleSize: 18,
                                  onTap: () {
                                    viewModel.onTab2Changed();
                                  },
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                CustomTabBarItem(
                                  title: 'الاخبار',
                                  titleSize: 18,
                                  isSelected: viewModel.isTabSelected_3,
                                  onTap: () {
                                    viewModel.onTab3Changed();
                                  },
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                CustomTabBarItem(
                                  title: 'الملاعب',
                                  titleSize: 18,
                                  isSelected: viewModel.isTabSelected_4,
                                  onTap: () {
                                    viewModel.onTab4Changed();
                                  },
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                CustomTabBarItem(
                                  title: 'الهدافين',
                                  titleSize: 18,
                                  isSelected: viewModel.isTabSelected_5,
                                  onTap: () {
                                    viewModel.onTab5Changed();
                                  },
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                CustomTabBarItem(
                                  title: 'المباريات',
                                  titleSize: 18,
                                  isSelected: viewModel.isTabSelected_6,
                                  onTap: () {
                                    viewModel.onTab6Changed();
                                  },
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onHorizontalDragEnd: (DragEndDetails details) {
                                  if (details.primaryVelocity > 0) {
                                    // User swiped Left
                                    print("left");
                                    if (viewModel.isTabSelected_1) {} else
                                    if (viewModel.isTabSelected_2) {
                                      viewModel.onTab1Changed();
                                    } else if (viewModel.isTabSelected_3) {
                                      viewModel.onTab2Changed();
                                    } else if (viewModel.isTabSelected_4) {
                                      viewModel.onTab3Changed();
                                    } else if (viewModel.isTabSelected_5) {
                                      _controller.jumpTo(
                                          _controller.position.minScrollExtent);
                                      viewModel.onTab4Changed();
                                    } else {
                                      viewModel.onTab5Changed();
                                    }
                                  } else if (details.primaryVelocity < 0) {
                                    // User swiped Right
                                    print("right");
                                    if (viewModel.isTabSelected_1) {
                                      viewModel.onTab2Changed();
                                    } else if (viewModel.isTabSelected_2) {
                                      viewModel.onTab3Changed();
                                    } else if (viewModel.isTabSelected_3) {
                                      _controller.jumpTo(
                                          _controller.position.maxScrollExtent);
                                      viewModel.onTab4Changed();
                                    } else if (viewModel.isTabSelected_4) {
                                      viewModel.onTab5Changed();
                                    } else if (viewModel.isTabSelected_5) {
                                      viewModel.onTab6Changed();
                                    }
                                  }
                                },
                                child:
                                Container(
                                  child: SingleChildScrollView(
                                    child: (viewModel.isTabSelected_1 ==
                                        true) &&
                                        (viewModel.seasonCountry) != null
                                        ? Column(children: List.generate(
                                        viewModel.seasonCountry.length, (
                                        index) =>
                                        theDifferenceItem(
                                            context, viewModel, index)),)
                                        : (viewModel.isTabSelected_2 == true) &&
                                        (viewModel.standings) != null
                                        ? viewModel.isLoading ? Padding(
                                      padding: const EdgeInsets.only(top: 50.0),
                                      child: CustomLoader(),
                                    ) : arrangementsMainItem(
                                        context, viewModel) : (viewModel
                                        .isTabSelected_3 == true) &&
                                        (viewModel.newsList != null)
                                        ? Column(
                                      children: List.generate(
                                          viewModel.newsList.length, (index) =>
                                          newsItem(
                                              context, viewModel, index)),
                                    )
                                        :
                                        (viewModel.isTabSelected_4 == true) && (viewModel.venue != null)
                                        ? Column(children: List.generate(
                                        viewModel.venue.length, (index) =>
                                        stadiumWidget(
                                            context, viewModel, index)),)
                                        : (viewModel
                                        .isTabSelected_5 == true) &&
                                        (viewModel.topGoals != null)
                                        ? Column(
                                      children: [
                                        (viewModel.topGoals != null &&
                                            viewModel.topGoals.isNotEmpty)
                                            ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: Container(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                                color: Theme
                                                    .of(context)
                                                    .secondaryHeaderColor
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 16,),
                                                Text("الهدافين", style: Theme
                                                    .of(context)
                                                    .primaryTextTheme
                                                    .headline6,),
                                                SizedBox(height: 8,),
                                                Column(children: List.generate(
                                                    viewModel
                                                        .topGoals.length > 3
                                                        ? 3
                                                        : viewModel
                                                        .topGoals.length, (
                                                    index) =>
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            height: 80,
                                                            child: Row(
                                                              children: [
                                                                Text(viewModel
                                                                    .topGoals[index]['goals']
                                                                    .toString(),
                                                                  style: Theme
                                                                      .of(
                                                                      context)
                                                                      .primaryTextTheme
                                                                      .headline1,),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height: 100,
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  height: 50,
                                                                  width: 50,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Colors
                                                                          .white
                                                                  ),
                                                                  child: (viewModel
                                                                      .topGoals[index]['player']['data']['image_path'] !=
                                                                      null)
                                                                      ? Image
                                                                      .network(
                                                                      viewModel
                                                                          .topGoals[index]['player']['data']['image_path'])
                                                                      : Container(),
                                                                ),
                                                                SizedBox(
                                                                  height: 8,),
                                                                Text(viewModel
                                                                    .leagueName[viewModel
                                                                    .topGoals[index]['player']['data']['display_name']] !=
                                                                    null
                                                                    ? viewModel
                                                                    .leagueName[viewModel
                                                                    .topGoals[index]['player']['data']['display_name']]
                                                                    : viewModel
                                                                    .topGoals[index]['player']['data']['display_name'],
                                                                  style: Theme
                                                                      .of(
                                                                      context)
                                                                      .primaryTextTheme
                                                                      .headline1,),

                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 80,
                                                            width: 110,
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                    child: Text(
                                                                      viewModel
                                                                          .leagueName[viewModel
                                                                          .topGoals[index]['team']['data']['name']] !=
                                                                          null
                                                                          ? viewModel
                                                                          .leagueName[viewModel
                                                                          .topGoals[index]['team']['data']['name']]
                                                                          : viewModel
                                                                          .topGoals[index]['team']['data']['name'],
                                                                      style: Theme
                                                                          .of(
                                                                          context)
                                                                          .primaryTextTheme
                                                                          .headline1,)),
                                                                SizedBox(
                                                                  width: 8,),
                                                                Container(
                                                                  height: 25,
                                                                  width: 25,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Colors
                                                                          .white
                                                                  ),
                                                                  child: (viewModel
                                                                      .topGoals[index]['team']['data']['logo_path'] !=
                                                                      null)
                                                                      ? Image
                                                                      .network(
                                                                      viewModel
                                                                          .topGoals[index]['team']['data']['logo_path'])
                                                                      : Container(),
                                                                ),
                                                              ],

                                                            )
                                                        ),
                                                      ],
                                                    )),),
                                                SizedBox(height: 8,),
                                                Text(' مشاهدة الجميع',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.red),),
                                                SizedBox(height: 8,),
                                              ],

                                            ),
                                          ),
                                        )
                                            : Container(),
                                        (viewModel.topAssists != null &&
                                            viewModel.topAssists.length > 0)
                                            ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: Container(
                                            height: (290 + (50 * 3))
                                                .toDouble(),
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                                color: Theme
                                                    .of(context)
                                                    .secondaryHeaderColor
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 16,),
                                                Text(" مشاهدة الجميع",
                                                  style: Theme
                                                      .of(context)
                                                      .primaryTextTheme
                                                      .headline6,),
                                                SizedBox(height: 8,),
                                                Column(children: List.generate(
                                                    viewModel.topAssists
                                                        .length > 3
                                                        ? 3
                                                        : viewModel.topAssists
                                                        .length, (index) =>
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              height: 80,
                                                              child: Row(
                                                                children: [
                                                                  Text(viewModel
                                                                      .topAssists[index]['assists']
                                                                      .toString() !=
                                                                      null
                                                                      ? viewModel
                                                                      .topAssists[index]['assists']
                                                                      .toString()
                                                                      : "",
                                                                    style: Theme
                                                                        .of(
                                                                        context)
                                                                        .primaryTextTheme
                                                                        .headline1,),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              height: 90,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Colors
                                                                            .white
                                                                    ),
                                                                    child: (viewModel
                                                                        .topAssists[index]['player']['data']['image_path'] !=
                                                                        null)
                                                                        ? Image
                                                                        .network(
                                                                        viewModel
                                                                            .topGoals[index]['player']['data']['image_path'])
                                                                        : Container(),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,),
                                                                  Text(viewModel
                                                                      .leagueName[viewModel
                                                                      .topAssists[index]['player']['data']['display_name']] !=
                                                                      null
                                                                      ? viewModel
                                                                      .leagueName[viewModel
                                                                      .topAssists[index]['player']['data']['display_name']]
                                                                      : viewModel
                                                                      .topAssists[index]['player']['data']['display_name'],
                                                                    style: Theme
                                                                        .of(
                                                                        context)
                                                                        .primaryTextTheme
                                                                        .headline1,),

                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                              height: 90,
                                                              width: 110,
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                      child: Text(
                                                                        viewModel
                                                                            .leagueName[viewModel
                                                                            .topAssists[index]['team']['data']['name']] !=
                                                                            null
                                                                            ? viewModel
                                                                            .leagueName[viewModel
                                                                            .topAssists[index]['team']['data']['name']]
                                                                            : viewModel
                                                                            .topAssists[index]['team']['data']['name'],
                                                                        style: Theme
                                                                            .of(
                                                                            context)
                                                                            .primaryTextTheme
                                                                            .headline1,)),
                                                                  SizedBox(
                                                                    width: 8,),
                                                                  Container(
                                                                    height: 25,
                                                                    width: 25,
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Colors
                                                                            .white
                                                                    ),
                                                                    child: (viewModel
                                                                        .topAssists[index]['team']['data']['logo_path'] !=
                                                                        null)
                                                                        ? Image
                                                                        .network(
                                                                        viewModel
                                                                            .topAssists[index]['team']['data']['logo_path'])
                                                                        : Container(),)
                                                                ],
                                                              )
                                                          ),
                                                        ],
                                                      ),
                                                    )),),
                                                SizedBox(height: 8,),
                                                Text(' مشاهدة الجميع',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.red),),
                                              ],

                                            ),
                                          ),
                                        )
                                            : Container(),

                                        (viewModel.topCardScorer != null)
                                            ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: Container(
                                            height: (240 + (60 * 3))
                                                .toDouble(),
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                                color: Theme
                                                    .of(context)
                                                    .secondaryHeaderColor
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 16,),
                                                Text("الكروت", style: Theme
                                                    .of(context)
                                                    .primaryTextTheme
                                                    .headline6,),
                                                SizedBox(height: 8,),

                                                Column(children: List.generate(
                                                    viewModel.topCardScorer
                                                        .length > 3
                                                        ? 3
                                                        : viewModel
                                                        .topCardScorer
                                                        .length, (index) =>
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              height: 80,
                                                              width: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .width,
                                                              child: Row(
                                                                children: [
                                                                  Text(viewModel
                                                                      .topCardScorer[index]['yellowcards']
                                                                      .toString(),
                                                                    style: TextStyle(
                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .yellow),),
                                                                  Text(viewModel
                                                                      .topCardScorer[index]['redcards']
                                                                      .toString(),
                                                                    style: TextStyle(
                                                                        fontSize: 18,
                                                                        color: Colors
                                                                            .red),),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              height: 80,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Colors
                                                                            .white
                                                                    ),
                                                                    child: (viewModel
                                                                        .topCardScorer[index]['player']['data']['image_path'] !=
                                                                        null)
                                                                        ? Image
                                                                        .network(
                                                                        viewModel
                                                                            .topGoals[index]['player']['data']['image_path'])
                                                                        : Container(),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,),
                                                                  Text(viewModel
                                                                      .topCardScorer[index]['player']['data']['display_name'],
                                                                    style: Theme
                                                                        .of(
                                                                        context)
                                                                        .primaryTextTheme
                                                                        .headline1,),

                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              height: 80,
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                      child: Text(
                                                                        viewModel
                                                                            .leagueName[viewModel
                                                                            .topCardScorer[index]['team']['data']['name']] !=
                                                                            null
                                                                            ? viewModel
                                                                            .leagueName[viewModel
                                                                            .topCardScorer[index]['team']['data']['name']]
                                                                            : viewModel
                                                                            .topCardScorer[index]['team']['data']['name'],
                                                                        style: Theme
                                                                            .of(
                                                                            context)
                                                                            .primaryTextTheme
                                                                            .headline1,)),
                                                                  Container(
                                                                    height: 25,
                                                                    width: 25,
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Colors
                                                                            .white
                                                                    ),
                                                                    child: (viewModel
                                                                        .topCardScorer[index]['team']['data']['logo_path'] !=
                                                                        null)
                                                                        ? Image
                                                                        .network(
                                                                        viewModel
                                                                            .topCardScorer[index]['team']['data']['logo_path'])
                                                                        : Container(),
                                                                  )
                                                                ],
                                                              ),

                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),),
                                                SizedBox(height: 8),
                                                Text(' مشاهدة الجميع',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.red),),
                                              ],

                                            ),
                                          ),
                                        )
                                            : Container(),


                                        ////////Ball Posession///////////////////////
                                        (viewModel.teamsSeason != null)
                                            ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: Container(
                                            height: (250 + (60 * 3)).toDouble(),
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.only(
                                                left: 12, right: 12),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                                color: Theme
                                                    .of(context)
                                                    .secondaryHeaderColor
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 16,),
                                                Text(" ​​نسبة استحواذ الكرة",
                                                  style: Theme
                                                      .of(context)
                                                      .primaryTextTheme
                                                      .headline6,),
                                                SizedBox(height: 8),
                                                Column(
                                                    children: List.generate(
                                                        viewModel.teamsSeason
                                                            .length >= 3
                                                            ? 3
                                                            : viewModel
                                                            .teamsSeason
                                                            .length, (index) =>
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              vertical: 8.0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Text(viewModel
                                                                  .teamsSeason[index]['stats'] !=
                                                                  null &&
                                                                  viewModel
                                                                      .teamsSeason[index]['stats']['data']
                                                                      .isNotEmpty
                                                                  ? viewModel
                                                                  .teamsSeason[index]['stats']['data'][0]['avg_ball_possession_percentage']
                                                                  : '-',
                                                                  style: Theme
                                                                      .of(
                                                                      context)
                                                                      .primaryTextTheme
                                                                      .headline1),
                                                              Spacer(),
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Colors
                                                                            .grey
                                                                    ),
                                                                    child: (viewModel
                                                                        .teamsSeason[index]['logo_path'] !=
                                                                        null)
                                                                        ? Image
                                                                        .network(
                                                                        viewModel
                                                                            .teamsSeason[index]['logo_path'])
                                                                        : Container(),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,),
                                                                      () {
                                                                    print(
                                                                        "Team Season: ${viewModel
                                                                            .teamsSeason}");
                                                                    // print("League Name: ${viewModel.leagueName[viewModel.teamsSeason[0]['name']]}");
                                                                    return (viewModel
                                                                        .teamsSeason !=
                                                                        null &&
                                                                        viewModel
                                                                            .teamsSeason
                                                                            .length >
                                                                            0)
                                                                        ? Text(
                                                                      viewModel
                                                                          .leagueName[viewModel
                                                                          .teamsSeason[index]['name']] !=
                                                                          null
                                                                          ? viewModel
                                                                          .leagueName[viewModel
                                                                          .teamsSeason[index]['name']]
                                                                          : viewModel
                                                                          .teamsSeason[index]['name'],
                                                                      style: Theme
                                                                          .of(
                                                                          context)
                                                                          .primaryTextTheme
                                                                          .headline1,)
                                                                        : Text(
                                                                        "");
                                                                  }()

                                                                ],
                                                              ),
                                                              Spacer(),
                                                            ],
                                                          ),
                                                        ))),
                                                Text(' مشاهدة الجميع',
                                                  style: TextStyle(fontSize: 18,
                                                      color: Colors.red),),

                                              ],

                                            ),
                                          ),
                                        )
                                            : Container(),
                                        ///////Bottom   List////////
                                        (viewModel.namearr != null) ? Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  20),
                                              color: Theme
                                                  .of(context)
                                                  .secondaryHeaderColor
                                          ),
                                          child: Column(
                                              children: List.generate(
                                                  viewModel.namearr.length, (
                                                  index) =>
                                                  scoresSecondListItem(
                                                      context, viewModel,
                                                      index))
                                          ),
                                        ) : Container(),
                                      ],
                                    )
                                        : (viewModel.isTabSelected_6 == true) &&
                                        (viewModel.matchsScore != null)
                                        ? Column(
                                        children: List.generate(
                                            viewModel.matchsScore.length, (
                                            index) =>
                                            currentMatchesWidget(
                                                context, viewModel, index))
                                    )
                                        : (viewModel.isTabSelected_7 == true) &&
                                        (viewModel.knockoutResponse != null)
                                        ? viewModel
                                        .isLoading ? Center(
                                        child: CustomLoader()) : Knockout(
                                        knockoutResponse: viewModel
                                            .knockoutResponse) /*Container()*/
                                        :
                                    Container(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    (viewModel.viewState == ViewState.Busy
                        ? Positioned.fill(child: Loading())
                        : Container()),
                ],
              ),
            ),
          )*/
/* : (viewModel
                              .isTabSelected_5 == true) &&

                              : (viewModel.isTabSelected_6 == true) &&
                              (viewModel.matchsScore != null)
                              ? Column(
                              children: List.generate(
                                  viewModel.matchsScore.length, (
                                  index) =>
                                  currentMatchesWidget(
                                      context, viewModel, index))
                          )
                              : (viewModel.isTabSelected_7 == true) &&
                              (viewModel.knockoutResponse != null)
                              ? viewModel
                              .isLoading ? Center(
                              child: CustomLoader()) : Knockout(
                              knockoutResponse: viewModel
                                  .knockoutResponse) */ /*Container()*/ /*
                              :
                          Container(),
*/
