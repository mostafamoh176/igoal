import 'package:app_igoal/helpers/importFiles.dart';

class Team extends StatelessWidget {
  final String image, playerArrangement;

  const Team(
      {@required this.image,
      @required this.playerArrangement});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            width: size.height * 0.14,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image ?? 'https://via.placeholder.com/150'),
                  fit: BoxFit.contain),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            playerArrangement ?? '4-2-3-1',
            style: Theme.of(
                context)
                .primaryTextTheme
                .subtitle2,
          ),
        )
      ],
    );
  }
}
