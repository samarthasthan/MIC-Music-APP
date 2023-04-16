import 'package:flutter/material.dart';
import 'dart:ui';

class StackOfCards extends StatelessWidget {
  final int num;
  final Widget child;
  final double offset;
  final String url;

  const StackOfCards(
      {int num = 1, required this.child, this.offset = 8.0, required this.url})
      : this.num = num > 0 ? num : 1,
        assert(offset != null);

  @override
  Widget build(BuildContext context) => Stack(
        children: List<Widget>.generate(
          num - 1,
          (val) => Positioned(
            bottom: val * offset,
            right: val * offset,
            top: (num - val - 1) * offset,
            left: (num - val - 1) * offset,
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Image.network(url),
                ),
              ),
            ),
          ),
        ).toList()
          ..add(
            Padding(
              padding: EdgeInsets.only(
                  bottom: (num - 1) * offset, right: (num - 1) * offset),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  url,
                ),
              ),
            ),
          ),
      );
}
