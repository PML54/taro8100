import 'package:tarotrois/tarozero.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ou
// void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Points au Tarot',
      theme: ThemeData(
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent, // Couleur d'arrière-plan du Tooltip
            borderRadius: BorderRadius.circular(4.0),
          ),
          textStyle: TextStyle(
            color: Colors.black, // Couleur du texte du Tooltip
            fontSize: 14.0,     // Taille du texte
           // fontWeight: FontWeight.bold, // Épaisseur du texte
          ),
        ),
      ),

      home: TaroZero(),
    );
  }
}

/*
MaterialApp(
  theme: ThemeData(
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.blue, // Couleur d'arrière-plan du Tooltip
        borderRadius: BorderRadius.circular(4.0),
      ),
      textStyle: TextStyle(
        color: Colors.white, // Couleur du texte du Tooltip
        fontSize: 16.0,     // Taille du texte
        fontWeight: FontWeight.bold, // Épaisseur du texte
      ),
    ),
  ),
 */
