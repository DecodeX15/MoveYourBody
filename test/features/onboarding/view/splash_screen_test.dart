import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:move_your_body/ui/onboarding/widgets/splash_screen.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  Widget createWidgetUnderTest() {
    return const ProviderScope(child: MaterialApp(home: SplashScreen()));
  }

  group('SplashScreen Widget Tests', () {
    testWidgets('renders splash screen and branding logos correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(SplashScreen), findsOneWidget);
      expect(find.byType(FadeTransition), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(2));
      expect(find.byType(VerticalDivider), findsOneWidget);
    });
  });
}
