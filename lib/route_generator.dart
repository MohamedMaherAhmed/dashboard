import 'package:dashboard/main.dart';
import 'package:dashboard/settings_ui.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case 'DashBoard':
        return MaterialPageRoute(builder: (_) => const DashBoard());
      case 'Settings':
        return MaterialPageRoute(builder: (_) => const Settings());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Invalid Route!!'),
        ),
      );
    });
  }
}
