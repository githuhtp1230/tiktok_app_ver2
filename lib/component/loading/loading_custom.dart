import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingCustom {
  static Widget loadingLikeTiktok() {
    return LoadingAnimationWidget.flickr(
      leftDotColor: Colors.red,
      rightDotColor: Colors.blue,
      size: 30,
    );
  }
}