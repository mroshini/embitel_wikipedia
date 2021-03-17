import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

networkImage(
    {String image,
      Widget loaderImage,
      double height,
      double width,
      BoxFit boxFit = BoxFit.fitHeight}) =>
    CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) =>
          loaderBeforeImage(width: width, height: height),
      //largeImageShimmer(context),
      errorWidget: (context, url, error) =>
          loaderBeforeImage(width: width, height: height),
      height: height,
      width: width,
      fit: boxFit,
    );

Image loaderBeforeImage(
    {double height = 135,
      double width = 162.5,
      String image = 'assets/images/no_image.jpg',
      BoxFit boxFit = BoxFit.contain}) =>
    Image.asset(
      image,
      height: height,
      width: width,
      fit: boxFit,
    );