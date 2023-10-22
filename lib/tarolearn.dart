import 'package:flutter/material.dart';
import 'dart:math';
import 'tarocards.dart';


class TaroLearn extends StatefulWidget {
  TaroLearn({Key? key}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  _TaroLearnState createState() => _TaroLearnState();
}

class _TaroLearnState extends State<TaroLearn> {
  int _counter = 0;
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  List<int> mainCarte = [0, for (var i = 0; i < 5; i++) 0];

  TaroDist ThisTaroDist = TaroDist(78);

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      int finDistrib = 0;
      //
      int r = ThisTaroDist.getRandomCard();
      mainCarte[1] = r;
      if (r == 0) finDistrib = 1;
      //
      r = ThisTaroDist.getRandomCard();
      mainCarte[2] = r;
      if (r == 0) finDistrib = 1;
      //
      r = ThisTaroDist.getRandomCard();
      mainCarte[3] = r;
      if (r == 0) finDistrib = 1;
      //
      r = ThisTaroDist.getRandomCard();
      mainCarte[4] = r;
      if (r == 0) finDistrib = 1;

      print(tarotCartes[mainCarte[1]].imageCarte);
      print(tarotCartes[mainCarte[2]].imageCarte);
      print(tarotCartes[mainCarte[3]].imageCarte);
      print(tarotCartes[mainCarte[4]].imageCarte);
      if (finDistrib == 1) ThisTaroDist.razRandomCard();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the TaroLearn object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: const Icon(Icons.perm_identity),
                tooltip: 'Boomer',
                iconSize: 40.0,
                color: Colors.redAccent,
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: const Icon(Icons.save),
              iconSize: 40.0,
              color: Colors.blue,
              tooltip: 'Save Results',
              onPressed: () {
                setState(() {});
              },
            ),
            //   Graphics************************
            IconButton(
                icon: const Icon(Icons.pie_chart),
                tooltip: '1,0',
                iconSize: 40.0,
                color: Colors.yellow,
                onPressed: () {}),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                // Numero 2 le Jeune ROuge
                icon: const Icon(Icons.arrow_forward),
                tooltip: 'Young',
                iconSize: 40.0,
                color: Colors.greenAccent,
                onPressed: () {
                  setState(() {
                    _incrementCounter();
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child:
        Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child:  ElevatedButton(
                    child:
                    Image.asset(
                      "tarot/${tarotCartes[mainCarte[1]].imageCarte}",
                    ),
                    onPressed: () {},
                  ),
                ),
                //Get students to create the second die as a challenge
                Expanded(
                  child:  ElevatedButton(
                    child: Image.asset(
                      "tarot/${tarotCartes[mainCarte[2]].imageCarte}",
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child:  ElevatedButton(
                    child: Image.asset(
                          "tarot/${tarotCartes[mainCarte[3]].imageCarte}",
                    ),
                    onPressed: () {
                      //changeDiceFace();
                    },
                  ),
                ),
                Expanded(
                  child:  ElevatedButton(
                    child: Image.asset(
                      "tarot/${tarotCartes[mainCarte[4]].imageCarte}",
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:  ElevatedButton(
                    child: Image.asset(
                      "tarot/${tarotCartes[mainCarte[1]].imageCarte}",
                    ),
                    onPressed: () {},
                  ),
                ),
                //Get students to create the second die as a challenge
                Expanded(
                  child:  ElevatedButton(
                    child: Image.asset(
                      "tarot/${tarotCartes[mainCarte[2]].imageCarte}",
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child:  ElevatedButton(
                    child: Image.asset(
                      "tarot/${tarotCartes[mainCarte[3]].imageCarte}",
                    ),
                    onPressed: () {
                      //changeDiceFace();
                    },
                  ),
                ),
                Expanded(
                  child:  ElevatedButton(
                    child: Image.asset(
                      "tarot/${tarotCartes[mainCarte[4]].imageCarte}",
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: _incrementCounter,
              child: Text(
                '1',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              )),
          ElevatedButton(
              onPressed: _incrementCounter,
              child: Text(
                '2',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 20),
              )),
          ElevatedButton(
              onPressed: _incrementCounter,
              child: Text(
                '3',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              )),
          ElevatedButton(
              onPressed: _incrementCounter,
              child: Text(
                '4',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 20),
              )),
          ElevatedButton(
              onPressed: _incrementCounter,
              child: Text(
                '5',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              )),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
