// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:movie_app/core/presentation/loading.dart';
import 'package:movie_app/gen/assets.gen.dart';

class ImageCacheWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String url;
  final BoxFit boxFit;
  const ImageCacheWidget({
    Key? key,
    required this.url,
    this.boxFit = BoxFit.fitHeight,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager:
          CacheManager(Config(url, stalePeriod: const Duration(days: 1))),
      imageUrl: url,
      cacheKey: url,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: boxFit,
              colorFilter:
                  const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => SizedBox(
          height: height,
          width: width,
          child: const Center(child: LoadingWidget())),
      errorWidget: (context, url, error) => Center(
        child: Assets.images.warning.image(),
      ),
    );
  }
}
