import 'package:flutter/material.dart';
import 'package:project_8/quotes/quote_card.dart';
import 'package:project_8/quotes/quotes.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: QuoteList(),
//   ));
// }

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  //Create a List
  // List<String> quotes = [
  //   '"I am Iron Man." - Tony Stark, Iron Man (2008)',
  //   '"Genius, billionaire, playboy, philanthropist." - Tony Stark, The Avengers (2012)',
  //   '"It\'s not about how much we lost, it\'s about how much we have left." - Tony Stark, Avengers: Endgame (2019)',
  //   '"Sometimes you gotta make a mess to clean things up." - Tony Stark, Iron Man 3 (2013)'
  // ];

  List<Quote> quotes = [
    Quote('I am Iron Man.', 'Tony Stark, Iron Man', 2008),
    Quote('Genius, billionaire, playboy, philanthropist.', 'Tony Stark, The Avengers', 2012),
    Quote('It\'s not about how much we lost, it\'s about how much we have left.', 'Tony Stark, Avengers: Endgame', 2019),
    Quote('Sometimes you gotta make a mess to clean things up.', 'Tony Stark, Iron Man 3', 2013),

    Quote('I hope they remember you.', 'Thanos, Avengers: Infinity War', 2018),
    Quote('Dread it. Run from it. Destiny arrives all the same.', 'Thanos, Avengers: Infinity War', 2018),
    Quote('I am inevitable.', 'Thanos, Avengers: Endgame', 2019),
    Quote('I am on a mission.', 'Ultron, Avengers: Age of Ultron', 2015),
    Quote('There are no strings on me.', 'Ultron, Avengers: Age of Ultron', 2015),
    Quote('The only matter I do not take seriously, boy, is you.', 'Thanos, Avengers: Infinity War', 2018),
    Quote('Fine. I\'ll do it myself.', 'Thanos, Avengers: Age of Ultron', 2015),
    Quote('Avengers, assemble.', 'Various, Avengers: Endgame', 2019),


    // Quote('I am Iron Man.', 'Tony Stark, Iron Man', 2008),
    // Quote('Genius, billionaire, playboy, philanthropist.', 'Tony Stark, The Avengers', 2012),
    // Quote('It\'s not about how much we lost, it\'s about how much we have left.', 'Tony Stark, Avengers: Endgame', 2019),
    // Quote('Sometimes you gotta make a mess to clean things up.', 'Tony Stark, Iron Man 3', 2013),
    // Quote('Genius, billionaire, playboy, philanthropist.', 'Tony Stark, The Avengers', 2012),
    // Quote('It\'s not about how much we lost, it\'s about how much we have left.', 'Tony Stark, Avengers: Endgame', 2019),
    // Quote('Sometimes you gotta make a mess to clean things up.', 'Tony Stark, Iron Man 3', 2013),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: const Text('Quotes'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: quotes.map((e) => QuoteCard(
                quote: e,
                delete: (){
                  setState(() {
                    quotes.remove(e);
                  });
                }
            )).toList(),
          ),
        ),
      ),
    );
  }
}



