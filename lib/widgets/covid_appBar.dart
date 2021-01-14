import 'package:covid19_tracker_app/themes/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CovidAppBar extends StatelessWidget {
  const CovidAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: SvgPicture.asset(
            "assets/images/burger_icon.svg",
            width: 15,
            height: 15,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "Covid19 Tracker App",
          style: appTitle,
        )
      ],
    );
  }
}
