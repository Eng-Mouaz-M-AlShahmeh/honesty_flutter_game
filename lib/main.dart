/* Developed by Eng Mouaz M AlShahmeh */
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'presentation/game_screen.dart';

void main() {
  if (kIsWeb) {
  } else {
    if (Platform.isAndroid) {
      Wakelock.enable();
    }
    if (Platform.isIOS) {
      Wakelock.enable();
    }
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Honesty Flutter Game',
      theme: ThemeData(useMaterial3: true),
      locale: const Locale('ar', 'SA'),
      supportedLocales: const [Locale('ar', 'SA')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const Game(),
    );
  }
}
