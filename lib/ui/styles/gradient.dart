import 'package:flutter/material.dart';

var linearGradient = LinearGradient(
    colors: [
      const Color(0xFF21B0F6),
      const Color(0xFF006DA6),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp);
