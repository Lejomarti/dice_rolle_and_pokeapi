import 'package:dice_rolle_and_pokeapi/View/screens/history_screen.dart';
import 'package:dice_rolle_and_pokeapi/View/screens/pokeapi_screen.dart';
import 'package:dice_rolle_and_pokeapi/ViewModel/dice_roller_viewmodel.dart';
import 'package:dice_rolle_and_pokeapi/ViewModel/history_viewmodel.dart';
import 'package:dice_rolle_and_pokeapi/ViewModel/pokeapi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/screens/dice_roller_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiceRollerViewModel()),
        ChangeNotifierProvider(create: (_) => HistoryViewModel()),
        ChangeNotifierProvider(create: (_) => PokeapiViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Navigator(),
        routes: {
          '/pokeapi': (context) => const PokeapiScreen(),
        },
      ),
    );
  }
}

class Navigator extends StatelessWidget {
  const Navigator({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Text("App title", style: TextStyle(color: Colors.white)),
          bottom: (TabBar(
            tabs: [
              Tab(
                text: "Dice Roller",
                icon: Icon(Icons.crop_square_rounded, color: Colors.white),
              ),
              Tab(
                text: "History",
                icon: Icon(Icons.history, color: Colors.white),
              ),
              Tab(
                text: "Poke API",
                icon: Icon(Icons.attribution_rounded, color: Colors.white),
              ),
            ],
          )),
        ),
        body: TabBarView(
          children: [DiceRollerScreen(), HistoryScreen(), PokeapiScreen()],
        ),
      ),
    );
  }
}
