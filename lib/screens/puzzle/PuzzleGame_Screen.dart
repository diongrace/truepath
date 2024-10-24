import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PuzzleGameScreen()));
}

class PuzzleGameScreen extends StatefulWidget {
  @override
  _PuzzleGameScreenState createState() => _PuzzleGameScreenState();
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  final int size = 4; // 4x4 puzzle
  late List<int> puzzle;
  late int emptyIndex;

  // Remplace ce chemin par le chemin de ton image
  final String image = 'assets/images/puzzle_5.png';

  @override
  void initState() {
    super.initState();
    resetPuzzle();
  }

  void resetPuzzle() {
    puzzle = List.generate(size * size, (index) => index);
    puzzle.shuffle();
    emptyIndex = puzzle.indexOf(0);
  }

  void move(int index) {
    if (isAdjacent(index, emptyIndex)) {
      setState(() {
        puzzle[emptyIndex] = puzzle[index];
        puzzle[index] = 0; // Déplace l'espace vide
        emptyIndex = index;
      });
    }
  }

  bool isAdjacent(int index1, int index2) {
    int row1 = index1 ~/ size;
    int col1 = index1 % size;
    int row2 = index2 ~/ size;
    int col2 = index2 % size;
    return (row1 == row2 && (col1 - col2).abs() == 1) ||
           (col1 == col2 && (row1 - row2).abs() == 1);
  }

  // Méthode pour obtenir le rectangle de l'image à afficher
  Rect getImageRect(int index) {
    int row = index ~/ size;
    int col = index % size;
    double pieceWidth = 1 / size; // Largeur de chaque pièce par rapport à l'image
    double pieceHeight = 1 / size; // Hauteur de chaque pièce par rapport à l'image
    return Rect.fromLTWH(col * pieceWidth, row * pieceHeight, pieceWidth, pieceHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu de Puzzle Biblique'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                resetPuzzle();
              });
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size),
        itemCount: puzzle.length,
        itemBuilder: (context, index) {
          if (puzzle[index] == 0) {
            return Container(color: Colors.transparent); // Espace vide
          }
          return GestureDetector(
            onTap: () => move(index),
            child: Container(
              margin: EdgeInsets.all(4),
              color: Colors.blue,
              child: ClipRect(
                child: Align(
                  alignment: Alignment.center,
                  widthFactor: 1 / size,
                  heightFactor: 1 / size,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    alignment: Alignment(
                      // Calculer la position de l'image pour chaque pièce
                      getImageRect(puzzle[index]).left * 2 - 1,
                      getImageRect(puzzle[index]).top * 2 - 1,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
