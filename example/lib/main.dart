import 'package:csurface/csurface_platform_interface.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:csurface/csurface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int textureId = -1;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await Future.delayed(const Duration(seconds: 3));
    int id = await CsurfacePlatform.instance.createTexture(
        {'width': 300.0, 'height': 300.0});
    setState(() {
      textureId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: textureId == -1
                ? const CircularProgressIndicator()
                : Texture(textureId: textureId),
          ),
        ),
      ),
    );
  }
}
