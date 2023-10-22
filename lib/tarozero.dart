import 'package:flutter/material.dart';

import 'package:tarotrois/tarolearn.dart';

import 'package:tarotrois/tarozeropml.dart';
import 'package:tarotrois/tarocards.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';

class TaroZero extends StatefulWidget {
  const TaroZero({super.key});

  @override
  _TaroZeroState createState() => _TaroZeroState();
}

class _TaroZeroState extends State<TaroZero> {
  // Variables
  String numVersion = "22 Oct";
  double pointsDuPreneur = 51;
  double taroIconSize = 40;
  double faiteDeCombien = 0;
  int selectedPreneurIndex = 0;
  int selectedPartnerIndex = 0;
  int selectedPointaroIndex = 0;
  int selectedContratIndex = 0;
  int selectedBoutsIndex = 0;
  int selectedPetitboutid = -1;
  int selectedSimplePoignid = -1;
  int selectedDoublePoignid = -1;
  int selectedTriplePoignid = -1;
  int selectedChelemid = -1;
  int selectedPseudo1 = 0;
  int selectedPseudo2 = 0;
  int selectedPseudo3 = 0;
  int faiteDeCombienArrondi = 0;
  int globalthatcode = 0;
  int _selected = 0;
  int mancheId = 0;
  String newPseudo = "   ";
  bool flagSaveScoreUi = false;
  bool flagPseudoUi = false;
  bool flagReadScoresUi = false;
  bool flagAnnonceUi = false;
  bool flagMolette = false;
  bool flagPetitauBout = false;
  bool flagPoigneSimpleBis = false;
  bool flagPoigneDouble = false;
  bool flagPoigneTriple = false;
  bool flagPoigneSimpleTwo = false;
  String _texteDuPressePapiers = '';
  List<bool> quelTaroteur = [false, false, false, false, false, false];
  int taroteurActif = -1;
  List<bool> annoncesTaroteur = [false, false, false, false, false, false];
  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();
  double fontSizeMolette = 12;
  double fontSizeBarScore = 14;
  double fontSizeReportScore = 14;
  double fontSizeBarPseudo = 14;
  double fontSizeReportPseudo = 14;
  int coeffSizePolicy = 1;
  int langueTarot = 2;
  List<IcoTask> lesIcoTask = [
    IcoTask(
        APPSTART,
        // Cest le programme dentrée
        false,
        false,
        false,
        false,
        Icon(Icons.exit_to_app),
        Icon(Icons.exit_to_app),
        lexique.setAnnonces,
        lexique.setAnnonces,
        Colors.red,
        Colors.black),
    IcoTask(
        SAVESCORES,
        false,
        false,
        false,
        false,
        Icon(Icons.save),
        Icon(Icons.save),
        lexique.saveManche,
        lexique.backManche,
        Colors.red,
        Colors.black), // Save
    IcoTask(
        READSCORES,
        false,
        false,
        false,
        false,
        Icon(Icons.list_alt_sharp),
        Icon(Icons.list_alt_sharp),
        lexique.readScores,
        lexique.backManche,
        Colors.red,
        Colors.black), // read
    IcoTask(
        DECLARATION,
        false,
        false,
        false,
        false,
        Icon(Icons.record_voice_over),
        Icon(Icons.record_voice_over),
        lexique.setAnnonces,
        lexique.exitAnnonce,
        Colors.red,
        Colors.black),
    IcoTask(
        INCRPLUS,
        false,
        false,
        false,
        false,
        Icon(Icons.add),
        Icon(Icons.add),
        lexique.plusDemi,
        lexique.plusDemi,
        Colors.red,
        Colors.black),
    IcoTask(
        SETPSEUDO,
        false,
        false,
        false,
        false,
        Icon(Icons.person),
        Icon(Icons.person),
        lexique.lespseudos,
        lexique.lespseudos,
        Colors.red,
        Colors.black),
    IcoTask(
        TURNMOLETTES,
        false,
        true,
        false,
        false,
        Icon(Icons.settings_accessibility_outlined),
        Icon(Icons.settings_accessibility_outlined),
        lexique.calculsdespoints,
        lexique.calculsdespoints,
        Colors.red,
        Colors.black),
    IcoTask(
        TYPERAPPORT,
        true,
        true,
        true,
        false,
        Icon(Icons.search),
        Icon(Icons.search),
        lexique.detailedreport,
        lexique.fullreport,
        Colors.black,
        Colors.black),
    IcoTask(
        SETSIZE,
        true,
        true,
        true,
        true,
        Icon(Icons.format_size),
        Icon(Icons.format_size),
        lexique.incresize,
        lexique.incresize,
        Colors.black,
        Colors.black)
  ];

  @override
  Widget build(BuildContext context) {
    updateState();
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildAnnonce() {
    return Visibility(
        visible: !flagSaveScoreUi && flagAnnonceUi,
        child: Expanded(
          child: Row(
            children: [buildAnnonceQui(), buildAnnonceLaquelle()],
          ),
        ));
  }

  Widget buildAnnonceLaquelle() {
    final annonces = [
      lexique.petitBout,
      lexique.simplePoigne,
      lexique.doublePoigne,
      lexique.triplePoigne,
      lexique.chelem,
    ];
    return Expanded(
      child: Container(
        color: Colors.blueAccent,
        constraints: BoxConstraints(maxWidth: 180, maxHeight: 300),
        child: Column(
          children: List.generate(5, (index) {
            return CheckboxListTile(
              title: Text(annonces[index]),
              value: annoncesTaroteur[index],
              onChanged: (value) {
                if (checkValidAnnonces(index, taroteurActif, value!)) {
                  setState(() {
                    annoncesTaroteur[index] = !annoncesTaroteur[index];
                    if (index == 0) {
                      selectedPetitboutid = -1;
                      if (annoncesTaroteur[0]) {
                        selectedPetitboutid = taroteurActif;
                      }
                    }
                    if (index == 1) {
                      selectedSimplePoignid = -1;
                      if (annoncesTaroteur[1]) {
                        selectedSimplePoignid = taroteurActif;
                      }
                    }
                    if (index == 2) {
                      selectedDoublePoignid = -1;
                      if (annoncesTaroteur[2]) {
                        selectedDoublePoignid = taroteurActif;
                      }
                    }
                    if (index == 3) {
                      selectedTriplePoignid = -1;
                      if (annoncesTaroteur[3]) {
                        selectedTriplePoignid = taroteurActif;
                      }
                    }

                    calcPointsLive(
                        nbTaroters,
                        pointsDuPreneur,
                        selectedContratIndex,
                        selectedPreneurIndex,
                        selectedPartnerIndex,
                        selectedPetitboutid,
                        selectedSimplePoignid,
                        selectedDoublePoignid,
                        selectedTriplePoignid);
                  });
                }
              },
            );
          }),
        ),
      ),
    );
  }

  Widget buildAnnonceQui() {
    return Expanded(
      child: Container(
        color: Colors.grey,
        constraints: BoxConstraints(maxWidth: 180, maxHeight: 300),
        child: Column(
          children: List.generate(nbTaroters, (index) {
            return CheckboxListTile(
              title: Text(lesJoueurTarot[index].name),
              value: quelTaroteur[index],
              onChanged: (value) {
                setState(() {
                  quelTaroteur[index] = !quelTaroteur[index];
                  if (quelTaroteur[index]) resetOthersTaroteurs(index);
                  if (!quelTaroteur[index]) {
                    resetThisTaroteur(index);
                  }
                });
              },
            );
          }),
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: Visibility(
        visible: !flagSaveScoreUi && !flagReadScoresUi,
        child: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          actions: List.generate(nbTaroters, (index) {
            return buildBar(
              lesJoueurTarot[index].name,
              points[index],
              lesJoueurTarot[index].jid,
            );
          }),
        ),
      ),
    );
  }

  Expanded buildBar(String playerName, int playerPoints, int cejid) {
    return Expanded(
      child: Container(
        color: playerPoints >= 0 ? Colors.green : Colors.red,
        child: Column(
          children: <Widget>[
            buildBarPseudo(playerName, playerPoints, cejid),
            buildBarScore(playerName, playerPoints, cejid),
          ],
        ),
      ),
    );
  }

  Widget buildBarPseudo(String buttonText, int thatcode, int thatid) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          newPseudo = lesJoueurTarot[thatid].name;
          globalthatcode = thatid;

          setPseudo(thatid);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: thatcode >= 0 ? Colors.green : Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          textStyle: TextStyle(
            fontSize: fontSizeBarPseudo,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }

  Widget buildBarScore(String buttonText, int thatcode, int thatid) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {});
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: thatcode >= 0 ? Colors.green : Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          textStyle: TextStyle(
            fontSize: fontSizeBarScore,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(thatcode.toString()),
      ),
    );
  }

  Widget buildBody() {
    return Center(
      child: Row(
        children: [
          Visibility(
            visible: flagMolette,
            child: buildMolette(names, 1, lexique.molettepreneur),
          ),
          Visibility(
            visible: flagMolette,
            child: buildMolette(contrats, 2, lexique.molettecontrat),
          ),
          Visibility(
            visible: flagMolette,
            child: buildMolette(bouts, 3, lexique.molettebouts),
          ),
          Visibility(
            visible: flagMolette,
            child: buildMolette(pointaro, 4, lexique.molettepoints),
          ),
          Visibility(
            visible: flagMolette,
            child: buildMolette(namesPartners, 5, lexique.molettepartner),
          ),
/*          Visibility(
              visible: flagPseudoUi,
              child: buildMolette(alphabet1, 11, upColumn[11])),
          Visibility(
              visible: flagPseudoUi,
              child: buildMolette(alphabet2, 12, upColumn[12])),
          Visibility(
              visible: flagPseudoUi,
              child: buildMolette(alphabet3, 13, upColumn[13])),*/
          Visibility(
              visible: (flagSaveScoreUi || flagReadScoresUi) && !flagPseudoUi,
              child: buildReportFull()),
          Visibility(
              visible: !flagSaveScoreUi && !flagPseudoUi && flagAnnonceUi,
              child: buildAnnonce()),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Visibility(
          visible:
              lesIcoTask[APPSTART].flagrun && lesIcoTask[TURNMOLETTES].flagico,
          child: buildIcoTask(TURNMOLETTES)),
      Visibility(
        visible: lesIcoTask[APPSTART].flagrun && lesIcoTask[SAVESCORES].flagico,
        child: buildIcoTask(SAVESCORES),
      ),
      Visibility(
        visible: lesIcoTask[APPSTART].flagrun &&
            lesIcoTask[READSCORES].flagico, // toujours visible
        child: buildIcoTask(READSCORES),
      ),
      Visibility(
        visible: lesIcoTask[APPSTART].flagrun && lesIcoTask[INCRPLUS].flagico,
        child: buildIcoTask(INCRPLUS),
      ),
      Visibility(
        visible: lesIcoTask[APPSTART].flagrun && lesIcoTask[SETPSEUDO].flagico,
        child: buildIcoTask(SETPSEUDO),
      ),
      Visibility(
        visible:
            lesIcoTask[APPSTART].flagrun && lesIcoTask[DECLARATION].flagico,
        child: buildIcoTask(DECLARATION),
      ),
      Visibility(
        visible:
            lesIcoTask[APPSTART].flagrun && lesIcoTask[TYPERAPPORT].flagico,
        child: buildIcoTask(TYPERAPPORT),
      ),
      Visibility(
        visible: lesIcoTask[SETSIZE].flagico,
        child: buildIcoTask(SETSIZE),
      ),
      Visibility(
          visible: flagSaveScoreUi && flagPseudoUi, child: Text(newPseudo)),
      //"Version du 17 Octobre ";

      Visibility(
      visible: !lesIcoTask[APPSTART].flagrun, child: Text(numVersion)),

      Visibility(
        visible: true,
        child: IconButton(
          icon: const Icon(Icons.language),
          color: Colors.red,
          iconSize: 40.0,
          tooltip: 'French/Scottish/',
          onPressed: () {
            changeLanguage();
          },
        ),
      ),
      Visibility(
        visible: false,
        child: IconButton(
          icon: const Icon(Icons.games),
          color: Colors.red,
          iconSize: 40.0,
          tooltip: 'Lock Memes',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaroLearn(),
                settings: RouteSettings(
                  // arguments: myPerso,
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }

/*
onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(),
                      settings: RouteSettings(
                        arguments: myPerso,
                      ),
                    ),
                  );
                },


 */
  Widget buildIcoTask(int ICOTASKname) {
    return IconButton(
      icon: lesIcoTask[ICOTASKname].flagrun
          ? lesIcoTask[ICOTASKname].iconoff
          : lesIcoTask[ICOTASKname].iconon,
      iconSize: taroIconSize,
      color: lesIcoTask[ICOTASKname].flagrun
          ? lesIcoTask[ICOTASKname].coloron
          : lesIcoTask[ICOTASKname].coloroff,
      tooltip: lesIcoTask[ICOTASKname].flagrun
          ? lesIcoTask[ICOTASKname].tooltipoff
          : lesIcoTask[ICOTASKname].tooltipon,
      onPressed: () {
        pressICOSTASK(ICOTASKname);
      },
    );
  }

  Widget buildListItem(List<String> thatList, int index, int cecodetable) {
    final name = thatList[index % thatList.length];
    bool isSelected = index % thatList.length == _selected;
    if (cecodetable == 1) {
      isSelected = index % thatList.length == selectedPreneurIndex;
    }
    if (cecodetable == 2) {
      isSelected = index % thatList.length == selectedContratIndex;
    }
    if (cecodetable == 3) {
      isSelected = index % thatList.length == selectedBoutsIndex;
    }
    if (cecodetable == 4) {
      isSelected = index % thatList.length == selectedPointaroIndex;
    }
    if (cecodetable == 5) {
      isSelected = index % thatList.length == selectedPartnerIndex;
    }
    if (cecodetable == 11) {
      isSelected = index % thatList.length == selectedPseudo1;
    }
    if (cecodetable == 12) {
      isSelected = index % thatList.length == selectedPseudo2;
    }
    if (cecodetable == 13) {
      isSelected = index % thatList.length == selectedPseudo3;
    }

    return Center(
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(width: 5.0, color: Colors.black),
          color: isSelected ? Colors.blue : Colors.transparent,
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: fontSizeMolette,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildMolette(List<String> thatList, int cecodetable, String titros) {
    return Expanded(
      child: SizedBox(
        height: 280.0, // Hauteur totale du ListWheelScrollView

        child: Tooltip(
          // message: langueTarot==1 ? lexique.molettepartner : lexique.molettebouts,
          message: upColumn[cecodetable],
          child: ListWheelScrollView(
            itemExtent: 40,
            onSelectedItemChanged: (int index) {
              handleSelectedItemChange(index, thatList, cecodetable);
            },
            physics: const BouncingScrollPhysics(),
            controller: FixedExtentScrollController(initialItem: 0),
            children: List<Widget>.generate(thatList.length, (int index) {
              return buildListItem(thatList, index, cecodetable);
            }),
          ),
        ),
      ),
    );
  }

  Widget buildReportFull() {
    return Expanded(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Row(
              children: List.generate(nbTaroters, (index) {
                return buildReportPseudo(lesJoueurTarot[index].name, index);
              }),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lesCumulManche.length,
              itemBuilder: (context, index) {
                final manche = lesCumulManche[index];
                return ListTile(
                  title: Row(
                    children: List.generate(nbTaroters, (playerIndex) {
                      Color color;
                      if (manche.prenerid == playerIndex && manche.winner) {
                        color = Colors.green;
                      } else if (manche.prenerid == playerIndex &&
                          !manche.winner) {
                        color = Colors.red;
                      } else {
                        color = Colors.white;
                      }
                      return Expanded(
                        child: buildReportScore(
                            manche.points[playerIndex].toString(),
                            playerIndex,
                            manche.prenerid,
                            manche.winner,
                            manche.mancheid),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildReportPseudo(String buttonText, int thatcode) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          newPseudo = lesJoueurTarot[thatcode].name;

          globalthatcode = thatcode;
          setPseudo(thatcode); // Passez thatCode à la fonction onPressed
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          textStyle: TextStyle(
            fontSize: fontSizeReportPseudo,
            color: Colors.blueAccent,
            backgroundColor: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }

  Widget buildReportScore(
      String buttonText, int cod, int pren, bool gagne, int thismanche) {
    // 0,manche.prenerid,manche.winner ,
    bool thatCond1 = (cod == pren && gagne);
    bool thatCond2 = (cod == pren && !gagne);
    Color mycolori;

    if (thatCond1) {
      mycolori = Colors.green;
    } else if (thatCond2) {
      mycolori = Colors.red;
    } else {
      mycolori = Colors.grey;
    }

    return Tooltip(
      message: calcMessageRapport(thismanche, cod),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: mycolori,
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          textStyle: TextStyle(
            fontSize: fontSizeReportScore,
            // color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }

  String bricoleTooltip(cemessage) {
    print("cemessage === " + cemessage);
    return (cemessage);
  }

  String calcMessageRapport(int thismanche, int codjoueur) {
    String _verbe = "";
    String infoannonce = "";
    if (lesMancheTarot[thismanche].singlescore >= 0) {
      _verbe = lexique.explainSuccess;
    } else {
      _verbe = lexique.explainFail;
    }
    String infosManche =
        lesJoueurTarot[lesMancheTarot[thismanche].prenerid].name + _verbe;

    infosManche =
        infosManche + " " + contrats[lesMancheTarot[thismanche].contratid];

    infosManche = infosManche +
        " "+ lexique.vocabDe+ " " +
        lesMancheTarot[thismanche].faitedecombien.toString() +
            " "+ lexique.vocabAvec  + " " +
        lesMancheTarot[thismanche].nbouts.toString() +
        ' bouts';
    if (codjoueur == lesMancheTarot[thismanche].petitboutid) {
      infoannonce = infoannonce + " "+lexique.petitBout;
    }
    if (codjoueur == lesMancheTarot[thismanche].prenerid) {
      return (infosManche + infoannonce);
    } else
      return (infoannonce);
  }

  int calcPetitauBout(int _selectedPetitboutid, int _selectedContratIndex,
      _selectedPreneurIndex, _selectedPartnerIndex) {
    bool _lespreneurs = false;
    if (_selectedPetitboutid == -1) return (0); // Pas de petit au bout
    //on retourne le nombre de points à ajouter
    for (int i = 0; i < nbTaroters; i++) {
      if ((i == _selectedPetitboutid) &&
          ((i == _selectedPreneurIndex) || (i == _selectedPartnerIndex))) {
        _lespreneurs = true;
      }
    }
    if (_lespreneurs) {
      return gainPetitauBout;
    } else {
      return -gainPetitauBout;
    }
  }

  calcPoigne(
      // AIguillage vers le nombre de taroters
      int _nbtaroters,
      int _quellePoigne,
      int _selectedPoignid,
      _selectedPreneurIndex,
      _selectedPartnerIndex,
      double _faiteDeCombien) {
    if (_selectedPoignid == -1) return;
    switch (_nbtaroters) {
      case 3:
        break;
      case 4:
        break;
      case 5:
        calcPoigne5(_quellePoigne, _selectedPoignid, _selectedPreneurIndex,
            _selectedPartnerIndex, _faiteDeCombien);
        break;
      default:
        break;
    }
  }

  calcPoigne5(
      int _quellePoigne,
      int _selectedPoignid,
      int _selectedPreneurIndex,
      int _selectedPartnerIndex,
      double _faiteDeCombien) {
    int ecot = 0;
    switch (_quellePoigne) {
      case 1:
        ecot = 20;
        break;

      case 2:
        ecot = 30;
        break;
      case 3:
        ecot = 40;
        break;
      default:
        break;
    }

    int lesigne = 1;
    if (_faiteDeCombien < 0) lesigne = -1;

    for (int i = 0; i < nbTaroters; i++) {
      pointannonces[i] = 0;
    }
//
    bool dejaVu = false;
    if (((_selectedPreneurIndex == _selectedPoignid) ||
            (_selectedPartnerIndex == _selectedPoignid)) &&
        (_selectedPreneurIndex != _selectedPartnerIndex)) {
      pointannonces[_selectedPreneurIndex] = lesigne * ecot * 2;
      pointannonces[_selectedPartnerIndex] = lesigne * ecot;

      for (int i = 0; i < nbTaroters; i++) {
        if ((i != _selectedPreneurIndex) && (i != _selectedPartnerIndex)) {
          pointannonces[i] = -ecot * lesigne;
        }
      }

      dejaVu = true;
    }
    if (!dejaVu) {
      if ((_selectedPreneurIndex == _selectedPoignid) &&
          (_selectedPreneurIndex == _selectedPartnerIndex)) {
        pointannonces[_selectedPreneurIndex] = lesigne * ecot * 4;
        //   pointannonces[_selectedPartnerIndex] = lesigne * ecot;
        for (int i = 0; i < nbTaroters; i++) {
          if ((i != _selectedPreneurIndex) && (i != _selectedPartnerIndex)) {
            pointannonces[i] = -ecot * lesigne;
          }
        }
        dejaVu = true;
      }
    }
    if (!dejaVu) {
      if ((_selectedPreneurIndex != _selectedPoignid) &&
          (_selectedPartnerIndex != _selectedPoignid) &&
          (_selectedPreneurIndex != _selectedPartnerIndex)) {
        pointannonces[_selectedPreneurIndex] = lesigne * ecot * -2;
        pointannonces[_selectedPartnerIndex] = lesigne * ecot * -1;

        for (int i = 0; i < nbTaroters; i++) {
          if ((i != _selectedPreneurIndex) && (i != _selectedPartnerIndex)) {
            pointannonces[i] = ecot * lesigne;
          }
        }
        dejaVu = true;
      }
    }
    if (!dejaVu) {
      if ((_selectedPreneurIndex != _selectedPoignid) &&
          (_selectedPreneurIndex == _selectedPartnerIndex)) {
        pointannonces[_selectedPreneurIndex] = lesigne * ecot * 4;

        for (int i = 0; i < nbTaroters; i++) {
          if ((i != _selectedPreneurIndex) && (i != _selectedPartnerIndex)) {
            pointannonces[i] = lesigne * ecot * -1;
          }
        }
        dejaVu = true;
      }
    }
  }

  int calcPointsLive(
      int nbTaroters,
      double pointsDuPreneur,
      int selectedContratIndex,
      int selectedPreneurIndex,
      int selectedPartnerIndex,
      int selectedPetitboutid,
      int selectedSimplePoignid,
      int selectedDoublePoignid,
      int selectedTriplePoignid) {
    switch (nbTaroters) {
      case 5:
        if (!lesIcoTask[APPSTART].flagrun) {
          return (0); // Pas de calcul n c'est pas commencé
        }
        calcPointsLive5(
            pointsDuPreneur,
            selectedContratIndex,
            selectedPreneurIndex,
            selectedPartnerIndex,
            selectedPetitboutid,
            selectedSimplePoignid,
            selectedDoublePoignid,
            selectedTriplePoignid);
        break;
    }
    return (0);
  }

  int calcPointsLive5(
      double pointsDuPreneur,
      int selectedContratIndex,
      int selectedPreneurIndex,
      int selectedPartnerIndex,
      int selectedPetitboutid,
      int selectedSimplePoignid,
      int selectedDoublePoignid,
      int selectedTriplePoignid) {
    faiteDeCombienArrondi = 0;
    int plonge = 1;

    setState(() {
      faiteDeCombien = 0; // Peut etre un decimal
      faiteDeCombien = pointsDuPreneur - bouPoints[selectedBoutsIndex];
      if (faiteDeCombien < 0) {
        plonge = -1;
        faiteDeCombienArrondi = (faiteDeCombien.abs()).ceil() * -1;
      } else {
        faiteDeCombienArrondi = faiteDeCombien.ceil();
      }
      faiteDeCombienArrondi = ((faiteDeCombienArrondi + 25 * plonge) *
          contratsMult[selectedContratIndex]);
      faiteDeCombienArrondi = faiteDeCombienArrondi +
          calcPetitauBout(selectedPetitboutid, selectedContratIndex,
                  selectedPreneurIndex, selectedPartnerIndex) *
              contratsMult[selectedContratIndex];

      razPoints();
// Points de l 'equipe adverse
      for (int i = 0; i < nbTaroters; i++) {
        if (i != selectedPreneurIndex && i != selectedPartnerIndex) {
          points[i] = -faiteDeCombienArrondi.toInt();
        }
      }
// Points du Preneur et Parner
      for (int i = 0; i < nbTaroters; i++) {
        if (i == selectedPreneurIndex) {
          points[i] = points[i] + 2 * faiteDeCombienArrondi.toInt();
        }
        if (i == selectedPartnerIndex &&
            selectedPartnerIndex != selectedPreneurIndex) {
          points[i] = points[i] + faiteDeCombienArrondi.toInt();
        }
        if (i == selectedPartnerIndex &&
            selectedPartnerIndex == selectedPreneurIndex) {
          points[i] = points[i] + 2 * faiteDeCombienArrondi.toInt();
        }
      }
      //   Points des Poignées
      calcPoigne(nbTaroters, 1, selectedSimplePoignid, selectedPreneurIndex,
          selectedPartnerIndex, faiteDeCombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];

        pointannonces[i] = 0;
      }
      calcPoigne(nbTaroters, 2, selectedDoublePoignid, selectedPreneurIndex,
          selectedPartnerIndex, faiteDeCombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];

        pointannonces[i] = 0;
      }
      calcPoigne(nbTaroters, 3, selectedTriplePoignid, selectedPreneurIndex,
          selectedPartnerIndex, faiteDeCombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];

        pointannonces[i] = 0;
      }
    });

    return (0);
  }

  int calcPointsLive5good() {
    faiteDeCombienArrondi = 0;
    int plonge = 1;

    setState(() {
      faiteDeCombien = 0; // Peut etre un decimal
      faiteDeCombien = pointsDuPreneur - bouPoints[selectedBoutsIndex];
      if (faiteDeCombien < 0) {
        plonge = -1;
        faiteDeCombienArrondi = (faiteDeCombien.abs()).ceil() * -1;
      } else {
        faiteDeCombienArrondi = faiteDeCombien.ceil();
      }
      faiteDeCombienArrondi = ((faiteDeCombienArrondi + 25 * plonge) *
          contratsMult[selectedContratIndex]);
      faiteDeCombienArrondi = faiteDeCombienArrondi +
          calcPetitauBout(selectedPetitboutid, selectedContratIndex,
                  selectedPreneurIndex, selectedPartnerIndex) *
              contratsMult[selectedContratIndex];

      razPoints();
// Points de l 'equipe adverse
      for (int i = 0; i < nbTaroters; i++) {
        if (i != selectedPreneurIndex && i != selectedPartnerIndex) {
          points[i] = -faiteDeCombienArrondi.toInt();
        }
      }
// Points du Preneur et Parner
      for (int i = 0; i < nbTaroters; i++) {
        if (i == selectedPreneurIndex) {
          points[i] = points[i] + 2 * faiteDeCombienArrondi.toInt();
        }
        if (i == selectedPartnerIndex &&
            selectedPartnerIndex != selectedPreneurIndex) {
          points[i] = points[i] + faiteDeCombienArrondi.toInt();
        }
        if (i == selectedPartnerIndex &&
            selectedPartnerIndex == selectedPreneurIndex) {
          points[i] = points[i] + 2 * faiteDeCombienArrondi.toInt();
        }
      }
      //   Points des Poignées
      calcPoigne(nbTaroters, 1, selectedSimplePoignid, selectedPreneurIndex,
          selectedPartnerIndex, faiteDeCombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];

        pointannonces[i] = 0;
      }
      calcPoigne(nbTaroters, 2, selectedDoublePoignid, selectedPreneurIndex,
          selectedPartnerIndex, faiteDeCombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];

        pointannonces[i] = 0;
      }
      calcPoigne(nbTaroters, 3, selectedTriplePoignid, selectedPreneurIndex,
          selectedPartnerIndex, faiteDeCombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];

        pointannonces[i] = 0;
      }
    });

    return (0);
  }

  bool checkValidAnnonces(int quelannonce, int queljoueur, bool lacoche) {
// Verifier Incompatibilité d'annonces
    print("quelannonce = " +
        quelannonce.toString() +
        " queljoueur" +
        queljoueur.toString() +
        " lacoche " +
        lacoche.toString());

    if (quelannonce > 0 && quelannonce < 4 && lacoche) {
      switch (quelannonce) {
        case 1:
          if (selectedTriplePoignid >= 0) return false;

          break;
        case 2:
          if (selectedTriplePoignid >= 0) return false;
          break;
        case 3:
          if (selectedSimplePoignid >= 0 || selectedDoublePoignid >= 0)
            return false;
          break;
      }
      return true;
    }

    return (true);
  }

  int copyInfos() {
    String copieColler = "";
    Clipboard.setData(ClipboardData(text: copieColler));
    return (0);
  }

  void handleSelectedItemChange(
      int index, List<String> thatList, int cecodetable) {
    if (!lesIcoTask[APPSTART].flagrun) {
      lesIcoTask[APPSTART].setFlagRun(true);
      // resetTables();
    }
    setState(() {
      if (cecodetable == 1) {
        selectedPreneurIndex = index % thatList.length;
        _selected = selectedPreneurIndex;
      }
      if (cecodetable == 2) {
        selectedContratIndex = index % thatList.length;
        _selected = selectedContratIndex;
      }
      if (cecodetable == 3) {
        selectedBoutsIndex = index % thatList.length;
        _selected = selectedBoutsIndex;
      }
      if (cecodetable == 4) {
        selectedPointaroIndex = index % pointaro.length;
        pointsDuPreneur = selectedPointaroIndex.toDouble();
        _selected = selectedPointaroIndex;
      }
      if (cecodetable == 5) {
        selectedPartnerIndex = index % thatList.length;
        _selected = selectedPartnerIndex;
      }
      if (cecodetable <= 5) {
        calcPointsLive(
            nbTaroters,
            pointsDuPreneur,
            selectedContratIndex,
            selectedPreneurIndex,
            selectedPartnerIndex,
            selectedPetitboutid,
            selectedSimplePoignid,
            selectedDoublePoignid,
            selectedTriplePoignid);
      }
      if (cecodetable == 11) {
        selectedPseudo1 = index % thatList.length;
        _selected = selectedPseudo1;
        newPseudo = replaceIthChar(newPseudo, 0, alphabet1[selectedPseudo1]);
      }
      if (cecodetable == 12) {
        selectedPseudo2 = index % thatList.length;

        _selected = selectedPseudo2;
        newPseudo = replaceIthChar(newPseudo, 1, alphabet2[selectedPseudo2]);
      }
      if (cecodetable == 13) {
        selectedPseudo3 = index % thatList.length;

        _selected = selectedPseudo3;
        newPseudo = replaceIthChar(newPseudo, 2, alphabet3[selectedPseudo3]);
      }
    });
  }

  void incrSizePolicy() {
    setState(() {
      coeffSizePolicy++;
      if (coeffSizePolicy > 3) coeffSizePolicy = 0;
      fontSizeMolette = 12 * (1 + coeffSizePolicy / 10);
      fontSizeBarScore = 14 * (1 + coeffSizePolicy / 10);
      fontSizeReportScore = 14 * (1 + coeffSizePolicy / 10);
      fontSizeBarPseudo = 14 * (1 + coeffSizePolicy / 10);
      fontSizeReportPseudo = 14 * (1 + coeffSizePolicy / 10);

      });
    }

void changeLanguage(){
  setState(() {


    lexique.setlangue(langueTarot);
    langueTarot++;
    if (langueTarot == 3) langueTarot = 1;
    setState(() {
      upColumn.clear();
      upColumn = [
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
      lesIcoTask.clear();
      // et/ou
      lesIcoTask = [
        IcoTask(
            APPSTART,
            // Cest le programme dentrée
            false,
            false,
            false,
            false,
            Icon(Icons.exit_to_app),
            Icon(Icons.exit_to_app),
            lexique.setAnnonces,
            lexique.setAnnonces,
            Colors.red,
            Colors.black),
        IcoTask(
            SAVESCORES,
            false,
            false,
            false,
            false,
            Icon(Icons.save),
            Icon(Icons.save),
            lexique.saveManche,
            lexique.backManche,
            Colors.red,
            Colors.black), // Save
        IcoTask(
            READSCORES,
            false,
            false,
            false,
            false,
            Icon(Icons.list_alt_sharp),
            Icon(Icons.list_alt_sharp),
            lexique.readScores,
            lexique.backManche,
            Colors.red,
            Colors.black), // read
        IcoTask(
            DECLARATION,
            false,
            false,
            false,
            false,
            Icon(Icons.record_voice_over),
            Icon(Icons.record_voice_over),
            lexique.setAnnonces,
            lexique.exitAnnonce,
            Colors.red,
            Colors.black),
        IcoTask(
            INCRPLUS,
            false,
            false,
            false,
            false,
            Icon(Icons.add),
            Icon(Icons.add),
            lexique.plusDemi,
            lexique.plusDemi,
            Colors.red,
            Colors.black),
        IcoTask(
            SETPSEUDO,
            false,
            false,
            false,
            false,
            Icon(Icons.person),
            Icon(Icons.person),
            lexique.lespseudos,
            lexique.lespseudos,
            Colors.red,
            Colors.black),
        IcoTask(
            TURNMOLETTES,
            false,
            true,
            false,
            false,
            Icon(Icons.settings_accessibility_outlined),
            Icon(Icons.settings_accessibility_outlined),
            lexique.calculsdespoints,
            lexique.calculsdespoints,
            Colors.red,
            Colors.black),
        IcoTask(
            TYPERAPPORT,
            true,
            true,
            true,
            false,
            Icon(Icons.search),
            Icon(Icons.search),
            lexique.detailedreport,
            lexique.fullreport,
            Colors.black,
            Colors.black),
        IcoTask(
            SETSIZE,
            true,
            true,
            true,
            true,
            Icon(Icons.format_size),
            Icon(Icons.format_size),
            lexique.incresize,
            lexique.incresize,
            Colors.black,
            Colors.black)
      ];
      contrats.clear();
      contrats = [
        lexique.petite,
        lexique.garde,
        lexique.gardeSans,
        lexique.gardeContre,
      ];
      contratsDoc.clear();
      contratsDoc = [
        lexique.petite,
        lexique.garde,
        lexique.gardeSans,
        lexique.gardeContre,
      ];
      lesJoueurTarot.clear();
      lesJoueurTarot = [
        JoueurTarot(0, lexique.namefirst),
        JoueurTarot(1, lexique.nameSecond),
        JoueurTarot(2, lexique.namethird),
        JoueurTarot(3, lexique.namefourth),
        JoueurTarot(4, lexique.namefifth),
      ];
      names.clear();
      names = lesJoueurTarot.map((joueur) => joueur.name).toList();
      namesDoc.clear();
      namesDoc = lesJoueurTarot.map((joueur) => joueur.name).toList();
      namesPartners.clear();
      namesPartners = lesJoueurTarot.map((joueur) => joueur.name).toList();
    });
  });
}
  @override
  void initState() {
    super.initState();

    setState(() {
      lesIcoTask[APPSTART].setFlagRun(false); //on démarre
      razGlobalesDonne();
      razPoints();
      resetIcoTask();
      calcPointsLive(
          nbTaroters,
          pointsDuPreneur,
          selectedContratIndex,
          selectedPreneurIndex,
          selectedPartnerIndex,
          selectedPetitboutid,
          selectedSimplePoignid,
          selectedDoublePoignid,
          selectedTriplePoignid);
    });
  }

  void plusDemiPoint() {
    setState(() {
      if (pointsDuPreneur - pointsDuPreneur.toInt() == 0) {
        pointsDuPreneur = pointsDuPreneur + 0.5;
        calcPointsLive(
            nbTaroters,
            pointsDuPreneur,
            selectedContratIndex,
            selectedPreneurIndex,
            selectedPartnerIndex,
            selectedPetitboutid,
            selectedSimplePoignid,
            selectedDoublePoignid,
            selectedTriplePoignid);
      } else {}
    });
  }

  void pressICOSTASK(int ICOTASKname) {
    bool flagrunonoff = lesIcoTask[ICOTASKname].flagrun;
    switch (ICOTASKname) {
      case APPSTART:
        break;
      case SAVESCORES:
        if (!flagrunonoff) {
          saveManche(1);
          lesIcoTask[TYPERAPPORT].flagrun
              ? updateCumul()
              : updateCumulDetailed();
        } else {
          retourSaveScores();
        }
        break;
      case READSCORES:
        if (!flagrunonoff) {
          setState(() {
            lesIcoTask[TYPERAPPORT].flagrun
                ? updateCumul()
                : updateCumulDetailed();
          });
        } else {
          retourReadScores();
        }
        break;
      case DECLARATION:
        if (!flagrunonoff) {
        } else {}
        break;
      case INCRPLUS:
        plusDemiPoint();
        break;
      case SETPSEUDO:
        validateNewPseudo();
        break;
      case TURNMOLETTES:
        if (!flagrunonoff) {
        } else {}
        break;
      case TYPERAPPORT:
        if (!flagrunonoff) {
          setState(() {
            flagrunonoff ? updateCumul() : updateCumulDetailed();
          });
        } else {
          setState(() {
            (flagrunonoff) ? updateCumul() : updateCumulDetailed();
          });
        }
        break;
      case SETSIZE:
        incrSizePolicy();
        break;

      default:
        break;
    }
    setState(() {
      lesIcoTask[ICOTASKname].setFlagRun(!flagrunonoff);
    });
  }

  void razGlobalesDonne() {
    setState(() {
      selectedPreneurIndex = 0;
      selectedPointaroIndex = 0;
      selectedContratIndex = 0;
      selectedBoutsIndex = 0;
      selectedPointaroIndex = 0;
      selectedPartnerIndex = 0;
      selectedPetitboutid = -1;
      selectedSimplePoignid = -1;
      selectedDoublePoignid = -1;
      selectedTriplePoignid = -1;
      selectedChelemid = -1;
      pointsDuPreneur = 0;
      faiteDeCombien = 0;
      mancheId = 0;
    });
  }

  void razPoints() {
    for (int i = 0; i < points.length; i++) {
      points[i] = 0;
    }
    for (int i = 0; i < pointannonces.length; i++) {
      pointannonces[i] = 0;
    }
  }

  String replaceIthChar(String originalString, int i, String newChar) {
    if (i >= 0 && i < originalString.length) {
      return originalString.substring(0, i) +
          newChar +
          originalString.substring(i + 1);
    }
    return originalString; // Retourne la chaîne originale si i est hors de portée.
  }

  void resetIcoTask() {
    for (int thisicotask = 0; thisicotask < NBICOTASKS; thisicotask++) {
      lesIcoTask[thisicotask].setFlagRun(false);
      lesIcoTask[thisicotask].setFlagIco(false);
      lesIcoTask[thisicotask].setFlagUI(false);
    }
    lesIcoTask[SETSIZE].setFlagIco(true); // Il faut toujours la voir
  }

  resetOthersTaroteurs(int cocode) {
    setState(() {
      for (int i = 0; i < nbTaroters; i++) {
        if (i != cocode) quelTaroteur[i] = false;
      }
      taroteurActif = cocode;
      setFlagsTaroteurs(cocode);
    });
  }

  resetThisTaroteur(int cocode) {
    setState(() {
      for (int i = 0; i < nbTaroters; i++) {
        if (i == cocode) {
          quelTaroteur[i] = false;
          setFlagsTaroteurs(cocode);
        }
      }
    });
  }

  void retourReadScores() {
    setState(() {
      lesIcoTask[READSCORES].setFlagIco(true);
      lesIcoTask[APPSTART].setFlagRun(true);
    });
    return;
  }

  void retourSaveScores() {
    setState(() {
      lesIcoTask[APPSTART].setFlagRun(false);
      razPoints();
      razGlobalesDonne();
    });
    calcPointsLive(
        nbTaroters,
        pointsDuPreneur,
        selectedContratIndex,
        selectedPreneurIndex,
        selectedPartnerIndex,
        selectedPetitboutid,
        selectedSimplePoignid,
        selectedDoublePoignid,
        selectedTriplePoignid);
  }

  int saveManche(int thatcodesave) {
    if (thatcodesave == 1) {
      if (!lesIcoTask[APPSTART].flagrun) {
        return (0); // Pas de save n c'est pas commencé
      }
      if (faiteDeCombienArrondi == 0) {
        print(" erreur car par de points à Zero");
      }

      DonneTarot cetteManche = DonneTarot(
        mancheId,
        selectedBoutsIndex,
        selectedPreneurIndex,
        selectedPartnerIndex,
        selectedContratIndex,
        faiteDeCombien,
        faiteDeCombienArrondi,
        selectedPetitboutid,
        selectedSimplePoignid,
        selectedDoublePoignid,
        selectedTriplePoignid,
        selectedChelemid,
      );

      setState(() {
        lesMancheTarot.add(cetteManche);
        mancheId++;
      });
    }
    setState(() {});
    resetFlagAnnonce();
    return (0);
  }

  setFlagsTaroteurs(int cocode) {
    setState(() {
      for (int i = 0; i < nbTaroters; i++) {
        annoncesTaroteur[i] = false;
        if (selectedPetitboutid == cocode) annoncesTaroteur[0] = true;
        if (selectedSimplePoignid == cocode) annoncesTaroteur[1] = true;
        if (selectedDoublePoignid == cocode) annoncesTaroteur[2] = true;
        if (selectedTriplePoignid == cocode) annoncesTaroteur[3] = true;
        if (selectedChelemid == cocode) annoncesTaroteur[4] = true;
      }
    });
  }

  void setPseudo(thatcode) {
    return; //  <PML> on verra +tard
    setState(() {
      lesIcoTask[SETPSEUDO].setFlagUI(true);
      lesIcoTask[SETPSEUDO].setFlagIco(true);
    });
  }

  void updateCumul() {
    int deCombien = 0;
    lesCumulManche = [];
    int indiceManche = 0;
    List<int> petipoints = [0, 0, 0, 0, 0];
    for (DonneTarot manchette in lesMancheTarot) {
      List<int> mazero = [0, 0, 0, 0, 0];
      deCombien = manchette.singlescore;
      CumulManche _cumulmanche = CumulManche(
          indiceManche, manchette.prenerid, manchette.partnerid, true, mazero);
      for (int i = 0; i < nbTaroters; i++) {
        _cumulmanche.points[i] = petipoints[i];
      }
      for (int i = 0; i < nbTaroters; i++) {
        if (i != manchette.prenerid && i != manchette.partnerid) {
          _cumulmanche.points[i] = _cumulmanche.points[i] - deCombien.toInt();
        }
      }
      for (int i = 0; i < nbTaroters; i++) {
        if (i == manchette.prenerid && i == manchette.partnerid) {
          _cumulmanche.points[i] =
              _cumulmanche.points[i] + 4 * deCombien.toInt();
        }
        if (i == manchette.prenerid &&
            manchette.prenerid != manchette.partnerid) {
          _cumulmanche.points[i] =
              _cumulmanche.points[i] + 2 * deCombien.toInt();
        }
        if (i == manchette.partnerid &&
            manchette.partnerid != manchette.prenerid) {
          _cumulmanche.points[i] = _cumulmanche.points[i] + deCombien.toInt();
        }
      }
      //   Points des Poignées
      calcPoigne(nbTaroters, 1, manchette.simplePoignid, manchette.prenerid,
          manchette.partnerid, manchette.faitedecombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];
        _cumulmanche.points[i] = _cumulmanche.points[i] + pointannonces[i];
        pointannonces[i] = 0;
      }
      calcPoigne(nbTaroters, 2, manchette.doublePoignid, manchette.prenerid,
          manchette.partnerid, manchette.faitedecombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];
        _cumulmanche.points[i] = _cumulmanche.points[i] + pointannonces[i];
        pointannonces[i] = 0;
      }
      calcPoigne(nbTaroters, 3, manchette.triplePoignid, manchette.prenerid,
          manchette.partnerid, manchette.faitedecombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];
        _cumulmanche.points[i] = _cumulmanche.points[i] + pointannonces[i];
        pointannonces[i] = 0;
      }
      //****
      razPoints();
      setState(() {
        for (int i = 0; i < nbTaroters; i++) {
          petipoints[i] = _cumulmanche.points[i];
        }
        _cumulmanche.prenerid = manchette.prenerid;

        if (deCombien < 0) {
          _cumulmanche.winner = false;
        } else {
          _cumulmanche.winner = true;
        }
        lesCumulManche.add(_cumulmanche);
      });
      indiceManche++;
    }
  }

  void updateCumulDetailed() {
    int deCombien = 0;
    lesCumulManche = [];
    int indiceManche = 0;
    for (DonneTarot manchette in lesMancheTarot) {
      List<int> mazero = [0, 0, 0, 0, 0];
      deCombien = manchette.singlescore;
      CumulManche _cumulmanche = CumulManche(
          indiceManche, manchette.prenerid, manchette.partnerid, true, mazero);
      for (int i = 0; i < nbTaroters; i++) {
        if (i != manchette.prenerid && i != manchette.partnerid) {
          _cumulmanche.points[i] = _cumulmanche.points[i] - deCombien.toInt();
        }
      }
      for (int i = 0; i < nbTaroters; i++) {
        if (i == manchette.prenerid && i == manchette.partnerid) {
          _cumulmanche.points[i] =
              _cumulmanche.points[i] + 4 * deCombien.toInt();
        }
        if (i == manchette.prenerid &&
            manchette.prenerid != manchette.partnerid) {
          _cumulmanche.points[i] =
              _cumulmanche.points[i] + 2 * deCombien.toInt();
        }
        if (i == manchette.partnerid &&
            manchette.partnerid != manchette.prenerid) {
          _cumulmanche.points[i] = _cumulmanche.points[i] + deCombien.toInt();
        }
      }
      //   Points des Poignées
      calcPoigne(nbTaroters, 1, manchette.simplePoignid, manchette.prenerid,
          manchette.partnerid, manchette.faitedecombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];
        _cumulmanche.points[i] = _cumulmanche.points[i] + pointannonces[i];
        pointannonces[i] = 0;
      }
      calcPoigne(nbTaroters, 2, manchette.doublePoignid, manchette.prenerid,
          manchette.partnerid, manchette.faitedecombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];
        _cumulmanche.points[i] = _cumulmanche.points[i] + pointannonces[i];
        pointannonces[i] = 0;
      }
      calcPoigne(nbTaroters, 3, manchette.triplePoignid, manchette.prenerid,
          manchette.partnerid, manchette.faitedecombien);
      for (int i = 0; i < nbTaroters; i++) {
        points[i] = points[i] + pointannonces[i];
        _cumulmanche.points[i] = _cumulmanche.points[i] + pointannonces[i];
        pointannonces[i] = 0;
      }
      //****
      razPoints();
      setState(() {
        _cumulmanche.prenerid = manchette.prenerid;
        if (deCombien < 0) {
          _cumulmanche.winner = false;
        } else {
          _cumulmanche.winner = true;
        }
        lesCumulManche.add(_cumulmanche);
      });
      indiceManche++;
    }
  }

  void updateState() {
    setState(() {
      flagPseudoUi = lesIcoTask[SETPSEUDO].flagui;
      lesIcoTask[TYPERAPPORT].setFlagIco(false);

      if (lesIcoTask[APPSTART].flagrun) {
        lesIcoTask[READSCORES].setFlagIco(true);
        lesIcoTask[SAVESCORES].setFlagIco(true);
      }

      flagSaveScoreUi = (lesIcoTask[SAVESCORES].flagui); //OK
      flagReadScoresUi = (lesIcoTask[READSCORES].flagui);
      flagAnnonceUi = (lesIcoTask[DECLARATION].flagui);
      //
      flagMolette = !flagSaveScoreUi && !flagAnnonceUi;
      if (flagMolette) {
        lesIcoTask[SAVESCORES].setFlagIco(true);
        lesIcoTask[INCRPLUS].setFlagIco(true);
        lesIcoTask[DECLARATION].setFlagIco(true);
        lesIcoTask[READSCORES].setFlagIco(true);
      }

      if (flagAnnonceUi) {
        lesIcoTask[SAVESCORES].setFlagIco(false);
        lesIcoTask[INCRPLUS].setFlagIco(false);
        lesIcoTask[READSCORES].setFlagIco(false);
      }
      if (flagAnnonceUi) {
        flagMolette = false;
      }

      if (flagSaveScoreUi) {
        // Ico
        lesIcoTask[DECLARATION].setFlagIco(false);
        lesIcoTask[READSCORES].setFlagIco(false);
        lesIcoTask[INCRPLUS].setFlagIco(false);
        lesIcoTask[TYPERAPPORT].setFlagIco(true);
      }
      if (flagSaveScoreUi) {
        flagMolette = false;
      }

      if (flagReadScoresUi) {
        lesIcoTask[DECLARATION].setFlagIco(false);
        lesIcoTask[SAVESCORES].setFlagIco(false);
        lesIcoTask[INCRPLUS].setFlagIco(false);
        lesIcoTask[READSCORES].setFlagIco(true);
        lesIcoTask[TYPERAPPORT].setFlagIco(true);
      }
      if (flagReadScoresUi) {
        flagMolette = false;
      }

      if (flagPseudoUi) {
        // Ico management
        lesIcoTask[SETPSEUDO].setFlagIco(true);
        lesIcoTask[SAVESCORES].setFlagIco(false);
        lesIcoTask[INCRPLUS].setFlagIco(false);
        lesIcoTask[DECLARATION].setFlagIco(false);
        lesIcoTask[READSCORES].setFlagIco(false);
      }
      if (flagPseudoUi) {
        // Ui management
        flagMolette = false;
        flagAnnonceUi = false;
        flagSaveScoreUi = false;
        flagReadScoresUi = false;
      }

      calcPointsLive(
          nbTaroters,
          pointsDuPreneur,
          selectedContratIndex,
          selectedPreneurIndex,
          selectedPartnerIndex,
          selectedPetitboutid,
          selectedSimplePoignid,
          selectedDoublePoignid,
          selectedTriplePoignid);
    });
  }

  void validateNewPseudo() {
    setState(() {
      lesJoueurTarot[globalthatcode].name = newPseudo;
      names = lesJoueurTarot.map((joueur) => joueur.name).toList();
      namesPartners = lesJoueurTarot.map((joueur) => joueur.name).toList();
      namesDoc = lesJoueurTarot.map((joueur) => joueur.name).toList();
      lesIcoTask[SETPSEUDO].setFlagUI(false);
    });
  }

  resetFlagAnnonce() {
    quelTaroteur = [false, false, false, false, false, false];
    taroteurActif = -1;
    annoncesTaroteur = [false, false, false, false, false, false];
  }

  Future<void> lireDepuisPressePapiers() async {
    ClipboardData? data = await Clipboard.getData('text/plain');
    setState(() {
      _texteDuPressePapiers = data?.text ?? '';
    });
  }
}
