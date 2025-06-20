// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:rasa_nusantara/main.dart';

void main() {
  testWidgets('App loads and shows RASA NUSANTARA button', (WidgetTester tester) async {
    await tester.pumpWidget(const RasaNusantaraApp());

    // Verifikasi bahwa tombol "RASA NUSANTARA" muncul
    expect(find.text('RASA NUSANTARA'), findsOneWidget);

    // Verifikasi deskripsi juga muncul
    expect(find.textContaining('Eksplorasi aneka makanan'), findsOneWidget);
  });
}
