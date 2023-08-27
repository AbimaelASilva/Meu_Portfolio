import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> get proRoutes => {
      '/': (context) => SizedBox.fromSize(),
      '/playerTemplate': (context) => SizedBox.fromSize(),
    };
