import 'package:flutter_clean_architecture/app.dart';
import 'package:flutter_clean_architecture/bootstrap.dart';
import 'package:flutter_clean_architecture/core/environment/environment.dart';
import 'package:flutter/material.dart';

void main() async {
  await bootstrap(Environment.prod);
  runApp(const MyApp());
}
