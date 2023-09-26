import 'package:flutter/material.dart';

class Palette {
  Color primaryColor;
  Color secondaryColor;
  int index;

  Palette(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.index});
}

class PaletteState extends ChangeNotifier {
  Palette selectedPalette = Palette(
      primaryColor: const Color(0xFF000428),
      secondaryColor: const Color(0xFF004e92),
      index: 0);

  Palette? hoveredPalette;

  List<Palette> availablePalette = [
    Palette(
        primaryColor: const Color(0xFF000428),
        secondaryColor: const Color(0xFF004e92),
        index: 0),
    Palette(
        primaryColor: const Color(0xFFff7e5f),
        secondaryColor: const Color(0xFFfeb47b),
        index: 1),
    Palette(
        primaryColor: const Color(0xFFfc67fa),
        secondaryColor: const Color(0xFFf4c4f3),
        index: 2),
    Palette(
        primaryColor: const Color(0xFFde6161),
        secondaryColor: const Color(0xFF2657eb),
        index: 3),
    Palette(
        primaryColor: const Color(0xFF89253e),
        secondaryColor: const Color(0xFF3a6186),
        index: 4),
    Palette(
        primaryColor: const Color(0xFF4ecdc4),
        secondaryColor: const Color(0xFF556270),
        index: 5),
    Palette(
        primaryColor: const Color(0xFF8e9eab),
        secondaryColor: const Color(0xFFeef2f3),
        index: 6),
    Palette(
        primaryColor: const Color(0xFFbe93c5),
        secondaryColor: const Color(0xFF7bc6cc),
        index: 7),
  ];

  void changeSelectedPalette(Palette palette) {
    selectedPalette = palette;
    notifyListeners();
  }

  void changeHoveredPalette(Palette? palette) {
    hoveredPalette = palette;
    notifyListeners();
  }
}