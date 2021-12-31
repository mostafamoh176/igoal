
import 'package:app_igoal/Screens/Description/descriptionView.dart';
import 'package:app_igoal/Screens/Players/playersViewModel.dart';
import 'package:app_igoal/Screens/playerInfo/playerInfoViewModel.dart';
import 'package:app_igoal/Widgets/customTabBarWidget.dart';
import 'package:app_igoal/helpers/importFiles.dart';
import 'package:app_igoal/helpers/validationModel.dart';
import 'package:app_igoal/serivces/networks/Loader.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class PlayerInfoView extends StatefulWidget {

  String playerId;

  PlayerInfoView({this.playerId});
  @override
  _PlayerInfoViewState createState() => _PlayerInfoViewState();
}

class _PlayerInfoViewState extends State<PlayerInfoView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayersInfoViewModel>(
       init: PlayersInfoViewModel(playerId: widget.playerId),
       builder: (viewModel){
         return SafeArea(
           bottom: false,
           child: Stack(
             children: [
               if (viewModel.viewState == ViewState.Idle)
               Scaffold(
                 body: Column(
                   children: [
                     InkWell(
                       splashColor:Colors.transparent,
                       hoverColor: Colors.transparent,
                       focusColor: Colors.transparent,
                       highlightColor:Colors.transparent,
                       overlayColor: MaterialStateProperty.all(Colors.transparent),
                       child: Container(
                         height: 40,
                         color: Theme.of(context).secondaryHeaderColor,
                         width: MediaQuery.of(context).size.width,
                         padding: EdgeInsets.only(top:12),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             SizedBox(width:12),
                             Icon(Icons.navigate_before,color: Theme.of(context).buttonColor,),
                           ],
                         ),
                       ),
                       onTap: (){
                         Get.back();
                       },
                     ),
                     clubPlayersTopItem(context, viewModel),
                     Padding(
                       padding: EdgeInsets.only(
                         top: 16,
                       ),
                       child: Container(
                         height: 60,
                         width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           //color: Colors.grey
                           color: Theme.of(context).secondaryHeaderColor,
                         ),
                         padding:
                         EdgeInsets.only(top: 16, left: 20, right: 20),
                         child: SingleChildScrollView(
                           child: Row(
                             //scrollDirection: Axis.horizontal,
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               CustomTabBarItem(
                                 title: 'الإخبارية',
                                 isSelected: viewModel.isTabSelected_1,
                                 titleSize: 18,
                                 onTap: () {
                                   viewModel.onTab1Selected();
                                 },
                               ),
                               SizedBox(
                                 width: 20,
                               ),
                               CustomTabBarItem(
                                 title: 'التحويلات',
                                 isSelected: viewModel.isTabSelected_2,
                                 titleSize: 18,
                                 onTap: () {
                                   viewModel.onTab2Selected();
                                 },
                               ),
                               SizedBox(
                                 width: 20,
                               ),
                               CustomTabBarItem(
                                 title: 'الملف الشخصي',
                                 titleSize: 18,
                                 isSelected: viewModel.isTabSelected_3,
                                 onTap: () {
                                   viewModel.onTab3Selected();
                                 },
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                     SizedBox(height: 20,),
                     if(viewModel.isTabSelected_3 == true)
                       Container(
                         height: MediaQuery.of(context).size.height*0.3,
                         width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color:Theme.of(context).secondaryHeaderColor,
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                               height: MediaQuery.of(context).size.height*0.1,
                               width: MediaQuery.of(context).size.width,
                               child: Row(
                                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Expanded(
                                     child: Column(
                                       children: [
                                         Text((viewModel.playerInfo['heigth']!=null)?viewModel.playerInfo['height']:"No height",style: Theme.of(context).primaryTextTheme.headline1,),
                                         SizedBox(height: 8,),
                                         Text("الطول",style:Theme.of(context).primaryTextTheme.subtitle1,)
                                       ],
                                     ),
                                   ),
                                   Container(
                                     width: 2,
                                     color: Colors.grey,
                                     height: MediaQuery.of(context).size.height*0.1,
                                   ),
                                   Expanded(
                                     child: Column(
                                       children: [
                                         Text((viewModel.playerInfo['weight']!=null)?viewModel.playerInfo['weight']:"No weight",style:Theme.of(context).primaryTextTheme.headline1,),
                                         SizedBox(height: 8,),
                                         Text("الوزن",style:Theme.of(context).primaryTextTheme.subtitle1,)
                                       ],
                                     ),
                                   ),
                                   Container(
                                     width: 2,
                                     color: Colors.grey,
                                     height: MediaQuery.of(context).size.height*0.1,
                                   ),
                                   Expanded(
                                     child: Column(
                                       children: [
                                         InkWell(
                                             splashColor:Colors.transparent,
                                             hoverColor: Colors.transparent,
                                             focusColor: Colors.transparent,
                                             highlightColor:Colors.transparent,
                                             overlayColor: MaterialStateProperty.all(Colors.transparent),
                                             onTap:(){
                                               // final date2 = DateTime.now();
                                               // print(DateFormat("dd/MM/yyyy").parse("07/10/1996"));
                                               // final difference = DateTime.now().difference(DateFormat("dd/MM/yyyy").parse(viewModel.playerInfo['birthdate'])).inDays/365;
                                               // print(difference);

                                                 },
                                             child: Text((viewModel.playerInfo['birthdate']!=null)?(DateTime.now().difference(DateFormat("dd/MM/yyyy").parse(viewModel.playerInfo['birthdate'])).inDays/365).toString().split(".")[0]:"No Age",style: Theme.of(context).primaryTextTheme.headline1,)),
                                         SizedBox(height: 8,),
                                         Text(viewModel.playerInfo['birthdate']!=null?viewModel.playerInfo['birthdate']:viewModel.playerInfo['birthdate'],style: Theme.of(context).primaryTextTheme.subtitle1,)
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(height: 20,),
                             Container(
                               height: MediaQuery.of(context).size.height*0.1,
                               width: MediaQuery.of(context).size.width,
                               child: Row(
                                 //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Expanded(
                                     child: Column(
                                       children: [
                                         Text(viewModel.leagueName[viewModel.playerInfo['country']['data']['name']]!=null?viewModel.leagueName[viewModel.playerInfo['country']['data']['name']]:viewModel.playerInfo['country']['data']['name'],style: Theme.of(context).primaryTextTheme.headline1,),
                                         SizedBox(height: 8,),
                                         Text("الدولة",style: Theme.of(context).primaryTextTheme.subtitle1,)
                                       ],
                                     ),
                                   ),
                                   Container(
                                     width: 2,
                                     color: Colors.grey,
                                     height: MediaQuery.of(context).size.height*0.1,
                                   ),
                                   Expanded(
                                     child: Column(
                                       children: [
                                         Text(viewModel.leagueName[viewModel.playerInfo['position']['data']['name']]!=null?viewModel.leagueName[viewModel.playerInfo['position']['data']['name']]:viewModel.playerInfo['position']['data']['name'],style: Theme.of(context).primaryTextTheme.headline1,),
                                         SizedBox(height: 8,),
                                         Text("حارس مرمى",style: Theme.of(context).primaryTextTheme.subtitle1,)
                                       ],
                                     ),
                                   ),
                                   Container(
                                     width: 2,
                                     color: Colors.grey,
                                     height: MediaQuery.of(context).size.height*0.1,
                                   ),
                                   Expanded(
                                     child: Column(
                                       children: [
                                         Text(viewModel.playerInfo['lineups']['data'][0]['number'].toString(),style: Theme.of(context).primaryTextTheme.headline1,),
                                         SizedBox(height: 8,),
                                         Text("رقم القميص",style: Theme.of(context).primaryTextTheme.subtitle1,)
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),

                           ],
                         ),
                       ),
                     if(viewModel.isTabSelected_2==true)
                       (viewModel.transfer!=null)?Container(
                         height: 300,
                         width: MediaQuery.of(context).size.width,
                         child: ListView(
                           children: [
                             transferListItem(context, viewModel)
                           ],
                         ),

                       ):Container(),
                     if(viewModel.isTabSelected_1==true)
                       ( viewModel.newsList!=null)? Expanded(
                         child: Container(
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                              itemCount: viewModel.newsList.length,
                              itemBuilder:(BuildContext context,int index){
                                return videoItemSecond(context, viewModel, index);
                              }
                          ),
                         ),
                       ):Container(),

                   ],
                 ),
               )
               else
                 (viewModel.viewState == ViewState.Busy
                     ? Positioned.fill(child: Loading())
                     : Container()),
             ],
           ),
         );
       },
    );
  }

  Widget transferListItem(BuildContext context,PlayersInfoViewModel viewModel,) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Container(
        height: MediaQuery.of(context).size.height*0.1,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).secondaryHeaderColor
        ),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.67,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          viewModel.leagueName[viewModel.transfer[0]['toTeam']['data']['name']]!=null? viewModel.leagueName[viewModel.transfer[0]['toTeam']['data']['name']]:viewModel.transfer[0]['toTeam']['data']['name'],
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                         // overflow: TextOverflow.ellipsis
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child:(viewModel.transfer[0]['toTeam']['data']['logo_path']==null)? Image.asset("assets/images/noTeam.jpg"):Image.network(viewModel.transfer[0]['toTeam']['data']['logo_path']),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                     Image.asset("assets/images/arrow_in.png",height: 20,width: 20,),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child:Image.network( viewModel.getteamImageObject(viewModel.transfer[0]['from_team_id'].toString()))
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          viewModel.leagueName[viewModel.getteamObject(viewModel.transfer[0]['from_team_id'].toString())]!=null?viewModel.leagueName[viewModel.getteamObject(viewModel.transfer[0]['from_team_id'].toString())]:viewModel.getteamObject(viewModel.transfer[0]['from_team_id'].toString()),
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // Container(
                      //   height: 18,
                      //   width: 18,
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.circle, color: Colors.grey),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(360),
                      //     child: Image.network(['player']['data']['image_path']),
                      //   ),
                      // ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  viewModel.transfer[0]['date'],
                  style: TextStyle(fontSize: 13, color: Color(0xff6B6B6B)),
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.network(viewModel.transfer[0]['player']['data']['image_path'])
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          viewModel.leagueName[viewModel.transfer[0]['player']['data']['display_name']]!=null?viewModel.leagueName[viewModel.transfer[0]['player']['data']['display_name']]:viewModel.transfer[0]['player']['data']['display_name'],
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  Container clubPlayersTopItem(BuildContext context, PlayersInfoViewModel viewModel) {
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.grey, shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: Image.network(viewModel.playerInfo['image_path']),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        Text(
           viewModel.leagueName[viewModel.playerInfo['display_name']]!=null? viewModel.leagueName[viewModel.playerInfo['display_name']]:viewModel.playerInfo['display_name'],
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
         // Text(viewModel.playerInfo['display_name']),
          SizedBox(
            height: 6,
          ),
          // Text(
          //   'Club Barcelona',
          //   style: TextStyle(fontSize: 16, color: Color(0xff5F5F5F)),
          // )
        ],
      ),
    );
  }


  Widget videoItemSecond(BuildContext context,PlayersInfoViewModel viewModel,int index) {
    return InkWell(
      splashColor:Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor:Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: (){
        //Get.to(()=>DescriptionView(newsDetail: viewModel.newsList[index],));
        // Get.to(()=>DescriptionView(newsDetail: viewModel.myNewsList[index],));

      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20,bottom: 4,top: 4,right: 20),
        child: Container(
          // height: MediaQuery.of(context).size.height*0.15,
          height: 95,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(18)
          ),
          padding:EdgeInsets.only(right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 95,
                width: 95,
                //color: Colors.purple,
                decoration: BoxDecoration(
                  //  color: Color(0xff1F1F1F),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Image.network(viewModel.newsList[index]['nesimgurl'],fit: BoxFit.cover,),
              ),
              SizedBox(width: 16,),
              Expanded(child: Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: Text(viewModel.newsList[index]['newstitle'],maxLines: 5,style:Theme.of(context).primaryTextTheme.subtitle1,overflow: TextOverflow.ellipsis,)
              )
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
