import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class InheritedWidgetRefreshcustom extends InheritedWidget {
  String? email;
  String? password;

  InheritedWidgetRefreshcustom({
    super.key,
    required super.child,
    this.email,
    this.password,
  });

  static InheritedWidgetRefreshcustom of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedWidgetRefreshcustom>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidgetRefreshcustom oldWidget) {
    return email != oldWidget.email;
  }
}
