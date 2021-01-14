import 'package:covid19_tracker_app/themes/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backToHomePage(context),
            Container(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Self Check up\nfor Covid19",
                            style: appTitle,
                          ),
                          Image.asset(
                            "assets/images/image_2.png",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 165.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 4,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: textWhite,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        Container(
                                          height: 3,
                                          width: size.width - 120,
                                          decoration: BoxDecoration(
                                            color: textWhite.withOpacity(.05),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "1/10",
                                  style: contentWhite,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Have you\nexperienced any\nof the following\nsymptoms:",
                              style:
                                  appTitle.copyWith(fontSize: 26, height: 1.6),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Fever, Cough, Sneezing,\nSore Throat, Difficult in Breating",
                              style: appSubTitle.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  wordSpacing: 1.5,
                                  letterSpacing: .4,
                                  height: 2),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomButton(text: "No", size: size),
                                getCustomButton(text: "Yes", size: size),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container getCustomButton({@required String text, @required Size size}) {
    return Container(
      width: (size.width - 120) / 2,
      child: FlatButton(
        color: textWhite,
        onPressed: () {},
        child: Text(
          "$text",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  GestureDetector backToHomePage(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.arrow_back_ios,
          color: bgColor,
        ),
      ),
    );
  }
}
