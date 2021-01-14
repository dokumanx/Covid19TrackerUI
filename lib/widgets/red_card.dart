import 'package:covid19_tracker_app/themes/constant.dart';
import 'package:flutter/material.dart';

class RedCard extends StatelessWidget {
  const RedCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/detail"),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Positioned(
              left: -10,
              child: Container(
                child: Image.asset(
                  "assets/images/image_1.png",
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              left: 120,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Take the Self Checkup!",
                    style: appSubTitle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Contains several checklist question to check your"
                    " physical condition.",
                    style: contentWhite,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
