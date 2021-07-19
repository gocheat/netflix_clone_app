class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;

  Movie.formMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  @override
  String toString() {
    return "Movie<$title:$keyword>";
  }
}