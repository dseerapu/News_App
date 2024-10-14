import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:news_app/main.dart';
import 'package:news_app/news/ui/news_screen.dart';
import 'package:news_app/profile/profile_screen.dart';
import 'package:news_app/saved_news/saved_news_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Navigation Test', (WidgetTester tester) async {
    // Load the app
    await tester.pumpWidget(const ProviderScope(child: NewsApp()));
    await tester.pumpAndSettle(); 

    // Find the Bottom Navigation Bar items
    final Finder homeTab = find.text('Home');
    final Finder savedTab = find.text('Saved');
    final Finder profileTab = find.text('Profile');

    // Verify that the Home screen is displayed
    expect(find.byType(NewsScreen), findsOneWidget);

    // Tap on the Saved tab
    await tester.tap(savedTab);
    await tester.pumpAndSettle(); // Wait for the navigation animation

    // Verify that the Saved screen is displayed
    expect(find.byType(SavedNewsScreen), findsOneWidget);

    // Tap on the Profile tab
    await tester.tap(profileTab);
    await tester.pumpAndSettle(); // Wait for the navigation animation

    // Verify that the Profile screen is displayed
    expect(find.byType(ProfileScreen), findsOneWidget);

    // Tap on the Profile tab
    await tester.tap(homeTab);
    await tester.pumpAndSettle(); // Wait for the navigation animation

    // Verify that the Profile screen is displayed
    expect(find.byType(NewsScreen), findsOneWidget);
  });
}