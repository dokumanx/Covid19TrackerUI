import "dart:math" as math show pi;

import 'package:covid19_tracker_app/line_chart.dart';
import 'package:covid19_tracker_app/themes/constant.dart';
import 'package:covid19_tracker_app/widgets/card_section.dart';
import 'package:covid19_tracker_app/widgets/covid_appBar.dart';
import 'package:covid19_tracker_app/widgets/red_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: [
          CovidAppBar(),
          SizedBox(
            height: 40,
          ),
          RedCard(),
          SizedBox(
            height: 20,
          ),
          UpdateSection(),
          SizedBox(
            height: 40,
          ),
          CardSection(),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Spread Trends",
                style: appSubTitle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: textWhite.withOpacity(.05),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Active Cases",
                              style: contentWhite.copyWith(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "7,987",
                            style: contentWhite.copyWith(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("[ +25 cases ]",
                              style: contentWhite.copyWith(
                                  color: Colors.blue,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Weekly",
                            style: TextStyle(color: textWhite),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Monthly",
                            style: TextStyle(color: textWhite),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: textWhite.withOpacity(.05),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Container(
                              height: 2,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: textWhite,
                                  borderRadius: BorderRadius.circular(20)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      chartWidget,
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class UpdateSection extends StatefulWidget {
  const UpdateSection({
    Key key,
  }) : super(key: key);

  @override
  _UpdateSectionState createState() => _UpdateSectionState();
}

class _UpdateSectionState extends State<UpdateSection>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TweenSequence<double> rotationTween;
  Animation<double> animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    rotationTween = TweenSequence([
      TweenSequenceItem(
          weight: 1, tween: Tween<double>(begin: 0, end: -math.pi * .25)),
      TweenSequenceItem(
          weight: 8,
          tween: Tween<double>(begin: -math.pi * .25, end: math.pi * 4))
    ]);

    animation = rotationTween.animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transmission Update",
              style: appSubTitle,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Latest Update : 13 March 2020",
              style: contentWhite,
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            _controller.forward();
            print("hello");
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Transform.rotate(
                angle: animation.value,
                child: Icon(
                  LineIcons.refresh,
                  color: textWhite,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
