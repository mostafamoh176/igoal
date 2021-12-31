
import 'package:app_igoal/Screens/Matches/matchesViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchesView extends StatefulWidget {
  @override
  _MatchesViewState createState() => _MatchesViewState();
}

class _MatchesViewState extends State<MatchesView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchesViewModel>(
       init: MatchesViewModel(),
        builder:(viewModel){
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 32,),
                  Expanded(
                    child: ListView(
                      children: [
                        MatchesItem(context,viewModel),
                        MatchesItem(context,viewModel),
                        MatchesItem(context,viewModel),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Padding MatchesItem(BuildContext context,MatchesViewModel viewModel) {
    return Padding(
           padding: const EdgeInsets.only(top: 11,bottom: 11),
           child: Container(
             height: 140,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
               color: Color(0xff1B1B1B),
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     clubPictureItem(viewModel),
                     SizedBox(height: 8,),
                     Text('Club',style: TextStyle(fontSize: 14,color: Colors.white),)
                   ],
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Expanded(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('June 15',style: TextStyle(fontSize: 14,color: Color(0xffD41A1A)),),
                           Text('2-0',style: TextStyle(fontSize: 36,color: Colors.white),),
                         ],
                       ),
                     ),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Container(
                           height: 18,
                           width: 18,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color: Colors.grey
                           ),
                         ),
                         SizedBox(height: 18,),

                       ],
                     ),

                   ],
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     clubPictureItem(viewModel),
                     SizedBox(height: 8,),
                     Text('Club',style: TextStyle(fontSize: 14,color: Colors.white),)
                   ],
                 ),
               ],
             ),

           ),
         );
  }

  Container clubPictureItem(MatchesViewModel viewModel) {
    return Container(
                       height: 70,
                       width: 70,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.grey
                       ),
                     );
  }
}
