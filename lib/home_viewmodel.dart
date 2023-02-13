import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier{
  final _controller = PageController();
  PageController get homePageController => _controller;
}