
import 'package:app_igoal/Screens/PostScreen/postScreenViewModel.dart';
import 'package:app_igoal/Widgets/topLogoWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreenView extends StatefulWidget {
  @override
  _PostScreenViewState createState() => _PostScreenViewState();
}

class _PostScreenViewState extends State<PostScreenView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostScreenViewModel>(
        init: PostScreenViewModel(),
        builder:(viewModel){
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 24,),
                  Row(
                    children: [
                      Expanded(child: TopLogoItem()),
                    ],
                  ),
                  SizedBox(height: 21,),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          postItem(context,viewModel),
                          postItem(context,viewModel),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
          );
        });
  }

  Widget postItem(BuildContext context,PostScreenViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
              height:337.0,
              width: MediaQuery.of(context).size.width,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8,),
                  Container(
                    height: 202,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/images/Ronaldo.jpg'),
                  ),
                  SizedBox(height: 23,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Text('Ipsum passages, and more recently with desktop publishing',maxLines: 2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 24,color: Colors.white),),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('- FatMob',style: TextStyle(fontSize: 16,color:Color(0xff5F5F5F)),),
                  )
                ],
              ),
            ),
    );
  }
}
