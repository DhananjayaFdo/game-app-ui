import 'package:designs/constants/cus_extentions.dart';
import 'package:designs/models/game.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final GameModel game;
  final Color color;

  const GameScreen({
    super.key,
    required this.game,
    required this.color,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  _subTitle(List title) {
    title.removeAt(0);
    title = title.map((e) => e.toString().capitalize()).toList();
    return title.join(" ");
  }

  _titleGenerator(String text) {
    List titles = text.split(' ').toList();

    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //? -------------------
          if (titles.isNotEmpty)
            Text(
              titles[0].toString().toUpperCase(),
              // textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.5),
                  ),
            ),

          //? -------------------
          const SizedBox(height: 5),

          //? -------------------
          if (titles.length > 1)
            Text(
              _subTitle(titles),
              maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 50,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [widget.color, widget.color.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Stack(
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: _titleGenerator(widget.game.name ?? ''),
                    ),

                    //? ---------
                    Center(
                      child: Hero(
                        tag: 'hero-tag',
                        child: Image.asset(
                          widget.game.img ?? '',
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StartButton(color: widget.color),
            ],
          ),
        ),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  final Color color;

  const StartButton({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Click to Start',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Icon(
                Icons.play_arrow,
                color: color,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
