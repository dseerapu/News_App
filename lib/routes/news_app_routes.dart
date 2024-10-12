enum NewsAppRoutes {
  home('/'),
  news('/news'),
  newsDetails('/newsDetails/:getIndex');

  final String path;

  const NewsAppRoutes(this.path);
}