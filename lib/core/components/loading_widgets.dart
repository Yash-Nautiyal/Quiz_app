import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidgets extends StatefulWidget {
  final double size;
  const LoadingWidgets({super.key, required this.size});

  @override
  State<LoadingWidgets> createState() => _LoadingWidgetsState();
}

class _LoadingWidgetsState extends State<LoadingWidgets> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              color: Colors.blue,
            )
          : CupertinoActivityIndicator(
              color: Colors.blue,
            ),
    );
  }
}
