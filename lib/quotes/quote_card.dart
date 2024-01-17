import 'package:flutter/material.dart';
import 'package:project_8/quotes/quotes.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  const QuoteCard({super.key, required this.quote, required this.delete});
  // const QuoteCard({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              quote.text,
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              quote.author,
              style:const TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5,),
            TextButton.icon(
                onPressed: () {delete();},
                label:const Text('Delete Quote'),
                icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}