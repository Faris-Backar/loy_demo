import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyverse_demo/presentation/bloc/item_bloc.dart';
import 'package:loyverse_demo/presentation/screens/all_item_screen.dart';
import 'package:loyverse_demo/presentation/screens/create_item_screen.dart';
import 'package:loyverse_demo/presentation/screens/item_screen.dart';
import 'package:loyverse_demo/presentation/screens/landing_screen.dart';
import 'package:loyverse_demo/presentation/screens/login_screen.dart';
import 'package:loyverse_demo/presentation/screens/registration_screen.dart';
import 'package:loyverse_demo/presentation/screens/sales_screen.dart';
import 'package:loyverse_demo/presentation/screens/splash_screen.dart';

ValueNotifier<int> valueNotifier = ValueNotifier(0);
ValueNotifier<int> priceNotifier = ValueNotifier(0);
List checkListItems = [
  {
    "id": 1,
    "value": false,
    "title": "grey",
  },
  {
    "id": 2,
    "value": false,
    "title": "red",
  },
  {
    "id": 3,
    "value": false,
    "title": "pink",
  },
  {
    "id": 4,
    "value": false,
    "title": "amber",
  },
  {
    "id": 5,
    "value": false,
    "title": "lightGreen",
  },
  {
    "id": 6,
    "value": false,
    "title": "green",
  },
  {
    "id": 7,
    "value": false,
    "title": "blue",
  },
  {
    "id": 8,
    "value": false,
    "title": "Violet",
  },
];

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
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SplashScreen(),
        routes: {
          AllItemScreen.routeName: (ctx) => const AllItemScreen(),
          CreateItemScreen.routeName: (ctx) => const CreateItemScreen(),
          ItemScreen.routeName: (ctx) => const ItemScreen(),
          LandingScreen.routeName: (ctx) => const LandingScreen(),
          LogInScreen.routeName: (ctx) => const LogInScreen(),
          RegistrationScreen.routeName: (ctx) => const RegistrationScreen(),
          SalesScreen.routeName: (ctx) => const SalesScreen(),
          SplashScreen.routeName: (ctx) => const SplashScreen(),
        },
      ),
    );
  }
}
