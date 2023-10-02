import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderBannerWidget extends StatefulWidget {
  final List<dynamic> bannerList;
  final Map<String,dynamic>? itemsPadding;

  const CarouselSliderBannerWidget({super.key, required this.bannerList,required this.itemsPadding});

  @override
  State<StatefulWidget> createState() => _CarouselSliderBannerState();
}

class _CarouselSliderBannerState extends State<CarouselSliderBannerWidget> {
  int _current = 0;
  int bannerHeight = 160;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CarouselSlider(
          options: CarouselOptions(
              height: bannerHeight.h,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          carouselController: _controller,
          items: widget.bannerList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                if(isValidBanner(i)) {
                  return Container(
                  decoration: BoxDecoration(
                    color: i["color_code"] != null?Color(int.parse(i["color_code"])):null,
                    borderRadius: i["border_radius"] != null?BorderRadius.all(
                        Radius.circular(i["border_radius"]) //                 <--- border radius here
                    ):null,
                  ),
                  margin: widget.itemsPadding!=null?EdgeInsets.only(right: (widget.itemsPadding!["right"]??8),left: (widget.itemsPadding!["left"]??8),top: (widget.itemsPadding!["top"]??0),bottom: (widget.itemsPadding!["bottom"]??0)):null,
                  child: Stack(
                    children: [
                      if (i["color_code"] != null)
                        ColoredBox(
                          color: Color(int.parse(i["color_code"])),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),

                      if (i["image"] != null)
                        Image.network(
                          i["image"],
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.38),
                            borderRadius: BorderRadius.all(
                                Radius.circular(16.r) //                 <--- border radius here
                                ),
                          ),
                          padding: EdgeInsets.only(right: 8.w, left: 8.w),
                          margin: EdgeInsets.only(top: 16.h, left: 16.w),
                          child: Text(i["header_text"] ?? "",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.38),
                            borderRadius: BorderRadius.all(
                                Radius.circular(16.r) //                 <--- border radius here
                                ),
                          ),
                          padding: EdgeInsets.only(right: 8.w, left: 8.w),
                          margin: EdgeInsets.only(bottom: 16.h, left: 16.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  i["footer_text"] ?? "",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              if (i["footer_icon"]) const Icon(Icons.arrow_forward_outlined)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                }
                return Center(child: Icon(Icons.broken_image_outlined,size: 50.h,),);
              },
            );
          }).toList(),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.all(
                Radius.circular(16.r) //                 <--- border radius here
            ),
          ),
          padding: EdgeInsets.only(right: 8.w, left: 8.w),
          margin: EdgeInsets.only(top: 8.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.bannerList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 3.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  bool isValidBanner(i)
  {
    return (i["image"]!=null || i["color_code"]!=null ) && i["header_text"]!=null && i["footer_text"]!=null;
  }
}
