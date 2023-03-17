import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/app_route.dart';
import 'mondher_screen.dart';
import 'providers/onboarding.dart';
import 'providers/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const IwdApp(),
    ),
  );
}

class IwdApp extends ConsumerWidget {
  const IwdApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFirstTime = ref.watch(onboardingProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travigui',
      theme: ThemeData(
        fontFamily: 'sora',
        primarySwatch: Colors.purple,
        primaryColor: AppColor.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      routes: AppRoute.routes,

      home: const MondherScreen(),

      // home: isFirstTime
      //     ? const OnboardingScreen()
      //     : StreamBuilder(
      //         stream: auth.authStateChanges(),
      //         builder: (BuildContext context, AsyncSnapshot snapshot) {
      //           if (snapshot.connectionState == ConnectionState.active) {
      //             if (auth.currentUser != null) {
      //               return const Nav();
      //             }
      //             return const SignInScreen();
      //           }
      //           return const Scaffold(
      //             body: Center(
      //               child: CircularProgressIndicator(),
      //             ),
      //           );
      //         },
      //       ),
    );
  }
}
