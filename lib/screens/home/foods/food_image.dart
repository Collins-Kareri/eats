import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  late final dynamic _src;

  MyImage(src, {super.key}) {
    _src = src;
  }

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          widget._src,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.medium,
          cacheHeight: 300,
          cacheWidth: 300,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
