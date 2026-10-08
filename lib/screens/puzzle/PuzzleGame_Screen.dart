import 'dart:math';

import 'package:flutter/material.dart';

// Jeu de taquin : l'image est découpée en size x size pièces,
// la case vide est en bas à droite quand le puzzle est résolu.
class PuzzleGameScreen extends StatefulWidget {
  final String title;
  final String image;
  final int size;

  const PuzzleGameScreen({
    super.key,
    required this.title,
    required this.image,
    required this.size,
  });

  @override
  State<PuzzleGameScreen> createState() => _PuzzleGameScreenState();
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  // tiles[position] = numéro de la pièce affichée à cette position
  late List<int> tiles;
  int moves = 0;

  int get size => widget.size;
  int get emptyTile => size * size - 1;

  @override
  void initState() {
    super.initState();
    resetPuzzle();
  }

  // On part du puzzle résolu et on joue des coups au hasard :
  // un mélange totalement aléatoire peut donner un puzzle impossible à résoudre.
  void resetPuzzle() {
    final random = Random();
    tiles = List.generate(size * size, (index) => index);
    int empty = emptyTile;
    int previous = -1;
    for (int i = 0; i < size * size * 20; i++) {
      final neighbours = _neighbours(empty).where((p) => p != previous).toList();
      final next = neighbours[random.nextInt(neighbours.length)];
      tiles[empty] = tiles[next];
      tiles[next] = emptyTile;
      previous = empty;
      empty = next;
    }
    moves = 0;
  }

  List<int> _neighbours(int position) {
    final row = position ~/ size;
    final col = position % size;
    return [
      if (row > 0) position - size,
      if (row < size - 1) position + size,
      if (col > 0) position - 1,
      if (col < size - 1) position + 1,
    ];
  }

  void move(int position) {
    final empty = tiles.indexOf(emptyTile);
    if (!_neighbours(empty).contains(position)) return;
    setState(() {
      tiles[empty] = tiles[position];
      tiles[position] = emptyTile;
      moves++;
    });
    if (_isSolved()) _showVictory();
  }

  bool _isSolved() {
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i] != i) return false;
    }
    return true;
  }

  void _showVictory() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Bravo ! 🎉'),
        content: Text('Puzzle terminé en $moves coups.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Retour'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(resetPuzzle);
            },
            child: const Text('Rejouer'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple.shade800,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Mélanger',
            onPressed: () => setState(resetPuzzle),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final boardSize = min(min(constraints.maxWidth, constraints.maxHeight - 140) - 32, 500.0);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(widget.image, width: 70, height: 70, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Coups : $moves',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildBoard(boardSize),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBoard(double boardSize) {
    final tileSize = boardSize / size;
    return Container(
      width: boardSize,
      height: boardSize,
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          for (int position = 0; position < tiles.length; position++)
            if (tiles[position] != emptyTile)
              // La clé suit la pièce : Flutter anime son déplacement
              AnimatedPositioned(
                key: ValueKey(tiles[position]),
                duration: const Duration(milliseconds: 150),
                left: (position % size) * tileSize,
                top: (position ~/ size) * tileSize,
                width: tileSize,
                height: tileSize,
                child: GestureDetector(
                  onTap: () => move(position),
                  child: _buildPiece(tiles[position], boardSize),
                ),
              ),
        ],
      ),
    );
  }

  // Affiche uniquement la portion de l'image qui correspond à la pièce
  Widget _buildPiece(int tile, double boardSize) {
    final row = tile ~/ size;
    final col = tile % size;
    return Container(
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: ClipRect(
        child: Align(
          alignment: Alignment(-1 + 2 * col / (size - 1), -1 + 2 * row / (size - 1)),
          widthFactor: 1 / size,
          heightFactor: 1 / size,
          child: Image.asset(widget.image, width: boardSize, height: boardSize, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
