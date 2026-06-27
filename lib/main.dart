// main.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'services/app_provider.dart';
import 'utils/app_theme.dart';
import 'utils/app_constants.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const SmartJobApp(),
    ),
  );
}

class SmartJobApp extends StatelessWidget {
  const SmartJobApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuild the entire theme whenever accentColor changes in AppProvider.
    // This means switches, buttons, progress bars, FABs, focused borders —
    // everything that uses ColorScheme.primary — update automatically.
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        return MaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          // ← key change: build theme dynamically from the provider's accent
          theme: AppTheme.buildTheme(provider.accentColor),
          home: provider.isLoggedIn
              ? const HomeScreen()
              : const LoginScreen(),
        );
      },
    );
  }
}