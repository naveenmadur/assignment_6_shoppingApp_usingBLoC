import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';

const TextStyle kPriceTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const TextStyle kTitleTextStyle = TextStyle(color: kGreenAccent,fontSize: 25,fontWeight: FontWeight.bold);
const TextStyle kOrderTitleTextStyle = TextStyle(color: kGrey, fontSize: 15);
const TextStyle kCartTitleTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

const EdgeInsetsGeometry kCardPadding = EdgeInsets.only(left: 20, top: 10, bottom: 20, right: 15);
const IconThemeData kAppBarIconThemeData = IconThemeData(color: kGrey);
const EdgeInsetsGeometry kCartItemMargin =  EdgeInsets.only(left: 10, right: 10, bottom: 8);