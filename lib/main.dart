import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyverse_demo/presentation/bloc/item_bloc.dart';
import 'package:loyverse_demo/presentation/screens/splash_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Loyverse());
}

class Loyverse extends StatelessWidget {
  const Loyverse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.grey[300],
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
