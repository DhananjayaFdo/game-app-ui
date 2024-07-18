import 'package:designs/models/game.dart';
import 'package:designs/screens/home/widgets/body.dart';
import 'package:designs/screens/home/widgets/top_bar.dart';
import 'package:flutter/material.dart';

import '../../constants/img_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List games = [
    {"name": "super mario bros", "img": ImgRepo.super_mario, "ratings": 4.5, "price": 7.99},
    {"name": "Pokemon Pikachu", "img": ImgRepo.pikachu, "ratings": 4.5, "price": 7.99},
    {"name": "tangled disney pascal", "img": ImgRepo.tangled_enrolados, "ratings": 4.0, "price": 4.99},
    {"name": "angry bird", "img": ImgRepo.andry_bird, "ratings": 4.2, "price": 4.99},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.02,
            right: MediaQuery.of(context).size.width * 0.02,
          ),

          //? ----------
          child: Body(games: games.map((e) => GameModel.fromMap(e)).toList()),
        ),
      ),
    );
  }
}
