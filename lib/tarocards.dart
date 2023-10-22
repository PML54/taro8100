import 'dart:math';

class TaroDist {
  static const int yesDistrib = 0;
  static const int notDistrib = 1;

  final int nbCarte;
  int powerCarte = 0;
  int nbFree = 0;
  int thatCarte = 0;
  List<int> gameCarte = [0, for (var i = 0; i < 80; i++) 1];
  List<int> tempGameCarte = [0, for (var i = 0; i < 80; i++) 1];

  TaroDist(this.nbCarte);

  int razRandomCard() {
    tempGameCarte.clear();
    for (var i = 0; i < 80; i++) gameCarte[i] = 1;
    nbFree = 0;
    return 0;
  }

  int getRandomCard() {
    int randomCarte = 0;
    tempGameCarte.clear();
    tempGameCarte.add(0); // 1st element is unused
    nbFree = 0;

    for (int i = 1; i < 79; i++) {
      if (gameCarte[i] == 1) {
        tempGameCarte.add(i);
        nbFree++;
      }
    }

    if (nbFree == 0) return 0;

    randomCarte = Random().nextInt(tempGameCarte.length - 1) + 1;
    randomCarte = tempGameCarte[randomCarte];

    gameCarte[randomCarte] = 0;
    return randomCarte;
  }
}

class TaroCard {
  final int numCarte;
  final int powerCarte;
  final int couleurCarte;
  final double valeurCarte;
  final int isTete;
  final int isBout;
  final int ecartPossible;
  final String imageCarte;

  TaroCard(
    this.numCarte,
    this.powerCarte,
    this.couleurCarte,
    this.valeurCarte,
    this.isTete,
    this.isBout,
    this.ecartPossible,
    this.imageCarte,
  );
}

final tarotCartes = [
  TaroCard(0, 22, 0, 5, 0, 1, 1, "TAROT00.jpeg"),
  TaroCard(1, 22, 0, 5, 0, 1, 1, "TAROT01.jpeg"),
  TaroCard(2, 21, 0, 5, 0, 1, 1, "TAROT02.jpeg"),
  TaroCard(3, 20, 0, 1, 0, 0, 1, "TAROT03.jpeg"),
  TaroCard(4, 19, 0, 1, 0, 0, 1, "TAROT04.jpeg"),
  TaroCard(5, 18, 0, 1, 0, 0, 1, "TAROT05.jpeg"),
  TaroCard(6, 17, 0, 1, 0, 0, 1, "TAROT06.jpeg"),
  TaroCard(7, 16, 0, 1, 0, 0, 1, "TAROT07.jpeg"),
  TaroCard(8, 15, 0, 1, 0, 0, 1, "TAROT08.jpeg"),
  TaroCard(9, 14, 0, 1, 0, 0, 1, "TAROT09.jpeg"),
  TaroCard(10, 13, 0, 1, 0, 0, 1, "TAROT010.jpeg"),
  TaroCard(11, 12, 0, 1, 0, 0, 1, "TAROT011.jpeg"),
  TaroCard(12, 11, 0, 1, 0, 0, 1, "TAROT012.jpeg"),
  TaroCard(13, 10, 0, 1, 0, 0, 1, "TAROT013.jpeg"),
  TaroCard(14, 9, 0, 1, 0, 0, 1, "TAROT014.jpeg"),
  TaroCard(15, 8, 0, 1, 0, 0, 1, "TAROT015.jpeg"),
  TaroCard(16, 7, 0, 1, 0, 0, 1, "TAROT016.jpeg"),
  TaroCard(17, 6, 0, 1, 0, 0, 1, "TAROT017.jpeg"),
  TaroCard(18, 5, 0, 1, 0, 0, 1, "TAROT018.jpeg"),
  TaroCard(19, 4, 0, 1, 0, 0, 1, "TAROT019.jpeg"),
  TaroCard(20, 3, 0, 1, 0, 0, 1, "TAROT020.jpeg"),
  TaroCard(21, 2, 0, 1, 0, 0, 1, "TAROT021.jpeg"),
  TaroCard(22, 1, 0, 5, 0, 1, 1, "TAROT022.jpeg"),
  TaroCard(23, 14, 1, 5, 1, 0, 1, "TAROT11.jpeg"),
  TaroCard(24, 13, 1, 4, 1, 0, 0, "TAROT12.jpeg"),
  TaroCard(25, 12, 1, 3, 1, 0, 0, "TAROT13.jpeg"),
  TaroCard(26, 11, 1, 2, 1, 0, 0, "TAROT14.jpeg"),
  TaroCard(27, 10, 1, 1, 0, 0, 0, "TAROT15.jpeg"),
  TaroCard(28, 9, 1, 1, 0, 0, 0, "TAROT16.jpeg"),
  TaroCard(29, 8, 1, 1, 0, 0, 0, "TAROT17.jpeg"),
  TaroCard(30, 7, 1, 1, 0, 0, 0, "TAROT18.jpeg"),
  TaroCard(31, 6, 1, 1, 0, 0, 0, "TAROT19.jpeg"),
  TaroCard(32, 5, 1, 1, 0, 0, 0, "TAROT110.jpeg"),
  TaroCard(33, 4, 1, 1, 0, 0, 0, "TAROT111.jpeg"),
  TaroCard(34, 3, 1, 1, 0, 0, 0, "TAROT112.jpeg"),
  TaroCard(35, 2, 1, 1, 0, 0, 0, "TAROT113.jpeg"),
  TaroCard(36, 1, 1, 1, 0, 0, 0, "TAROT114.jpeg"),
  TaroCard(37, 14, 2, 5, 1, 0, 1, "TAROT21.jpeg"),
  TaroCard(38, 13, 2, 4, 1, 0, 0, "TAROT22.jpeg"),
  TaroCard(39, 12, 2, 3, 1, 0, 0, "TAROT23.jpeg"),
  TaroCard(40, 11, 2, 2, 1, 0, 0, "TAROT24.jpeg"),
  TaroCard(41, 10, 2, 1, 0, 0, 0, "TAROT25.jpeg"),
  TaroCard(42, 9, 2, 1, 0, 0, 0, "TAROT26.jpeg"),
  TaroCard(43, 8, 2, 1, 0, 0, 0, "TAROT27.jpeg"),
  TaroCard(44, 7, 2, 1, 0, 0, 0, "TAROT28.jpeg"),
  TaroCard(45, 6, 2, 1, 0, 0, 0, "TAROT29.jpeg"),
  TaroCard(46, 5, 2, 1, 0, 0, 0, "TAROT210.jpeg"),
  TaroCard(47, 4, 2, 1, 0, 0, 0, "TAROT211.jpeg"),
  TaroCard(48, 3, 2, 1, 0, 0, 0, "TAROT212.jpeg"),
  TaroCard(49, 2, 2, 1, 0, 0, 0, "TAROT213.jpeg"),
  TaroCard(50, 1, 2, 1, 0, 0, 0, "TAROT214.jpeg"),
  TaroCard(51, 14, 3, 5, 1, 0, 1, "TAROT31.jpeg"),
  TaroCard(52, 13, 3, 4, 1, 0, 0, "TAROT32.jpeg"),
  TaroCard(53, 12, 3, 3, 1, 0, 0, "TAROT33.jpeg"),
  TaroCard(54, 11, 3, 2, 1, 0, 0, "TAROT34.jpeg"),
  TaroCard(55, 10, 3, 1, 0, 0, 0, "TAROT35.jpeg"),
  TaroCard(56, 9, 3, 1, 0, 0, 0, "TAROT36.jpeg"),
  TaroCard(57, 8, 3, 1, 0, 0, 0, "TAROT37.jpeg"),
  TaroCard(58, 7, 3, 1, 0, 0, 0, "TAROT38.jpeg"),
  TaroCard(59, 6, 3, 1, 0, 0, 0, "TAROT39.jpeg"),
  TaroCard(60, 5, 3, 1, 0, 0, 0, "TAROT310.jpeg"),
  TaroCard(61, 4, 3, 1, 0, 0, 0, "TAROT311.jpeg"),
  TaroCard(62, 3, 3, 1, 0, 0, 0, "TAROT312.jpeg"),
  TaroCard(63, 2, 3, 1, 0, 0, 0, "TAROT313.jpeg"),
  TaroCard(64, 1, 3, 1, 0, 0, 0, "TAROT314.jpeg"),
  TaroCard(65, 14, 4, 5, 1, 0, 1, "TAROT41.jpeg"),
  TaroCard(66, 13, 4, 4, 1, 0, 0, "TAROT42.jpeg"),
  TaroCard(67, 12, 4, 3, 1, 0, 0, "TAROT43.jpeg"),
  TaroCard(68, 11, 4, 2, 1, 0, 0, "TAROT44.jpeg"),
  TaroCard(69, 10, 4, 1, 0, 0, 0, "TAROT45.jpeg"),
  TaroCard(70, 9, 4, 1, 0, 0, 0, "TAROT46.jpeg"),
  TaroCard(71, 8, 4, 1, 0, 0, 0, "TAROT47.jpeg"),
  TaroCard(72, 7, 4, 1, 0, 0, 0, "TAROT48.jpeg"),
  TaroCard(73, 6, 4, 1, 0, 0, 0, "TAROT49.jpeg"),
  TaroCard(74, 5, 4, 1, 0, 0, 0, "TAROT410.jpeg"),
  TaroCard(75, 4, 4, 1, 0, 0, 0, "TAROT411.jpeg"),
  TaroCard(76, 3, 4, 1, 0, 0, 0, "TAROT412.jpeg"),
  TaroCard(77, 2, 4, 1, 0, 0, 0, "TAROT413.jpeg"),
  TaroCard(78, 1, 4, 1, 0, 0, 0, "TAROT414.jpeg"),
];
