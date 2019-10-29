import 'dart:ui';

import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 100),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: SizedBox(
            height: 400,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  // color: Colors.red,
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //       'https://w.wallhaven.cc/full/13/wallhaven-13gom9.jpg'),
                  //   fit: BoxFit.cover,
                  // ),
                  ),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0x0A000000)),
                // decoration: BoxDecoration(color: Color(0x88FF0000)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Current index:',
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Page 3',
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
