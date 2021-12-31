import 'package:app_igoal/Widgets/CustomLoader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget appNetworkImage(url, BoxFit boxFit, {Color color}) {
  return CachedNetworkImage(
    imageUrl: url??'https://',
    fit: boxFit,
    color: color,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        Center(child: CustomLoader()),
    errorWidget: (context, url, error) =>
        Image.asset('assets/images/place_holder.png'),
  );
}
