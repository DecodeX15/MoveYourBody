import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:move_your_body/features/onboarding/view/goal_screen.dart';
import 'package:move_your_body/core/widgets/feature_chip.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const ProviderScope(
      child: MaterialApp(
        home: GoalScreen(),
      ),
    );
  }

  group('GoalScreen Widget Tests', () {
    
    // 1. UI Rendering Test (Ab ye smoke test nahi, real test hai)
    testWidgets('renders all UI components correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Check for main title
      expect(find.text('Choose Your Goals'), findsOneWidget);
      
      // Check for the Continue button text
      expect(find.text('Continue'), findsOneWidget);
      
      // Check if the text input field exists
      expect(find.byType(TextField), findsOneWidget);
      
      // Code mein goalsMap mein exactly 14 items hain, to humein 14 chips milne chahiye
      expect(find.byType(FeatureChip), findsNWidgets(14));
      
      // Check for back button icon
      expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);
    });

    // 2. User Interaction Test: Tapping a chip
    testWidgets('can tap on a goal chip without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // 'Burn Fat' wala chip dhoondho
      final fatBurnChip = find.widgetWithText(FeatureChip, 'Burn Fat');
      expect(fatBurnChip, findsOneWidget);

      // Us chip par tap (click) karo
      await tester.tap(fatBurnChip);
      
      // pumpAndSettle() screen ko refresh hone deta hai (jaise click hone ke baad color change hona)
      await tester.pumpAndSettle(); 

      // Check ki tap karne ke baad koi crash na hua ho
      expect(tester.takeException(), isNull);
    });

    // 3. User Interaction Test: Typing in TextField
    testWidgets('can enter text in custom goal field', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      // Hum text field mein type kar rahe hain
      await tester.enterText(textField, 'Run a marathon');
      await tester.pumpAndSettle();

      // Ensure ki jo humne type kiya wo screen par display ho raha hai
      expect(find.text('Run a marathon'), findsOneWidget);
    });
    
  });
}
