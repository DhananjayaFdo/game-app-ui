import 'package:designs/constants/svg_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: SvgPicture.asset(
          SvgRepo.menu,
          width: 50,
        ),
      ),

      //? -------------------
      title: Text(
        'Games',
        textAlign: TextAlign.center,
      ),

      //? -----------------
      actions: [
        SizedBox(
          width: 50,
          child: Icon(Icons.search, size: 30),
        ),
      ],
    );
  }
}
