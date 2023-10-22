import 'package:flutter/material.dart';

class TarotLexique {
  // Vocabulaire du Tarot
  int lalangue = 1;
  String petitBout = 'Petit au Bout';
  String simplePoigne = 'Poignée Simple';
  String doublePoigne = 'Poignée Double';
  String triplePoigne = 'Poignée Triple';
  String chelem = 'Chelem';
  String petite = 'Petite';
  String garde = 'Garde';
  String gardeSans = 'Sans';
  String gardeContre = 'Contre';

//
  String saveManche = 'Save Points';
  String plusDemi = '+ On ajoute  0.5 points';
  String copyScores = 'Copier/Coller les scores';
  String readScores = 'On regarde les Scores';
  String backManche = 'Retour à la donne';
  String exitPseudo = 'Fin des Pseudos';
  String setAnnonces = 'On declare  les Annonces';
  String exitAnnonce = 'Fin des Annonces';

  String lespseudos = "creation  de Pseudo";
  String calculsdespoints = "Calcul des Points";
  String fullreport = "Scores Additionnés";
  String detailedreport = "Score par Donne";
  String incresize = "Taille des Caractères";

  //
  String molettepreneur = "Qui a pris?";
  String molettecontrat = "Quel Contrat?";
  String molettebouts = "Combien de Bouts?";
  String molettepoints = "Points du Preneur?";
  String molettepartner = "Qui a été appelé";

  String namefirst = "Sud";
  String nameSecond = "Ouest";
  String namethird = "Nord";
  String namefourth = "Nord-E";
  String namefifth = "Est";
  String explainSuccess="a réussi une ";
  String explainFail="a plongé  une ";
  String vocabDe = " de " ;
  String vocabAvec= " avec " ;

  TarotLexique(int lalangue) {
    this.lalangue =
        lalangue; // Ici, nous affectons la valeur du paramètre lalangue au champ de classe lalangue
    setlangue(lalangue);
  }

  setlangue(lalangue) {
    this.lalangue = lalangue;
    if (lalangue == 1) {
      petitBout = 'Petit au Bout';
      simplePoigne = 'Poignée Simple';
      doublePoigne = 'Poignée Double';
      triplePoigne = 'Poignée Triple';
      chelem = 'Chelem';
      petite = 'Petite';
      garde = 'Garde';
      gardeSans = 'Sans';
      gardeContre = 'Contre';
      saveManche = 'Save Points';
      plusDemi = '+ On ajoute  0.5 points';
      copyScores = 'Copier/Coller les scores';
      readScores = 'On regarde les Scores';
      backManche = 'Retour à la donne';
      exitPseudo = 'Fin des Pseudos';
      setAnnonces = 'On declare  les Annonces';
      exitAnnonce = 'Fin des Annonces';
      lespseudos = "creation  de Pseudo";
      calculsdespoints = "Calcul des Points";
      fullreport = "Scores Additionnés";
      detailedreport = "Score par Donne";
      incresize = "Taille des Caractère";
      molettepreneur = "Qui a pris?";
      molettecontrat = "Quel Contrat?";
      molettebouts = "Combien de Bouts?";
      molettepoints = "Points du Preneur?";
      molettepartner = "Qui a été appelé";
      namefirst = "Sud";
      nameSecond = "Ouest";
      namethird = "Nord";
      namefourth = "Nord-E";
      namefifth = "Est";
      explainSuccess="a réussi une ";
      explainFail="a plongé  une ";
      vocabDe = " de " ;
      vocabAvec= " avec " ;

    } else {
      petitBout = 'Little One at the end';
      simplePoigne = 'Simple Hand';
      doublePoigne = 'Double Hand';
      triplePoigne = ' Triple Hand';
      chelem = 'Chelem';
      petite = 'Small';
      garde = 'Keep';
      gardeSans = 'Keep in';
      gardeContre = 'Keep Out ';
      saveManche = 'Save Points';
      plusDemi = '+ Add  0.5 points';
      copyScores = 'Copy/Paste  scores';
      readScores = 'Check Scores';
      backManche = 'Back ';
      exitPseudo = 'End Pseudos';
      setAnnonces = 'Declare';
      exitAnnonce = 'End Declare';
      lespseudos = "creation  de Pseudo";
      calculsdespoints = "Points computing";
      fullreport = "Summing Scores ";
      detailedreport = "Simple Score";
      incresize = "Size";
      molettepreneur = "Who takes?";
      molettecontrat = "Contract";
      molettebouts = "how many Bouts";
      molettepoints = "How many Points";
      molettepartner = "Called King";
      namefirst = "South";
      nameSecond = "West";
      namethird = "North";
      namefourth = "North-E";
      namefifth = "East";
      explainSuccess="succeeds some ";
      explainFail="fails some";
      vocabDe = " by " ;
      vocabAvec= " with " ;

    }
  }
}

TarotLexique lexique = TarotLexique(1);

List<String> contrats = [
  lexique.petite,
  lexique.garde,
  lexique.gardeSans,
  lexique.gardeContre,
];
List<String> contratsDoc = [
  lexique.petite,
  lexique.garde,
  lexique.gardeSans,
  lexique.gardeContre,
];

const int APPSTART = 0;
const List<int> bouPoints = [ptsZeroBout, ptsUnBout, ptsDeuxBout, ptsTroisBout];
//
const List<int> contraPoints = [
  gainPetite,
  gainGarde,
  gainGardeSans,
  gainGardeContre,
  0,
  0,
  0
];
const int DECLARATION = 3;
const gainGarde = 50;
const gainGardeContre = 150;
const gainGardeSans = 100;
//
const gainPetitauBout = 10;
//
const gainPetite = 25;
const int INCRPLUS = 4;
const ptsDeuxBout = 41;
const ptsTroisBout = 36;
const ptsUnBout = 51;
//
const ptsZeroBout = 56;
//
const int NBICOTASKS = 9;
const int READSCORES = 2;
const int SAVESCORES = 1;
const int SETPSEUDO = 5;
const int TURNMOLETTES = 6;
const int TYPERAPPORT = 7;
const int SETSIZE = 8;
List<String> alphabet1 = List.generate(26, (int index) {
  return String.fromCharCode('A'.codeUnitAt(0) + index);
});
List<String> alphabet2 = List.generate(26, (int index) {
  return String.fromCharCode('A'.codeUnitAt(0) + index);
});
List<String> alphabet3 = List.generate(26, (int index) {
  return String.fromCharCode('A'.codeUnitAt(0) + index);
})
  ..add('_');
List<String> bouts = [
  '0',
  '1',
  '2',
  '3',
];
List<String> boutsDoc = [
  '0',
  '1',
  '2',
  '3',
];

List<int> contratsMult = [1, 2, 4, 6];
List<CumulManche> lesCumulManche = [];
List<CumulManche> lesDetailedManche = [];

List<JoueurTarot> lesJoueurTarot = [
  JoueurTarot(0, lexique.namefirst),
  JoueurTarot(1, lexique.nameSecond),
  JoueurTarot(2, lexique.namethird),
  JoueurTarot(3, lexique.namefourth),
  JoueurTarot(4, lexique.namefifth),
];
List<JoueurTarot> lesJoueurTarot4 = [
  JoueurTarot(0, lexique.namefirst),
  JoueurTarot(1, lexique.nameSecond),
  JoueurTarot(2, lexique.namethird),
  JoueurTarot(3, lexique.namefifth),
];
List<JoueurTarot> lesJoueurTarot5 = [
  JoueurTarot(0, lexique.namefirst),
  JoueurTarot(1, lexique.nameSecond),
  JoueurTarot(2, lexique.namethird),
  JoueurTarot(3, lexique.namefourth),
  JoueurTarot(4, lexique.namefifth),
];

List<DonneTarot> lesMancheTarot = [];

List<String> names = lesJoueurTarot.map((joueur) => joueur.name).toList();

List<String> namesDoc = lesJoueurTarot.map((joueur) => joueur.name).toList();

List<String> namesPartners =
    lesJoueurTarot.map((joueur) => joueur.name).toList();

int nbTaroters = 5;

List<int> pointannonces = [0, 0, 0, 0, 0];

List<String> pointaro = List.generate(92, (index) => index.toString());
List<int> points = [0, 0, 0, 0, 0, 0, 0];

List<String> upColumn = [
  " ",
  lexique.molettepreneur,
  lexique.molettecontrat,
  lexique.molettebouts,
  lexique.molettepoints,
  lexique.molettepartner,
  "unused",
  "unused",
  "unused",
  "unused",
  "unused",
  "unused",
  "unused",
  "unused",
  "unused",
  "unused",
  "unused",
  "unused",
  "unused",
];

class CumulManche {
  int mancheid = 0;
  int prenerid = 0;
  int partnerid = 0;
  bool winner = false;
  List<int> points = [];

  CumulManche(
      this.mancheid, this.prenerid, this.partnerid, this.winner, this.points);
}

class IcoTask {
  int icotaskid = 0;
  bool flagrun = false; //  95 % on appuyé sur le bouton
  bool flagui = false;
  bool flagico = false;
  bool flagmodif = false; // Si OFF on ne modifie pas
  Icon iconon = Icon(Icons.list_alt_sharp);
  Icon iconoff = Icon(Icons.exit_to_app);
  String tooltipon = "";
  String tooltipoff = "";
  Color coloron = Colors.red;
  Color coloroff = Colors.black;

// lesIcoTask[ICOTASKname].flagrun ? Colors.red : Colors.black,
  IcoTask(
    this.icotaskid,
    this.flagrun, // On a appuyé sur l'icone
    this.flagui,
    this.flagico,
    this.flagmodif,
    this.iconon,
    this.iconoff,
    this.tooltipon,
    this.tooltipoff,
    this.coloron,
    this.coloroff,
  );

  void setFlagIco(bool value) {
    flagico = value;
  }

  void setFlagModif(bool value) {
    flagmodif = value;
  }

  // Méthode setter pour le flagrun
  void setFlagRun(bool value) {
    flagrun = value;
    if (flagrun) {
      this.flagui = true;
    } else
      this.flagui = false;
  }

  void setFlagUI(bool value) {
    flagui = value;
  }

  // Méthode setter pour le flagico
  void turnFlagIco() {
    flagico = !flagico;
  }

  // Méthode setter pour le flagmodif
  void turnFlagModif(bool value) {
    flagmodif = !flagmodif;
  }

  void turnFlagRun() {
    flagrun = !flagrun;
  }

  // Méthode setter pour le flagui
  void turnFlagUI() {
    flagui = !flagui;
  }
}

class JoueurTarot {
  int jid = 0;
  String defoname = "";
  String pseudo = "";
  String name = "";

  JoueurTarot(
    this.jid,
    this.defoname,
  ) {
    name = defoname;
  }
}

class DonneTarot {
  // Recap de la manche
  int mancheid = 0;
  int nbouts = 0;
  int prenerid = 0;
  int partnerid = 0;
  int contratid = 0;
  double faitedecombien = 0;
  int singlescore = 0; // Unité de gain
  int petitboutid = -1;
  int simplePoignid = -1;
  int doublePoignid = -1;
  int triplePoignid = -1;
  int chelemid = -1;

  DonneTarot(
    this.mancheid,
    this.nbouts,
    this.prenerid,
    this.partnerid,
    this.contratid,
    this.faitedecombien,
    this.singlescore, // Nombre de Points réalisés
    this.petitboutid,
    this.simplePoignid, //8
    this.doublePoignid, // 13
    this.triplePoignid, //15
    this.chelemid, //
  );
}

/*
La simple poignée est composée de 8 atouts et offre une prime de 20 points.
 double poignée, composée de 13 atouts offre une prime de 30 points.
 triple poignée, composée de 15 atouts, offre une prime de 40 points.
  La prime est gagnée par le vainqueur.
 */

class TaroGameCommon {
  static int thisGameCode = 0;
}

class TaroUiCommon {
  static int thisGameCode = 0;
  static int thisGameId = 0;
}
