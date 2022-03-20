import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deep_sea_adventure_game/cubits/game_cubit.dart';
import 'package:flutter_deep_sea_adventure_game/pages/game_page.dart';

// About the original board game: https://boardgamegeek.com/boardgame/169654/deep-sea-adventure

void main() async {
  // We need to call it manually, because we going to call setPreferredOrientations() before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // Than we set up preferred orientations, and only then we run our app
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deep Sea Adventure Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //todo: nice font!
      ),
      home: BlocProvider<GameCubit>(
          create: (context) => GameCubit(), child: GamePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
