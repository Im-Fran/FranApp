import 'package:flutter/material.dart';
import 'package:fran_app/views/HomePage.dart';
import 'package:get/get.dart';

void main() => runApp(const FranApp());

class FranApp extends StatelessWidget {
  const FranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetCupertinoApp(home: HomePage());
  }
}
