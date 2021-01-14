import 'package:covid19_tracker_app/themes/constant.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CardSection extends StatelessWidget {
  const CardSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardStatus(
          colorCard: warning,
          newCases: "25",
          status: "Active",
          totalCases: "7,987",
          cardIcon: LineIcons.flash,
        ),
        SizedBox(
          width: 15,
        ),
        CardStatus(
          colorCard: success,
          newCases: "5",
          status: "Recovered",
          totalCases: "1,109",
          cardIcon: LineIcons.heart,
        ),
        SizedBox(
          width: 15,
        ),
        CardStatus(
          colorCard: primary,
          newCases: "23",
          status: "Deceased",
          totalCases: "335",
          cardIcon: Icons.coronavirus_sharp,
        ),
      ],
    );
  }
}

class CardStatus extends StatelessWidget {
  final Color colorCard;
  final String newCases;
  final String totalCases;
  final String status;
  final IconData cardIcon;

  const CardStatus({
    Key key,
    this.colorCard,
    this.newCases,
    this.totalCases,
    this.status,
    this.cardIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: textWhite.withOpacity(.05),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: colorCard.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: colorCard, width: 2)),
                child: Icon(
                  cardIcon,
                  color: colorCard,
                )),
            SizedBox(
              height: 15,
            ),
            Text(
              "[+$newCases]",
              style: TextStyle(fontSize: 13, color: colorCard),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "$totalCases",
              style: TextStyle(fontSize: 25, color: colorCard),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$status",
              style: TextStyle(fontSize: 15, color: colorCard),
            ),
          ],
        ),
      ),
    ));
  }
}
