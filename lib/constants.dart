import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color base(hexCode) => Color(int.parse("0xFF$hexCode"));

class AppColours {
  static final primaryWhite = base("FFFFFF");
  static final primaryBlack = base("000000");
  static final primaryGrey = base("2D2D2D");
  static final primaryBlueGrey = base("607D8B");
  static final secondaryGrey = base("6B6B6B").withOpacity(0.93);
  static final primaryBlue = base("007AFF");
  static final screenBackgroundColour = base("1E1E1E");
}

//FontWeights
const kFW100 = FontWeight.w100;
const kFW200 = FontWeight.w200;
const kFW300 = FontWeight.w300;
const kFW400 = FontWeight.w400;
const kFW500 = FontWeight.w500;
const kFW600 = FontWeight.w600;
const kFW700 = FontWeight.w700;
const kFW800 = FontWeight.w800;
const kFW900 = FontWeight.w900;

const kActionNext = TextInputAction.next;

// Widgets
Widget kUnfocus({child}) => GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );

//input
const kNameInput = TextInputType.text;
const kNumberInput = TextInputType.phone;
const kPasswordInput = TextInputType.visiblePassword;
const kEmailInput = TextInputType.emailAddress;

//input formatter
final kNameFormatter = [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))];
final kTextFormatter = [
  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
];
final kNumberFormatter = [FilteringTextInputFormatter.digitsOnly];
final kEmailFormatter = [
  FilteringTextInputFormatter.allow(
    RegExp('[a-zA-Z@1-9._]'),
  ),
];
final kPasswordFormatter = [
  FilteringTextInputFormatter.allow(
    RegExp('[a-zA-Z0-9_|#@!*?+%]'),
  ),
];
