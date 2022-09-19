import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  late final dynamic _src;

  MyImage(src, {super.key}) {
    _src = src;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Image.network(
        _src,
        fit: BoxFit.fill,
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
              color: Colors.grey[900],
            ),
          );
        },
      ),
    );
  }
}
