import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'controllers/app_management.dart';
import 'pages/home_page.dart';
import 'pages/info_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        Provider<AppManagement>(create: (_) => AppManagement()),
      ],
      child: const Pokedex(),
    ),
  );
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    AppManagement appManagement = Provider.of<AppManagement>(context);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Cobranza App',
      routes: {
        '/home': (context) => HomePage(
              aMgnt: appManagement,
            ),
        '/info': (context) => const InfoPage(),
      },
      initialRoute: '/home',
    );
  }
}
