import 'package:app_igoal/Components/Player.dart';
import 'package:app_igoal/Components/Team.dart';
import 'package:app_igoal/Models/TeamLineUp_Response.dart';
import 'package:flutter/material.dart';

class TeamLineUpScreen extends StatefulWidget {
  final TeamLineUpResponse response;

  const TeamLineUpScreen({Key key, this.response}) : super(key: key);

  @override
  _TeamLineUpScreenState createState() => _TeamLineUpScreenState();
}

class _TeamLineUpScreenState extends State<TeamLineUpScreen> {
  int i = 0;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return widget.response.data.lineup.data.isEmpty
        ? Container()
        : Stack(
            children: [
              ///BackGround
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/ground.png'),
                      fit: BoxFit.fill),
                ),
              ),

              ///Teams
              SizedBox(
                height: size.height * 0.11,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor:Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor:Colors.transparent,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: (){
                        // if(widget.response.data.formations.localteamFormation=="4-3-3")
                        setState(() => i=0);
                      },
                      child: Team(
                        playerArrangement:
                            widget.response.data.formations.localteamFormation,
                        image: widget.response.data.localTeam.localTeamData.logoPath,
                      ),
                    ),
                    InkWell(
                      splashColor:Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor:Colors.transparent,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: (){
                        // if(widget.response.data.formations.visitorteamFormation=="4-3-3")
                        setState(() => i=10);
                      },
                      child: Team(
                        playerArrangement:
                            widget.response.data.formations.visitorteamFormation,
                        image: widget.response.data.visitorTeam.visitorData.logoPath,
                      ),
                    ),
                  ],
                ),
              ),
              //Layout
              ///1
              Player(
                image: widget.response.data.lineup.data[9+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[9+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[9+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[9+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[9+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(0.01, -0.64),
              ),

              ///3
              Player(
                image: widget.response.data.lineup.data[7+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[7+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[7+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[7+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[7+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(-0.0, -0.36),
              ),
              Player(
                image:
                    widget.response.data.lineup.data[10+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[10+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[10+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[10+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[10+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(0.8, -0.36),
              ),
              Player(
                image: widget.response.data.lineup.data[5+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[5+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[5+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[5+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[5+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(-0.7, -0.36),
              ),

              ///2
              Player(
                image: widget.response.data.lineup.data[8+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[8+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[8+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[8+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[8+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(0.5, -0.07),
              ),
              Player(
                image: widget.response.data.lineup.data[6+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[6+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[6+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[6+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[6+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(-0.4, -0.07),
              ),

              ///4
              Player(
                image: widget.response.data.lineup.data[4+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[4+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[4+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[4+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[4+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(0.95, 0.24),
              ),
              Player(
                image: widget.response.data.lineup.data[3+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[3+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[3+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[3+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[3+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(0.2, 0.24),
              ),
              Player(
                image: widget.response.data.lineup.data[1+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[1+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[1+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[1+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[1+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(-0.4, 0.24),
              ),
              Player(
                image: widget.response.data.lineup.data[2+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[2+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[2+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[2+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[2+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(-0.9, 0.24),
              ),

              ///Goalkeaper
              Player(
                image: widget.response.data.lineup.data[0+i].player.playerData.imagePath,
                name:
                    widget.response.data.lineup.data[0+i].player.playerData.displayName,
                cardsData: widget.response.data.lineup.data[0+i].stats.cards,
                playerNumber: widget.response.data.lineup.data[0+i].number,
                playerRating: double.parse(
                    widget.response.data.lineup.data[0+i].stats.rating.toString() ??
                        0.0),
                alignment: Alignment(0.01, 0.57),
              ),
            ],
          );
  }
}
