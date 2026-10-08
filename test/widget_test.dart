import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:truepath/screens/puzzle/PuzzleGame_Screen.dart';

void main() {
  Future<void> pumpPuzzle(WidgetTester tester, int size) async {
    await tester.binding.setSurfaceSize(const Size(600, 900));
    await tester.pumpWidget(MaterialApp(
      home: PuzzleGameScreen(
        title: 'Test',
        image: 'assets/images/puzzle_2.png',
        size: size,
      ),
    ));
  }

  testWidgets('Le puzzle 3x3 affiche 8 pièces et 0 coup au départ', (tester) async {
    await pumpPuzzle(tester, 3);

    expect(find.text('Coups : 0'), findsOneWidget);
    expect(find.byType(AnimatedPositioned), findsNWidgets(8));
  });

  testWidgets('Toucher une pièce voisine de la case vide compte un coup', (tester) async {
    await pumpPuzzle(tester, 4);

    // Exactement 2 à 4 pièces sont voisines de la case vide : une seule tape suffit
    for (final piece in find.byType(AnimatedPositioned).evaluate().toList()) {
      await tester.tap(find.byWidget(piece.widget), warnIfMissed: false);
      await tester.pumpAndSettle();
      if (find.text('Coups : 1').evaluate().isNotEmpty) break;
    }

    expect(find.text('Coups : 1'), findsOneWidget);
  });
}
