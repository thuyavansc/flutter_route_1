import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('This is initState Function - Location - 1');
  }

  @override
  Widget build(BuildContext context) {
    print('This is Build Function - Location - 2');
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        title: const Text('Location Screen'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Text(
              'Choose Location Screen',
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Count : '),
                const SizedBox(width: 10,),
                Text('$count'),
              ],
            ),
            const SizedBox(height: 10,),
            TextButton.icon(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text('Add')),
          ],
        ),
      ),
    );
  }
}
