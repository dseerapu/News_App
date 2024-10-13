import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/profile/profile_screen.dart';
import 'package:news_app/profile/user.dart';
import 'package:news_app/profile/user_provider.dart';

// Generate a mock User class using Mockito
@GenerateMocks([User])
import 'profile_screen_test.mocks.dart';

void main() {
  // Test for ProfileScreen widget
  testWidgets('ProfileScreen displays user details correctly', (WidgetTester tester) async {
    // Create a mock user object
    final mockUser = MockUser();
    
    when(mockUser.name).thenReturn('Dharma Sai');
    when(mockUser.email).thenReturn('dharmasai.seerapu@gmail.com');

    // Build the widget tree with the mocked user provider
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userProvider.overrideWithValue(mockUser), // Provide mock user data
        ],
        child: const MaterialApp(
          home: ProfileScreen(),
        ),
      ),
    );

    // Check if the profile picture, name, and email are displayed correctly
    expect(find.text('Dharma Sai'), findsOneWidget);
    expect(find.text('dharmasai.seerapu@gmail.com'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });
}