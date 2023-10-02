library engine;

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'features/presentation/widgets/carousel_banner_widget.dart';
import 'features/presentation/widgets/horizontal_list/horizontal_list_widget.dart';

class UIRenderer extends StatefulWidget {
  final List<dynamic> json;

  const UIRenderer(this.json, {super.key});

  @override
  State<StatefulWidget> createState() => _UIRenderer();

}

class _UIRenderer extends State<UIRenderer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.json.map((i){
        return getAppropriateWidget(i as Map<String, dynamic>);
      }).toList(),
    );
  }

  Widget getAppropriateWidget(Map<String, dynamic> map) {
    switch (map["type"]) {
      case "banner":
        if(map["items"].length>1)
          {
            return CarouselSliderBannerWidget(bannerList: map["items"], itemsPadding: map["items_padding"],);
          }
        return const SizedBox.shrink();
      case "horizontal_list":
        return HorizontalListWidget(listItems: map["items"], title: map["title"],);
      default:
        return const SizedBox.shrink();
    }
  }

}
