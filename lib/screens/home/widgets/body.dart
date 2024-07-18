import 'dart:math';

import 'package:designs/constants/cus_extentions.dart';
import 'package:designs/constants/img_repo.dart';
import 'package:designs/screens/game/game.dart';
import 'package:designs/themes/theme_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../models/game.dart';

class Body extends StatelessWidget {
  final List<GameModel> games;

  const Body({
    super.key,
    required this.games,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) => ItemCard(game: games[index]),
    );
  }
}

class ItemCard extends StatefulWidget {
  final GameModel game;

  const ItemCard({
    super.key,
    required this.game,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    _updateBackgroundColor();
  }

  Color randomColor() => Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

  Future<void> _updateBackgroundColor() async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(widget.game.img ?? ImgRepo.andry_bird),
    );

    setState(() {
      backgroundColor = paletteGenerator.darkVibrantColor?.color ?? Colors.white;
    });
  }

  _subTitle(List title) {
    title.removeAt(0);
    title = title.map((e) => e.toString().capitalize()).toList();
    return title.join(" ");
  }

  _titleGenerator(String text) {
    List titles = text.split(' ').toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //? -------------------
        if (titles.isNotEmpty)
          Text(
            titles[0].toString().toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 15,
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
                  fontSize: 30,
                  height: 1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color ranColor = randomColor();

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => GameScreen(
            game: widget.game,
            color: backgroundColor ?? randomColor(),
          ),
        )),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 10, bottom: 10, top: 20),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      backgroundColor ?? Colors.white,
                      backgroundColor?.withOpacity(0.6) ?? Colors.white,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleGenerator(widget.game.name ?? ''),
                          RatingShower(rating: widget.game.ratings ?? 0.0),
                          const Spacer(),
                          Price(price: widget.game.price ?? 0.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //? -------
            Positioned(
              right: -10,
              child: Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: 'hero-tag',
                  child: Image.asset(widget.game.img ?? '', height: 175, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingShower extends StatelessWidget {
  final double rating;

  const RatingShower({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...List.generate(
          5,
          (index) => const Icon(Icons.star_border, size: 15, color: Colors.white),
        ),

        //? ----------------------
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            rating.toString(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ],
    );
  }
}

class Price extends StatelessWidget {
  final double price;

  const Price({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
          ),
          child: Text(
            "\$ ${price.toString()}",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                ),
          ),
        ),

        //? ----------
        const SizedBox(width: 5),

        //? ----------
        Text(
          "Details",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
        ),
      ],
    );
  }
}
