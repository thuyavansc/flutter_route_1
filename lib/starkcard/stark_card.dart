import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: StarkCard(),
//   ));
// }

class StarkCard extends StatefulWidget {
  const StarkCard({super.key});

  @override
  State<StarkCard> createState() => _StarkCardState();
}

class _StarkCardState extends State<StarkCard> {
  int levelCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stark Card',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0.5,
      ),
      backgroundColor: Colors.lightGreen[100],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('res/assets/iron.jpg'),
                radius: 60,
              ),
            ),
            const Divider(
              height: 60,
              color: Colors.red,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              'Tony Stark',
              style: TextStyle(
                color: Colors.amber,
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            const Text(
              'Level',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              '$levelCount',
              style: const TextStyle(
                color: Colors.amber,
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            const Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.purple,
                  size: 35,
                ),
                SizedBox(width: 10,),
                Text(
                  'abcdef@gmail.com',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            levelCount++;
          });
          },
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
    );
  }
}
















