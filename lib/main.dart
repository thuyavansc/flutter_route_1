import 'package:flutter/material.dart';
import 'package:project_8/pages/choose_location.dart';
import 'package:project_8/pages/home.dart';
import 'package:project_8/pages/loading.dart';
import 'package:project_8/quotes/quote_list.dart';
import 'package:project_8/starkcard/stark_card.dart';


void main() {
  runApp(MaterialApp(
    //home: const Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
      '/quote' : (context) => const QuoteList(),
      '/stark' : (context) => const StarkCard(),
    },
  ));
}

