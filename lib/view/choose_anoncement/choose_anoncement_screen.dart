import 'package:flutter/material.dart';

import '../../core/app_exension.dart';
import '../../core/app_route.dart';

class ChooseAnoncementScreen extends StatelessWidget {
  const ChooseAnoncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChooseAnoncementScreen'),
      ),
      body: Column(
        children: [
          const Text('ChooseAnoncementScreen'),
          ElevatedButton(
            onPressed: () => context.push(AppRoute.serviceForm),
            child: const Text('service'),
          ),
          ElevatedButton(
            onPressed: () => context.push(AppRoute.jobForm),
            child: const Text('job'),
          ),
        ],
      ),
    );
  }
}
