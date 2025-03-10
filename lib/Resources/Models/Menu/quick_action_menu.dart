import 'package:flutter/material.dart';

class QuickActionMenu{
  String? title;
  IconData? icon;
  final VoidCallback? onTap;

  QuickActionMenu({this.title, this.icon, this.onTap});
}