import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drink_it/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CommonImageWidget extends StatefulWidget {
  String url;
  double height;
  double width;
  double radius;
  String errorPlaceHolderImage = "";
  Widget? loader;
  BoxFit fit;
  Color errorPlaceHolderBackgroundColor = Colors.transparent;
  Color loaderColor = AppColors.whiteColor;

  CommonImageWidget(this.url, this.height, this.width,
      {this.radius = 0,
        this.errorPlaceHolderImage = "",
        this.loader,
        this.errorPlaceHolderBackgroundColor = Colors.transparent,
        this.fit = BoxFit.cover,
        this.loaderColor = AppColors.whiteColor,
        Key? key})
      : super(key: key);

  @override
  State<CommonImageWidget> createState() => _CommonImageWidgetState();
}

class _CommonImageWidgetState extends State<CommonImageWidget> {

  @override
  void didUpdateWidget(covariant CommonImageWidget oldWidget) {
    if(widget.url.compareTo(oldWidget.url) != 0){
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: CachedNetworkImage(
          imageUrl: widget.url,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: widget.fit),
            ),
          ),
          placeholder: (context, url) => Center(
            child: Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                color: widget.errorPlaceHolderBackgroundColor,
              ),
              child: Icon(Icons.wallpaper,
                  color: AppColors.grayTextColor,
                  size: widget.height * 0.5),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                color: widget.errorPlaceHolderBackgroundColor,
              ),
              child: Icon(Icons.wallpaper,
                  color: AppColors.grayTextColor,
                  size: widget.height * 0.5),
            ),
          ),
        ),
      ),
    );
  }
}
