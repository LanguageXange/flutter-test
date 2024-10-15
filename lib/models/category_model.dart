import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

// make the method static so we don't need to instantiate the class
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/salad.svg',
        boxColor: Color(0xff9DCEFF)));

    categories.add(CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/pancake.svg',
        boxColor: Color(0xffEEA4CE)));

    categories.add(CategoryModel(
        name: 'Smoothies',
        iconPath: 'assets/icons/burger.svg',
        boxColor: Color(0xffEEA4CE)));

    return categories;
  }
}
