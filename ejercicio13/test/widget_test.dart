// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:eje13/main.dart';

void main() {
  testWidgets('Carga la pantalla de anio bisiesto', (WidgetTester tester) async {
    await tester.pumpWidget(MiApp());

    expect(find.text('Año Bisiesto'), findsOneWidget);
  });
}
