import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/profile/user_provider.dart';

void main() {
  test('userProvider returns correct User data', () {
    // Create a ProviderContainer, which allows you to read providers
    final container = ProviderContainer();
    addTearDown(container.dispose); // Clean up after the test

    // Read the userProvider
    final user = container.read(userProvider);

    // Verify that the userProvider returns the correct user data
    expect(user.name, 'Dharma Sai');
    expect(user.email, 'dharmasai.seerapu@gmail.com');
    expect(user.profilePictureUrl, 'https://via.placeholder.com/150');
  });
}