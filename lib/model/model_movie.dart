class Movie {
  final String title;
  final String keyword;
  final String poster;
  bool like;

  Movie({
    required this.title,
    required this.keyword,
    required this.poster,
    this.like = false,
  });
}
