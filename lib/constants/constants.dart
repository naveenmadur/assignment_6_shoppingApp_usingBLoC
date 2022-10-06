import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';

const TextStyle kPriceTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const TextStyle kTitleTextStyle = TextStyle(color: kGreenAccent,fontSize: 25,fontWeight: FontWeight.bold);
const TextStyle kOrderTitleTextStyle = TextStyle(color: kGrey, fontSize: 15);
const TextStyle kCartTitleTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

const EdgeInsetsGeometry kCardPadding = EdgeInsets.only(left: 20, top: 10, bottom: 20, right: 15);
const EdgeInsetsGeometry kCartItemMargin =  EdgeInsets.only(left: 10, right: 10, bottom: 8);
const EdgeInsetsGeometry kAppDrawerPadding = EdgeInsets.symmetric(horizontal: 15);

const IconThemeData kAppBarIconThemeData = IconThemeData(color: kGrey);

const EdgeInsetsGeometry kCartScreenBuyButtonMargin =  EdgeInsets.only(bottom: 30);
const EdgeInsetsGeometry kCartScreenBuyButtonPadding =   EdgeInsets.symmetric(horizontal: 160, vertical: 15);
const EdgeInsetsGeometry kHomeScreenBodyPadding =  EdgeInsets.all(10);
const EdgeInsetsGeometry kOrdersScreenBodyPadding =   EdgeInsets.symmetric(horizontal: 8.0);
const EdgeInsetsGeometry kCartItemPricePadding =  EdgeInsets.symmetric(horizontal: 5, vertical: 5);
const EdgeInsetsGeometry kOrderItemPricePadding =  EdgeInsets.symmetric(horizontal: 5, vertical: 5);
const EdgeInsetsGeometry kDrawerMargin =   EdgeInsets.only(bottom: 10);
const EdgeInsetsGeometry kProductCardContainerPadding =  EdgeInsets.only(left: 10);
const EdgeInsetsGeometry kProductCardAddButtonPadding =  EdgeInsets.symmetric(horizontal: 30, vertical: 10);
const EdgeInsetsGeometry kProductCardAddIconPadding =  EdgeInsets.only(left: 10.0);

const Image kDrawerImage =  Image(image: NetworkImage('https://i.pinimg.com/originals/03/26/88/032688086182d7bd44a8e76327ca5b70.jpg'),fit: BoxFit.fill,);

const Icon kSearchIcon =  Icon(Icons.search);
const Icon kHomeIcon =  Icon(Icons.home);
const Icon kRemoveIcon =  Icon(Icons.remove);
const Icon kAddIcon =  Icon(Icons.add);
const Divider kDivider =  Divider(thickness: 1,color: kBlack,);