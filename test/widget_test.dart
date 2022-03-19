import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myfavmovie/models/favourites.dart';
import 'package:myfavmovie/screens/home_page.dart';
import 'package:provider/provider.dart';

Widget myHomeScreen() => ChangeNotifierProvider<Favourits>(
      create: (context) => Favourits(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  testWidgets('HomePage Widget Test', (tester) async {
    await tester.pumpWidget(myHomeScreen());
    expect(find.text('Hacked'), findsOneWidget);
  });

  testWidgets('Testing IconButtonss', (tester) async {
    await tester.pumpWidget(myHomeScreen());
    expect(find.byIcon(Icons.favorite), findsNothing);

    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Added to favorites.'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsWidgets);

    await (tester.tap(find.byIcon(Icons.favorite).first));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Removed from favorites.'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);
  });
}
