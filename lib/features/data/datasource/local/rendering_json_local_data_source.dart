import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class RenderingJsonLocalDataSource {
  Future<Map<String, dynamic>> getUIRenderingJson();
}

class RenderingJsonLocalDataSourceImpl implements RenderingJsonLocalDataSource {
  @override
  Future<Map<String, dynamic>> getUIRenderingJson() async {
    final jsonStr = await rootBundle.loadString('assets/rendering_json.json');
    final jsonData = json.decode(jsonStr);
    debugPrint("jsonData : $jsonData");
    return jsonData;
  }
}
