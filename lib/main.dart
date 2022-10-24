import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/data/db/services/pokemons_services.dart';
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
      child: Pokedex(),
    ),
  );
}

class Pokedex extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();
  Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    AppManagement appManagement = Provider.of<AppManagement>(context);
    initSnakbarListener(appManagement);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackbarKey,
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

  initSnakbarListener(AppManagement appManagement) {
    appManagement.connectivityStream.listen(
      (value) async {
        final bool isOffline =
            (appManagement.connectivityStream.value == ConnectivityResult.none);
        if (isOffline) {
          String msg = "";
          try {
            PokemonsServices.dbActions(isOffline, appManagement.pokemons);
          } catch (e) {
            msg = ", ${e.toString()}";
          }
          final snackBar = SnackBar(
            content: Text("Modo offline activado!$msg"),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          );
          snackbarKey.currentState?.showSnackBar(snackBar);
        }
        appManagement.isOffline = isOffline;
      },
    );
  }
}
