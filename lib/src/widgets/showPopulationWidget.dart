import 'package:flutter/material.dart';
import 'package:readtextfile/constents/Colors.dart';
import 'package:readtextfile/constents/styles.dart';

Widget PopulationWidget(context, {int maleParam, int femaleParam}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  femaleParam.toString(),
                  style: FontCustomStyles().StyleGreenDS_69(fontSizeParam: 35),
                ),
                Text(
                  "Female",
                  style: FontCustomStyles.StyleCustomParams(
                      fontColor: Colors.purple, fontSize: 18),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  maleParam.toString(),
                  style: FontCustomStyles().StyleGreenDS_69(fontSizeParam: 35),
                ),
                Text(
                  "Male",
                  style: FontCustomStyles.StyleCustomParams(
                      fontSize: 18, fontColor: Colors.red),
                )
              ],
            )
          ],
        )
      ],
    ),
    color: whiteColor,
    height: MediaQuery.of(context).size.width / 4,
    width: MediaQuery.of(context).size.width / 2,
  );
}
