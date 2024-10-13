enum NewsAppRoutes {
  home('/'),
  news('/news'),
  newsDetails('/newsDetails/:getIndex'),
  savedNews('/savedNews'),
  profile('/profile');

  final String path;

  const NewsAppRoutes(this.path);
}