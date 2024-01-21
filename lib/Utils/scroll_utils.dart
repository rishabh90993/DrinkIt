import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

bool shouldPaginateFromController(ScrollController scrollController) {
  final maxScroll = scrollController.position.maxScrollExtent;
  final currentScroll = scrollController.offset;

  if (currentScroll >= (maxScroll * 0.9) &&
      scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
    return true;
  } else {
    return false;
  }
}