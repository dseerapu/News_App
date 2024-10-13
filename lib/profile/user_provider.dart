// A simple provider for user details
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/profile/user.dart';

final userProvider = Provider<User>((ref) {
  // Here you would normally fetch this data from an API or a local source
  return User(
    name: 'Dharma Sai',
    email: 'dharmasai.seerapu@gmail.com',
    profilePictureUrl: 'https://via.placeholder.com/150',
  );
});