class Movie {
  final String id;
  final String title;
  final String year;
  final List<String> genres;
  final List<int> ratings;
  final String poster;
  final String contentRating;
  final String duration;
  final DateTime releaseDate;
  final double averageRating;
  final String originalTitle;
  final String storyline;
  final List<String> actors;
  final String imdbRating;
  final String posterurl;

  const Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.genres,
    required this.ratings,
    required this.poster,
    required this.contentRating,
    required this.duration,
    required this.releaseDate,
    required this.averageRating,
    required this.originalTitle,
    required this.storyline,
    required this.actors,
    required this.imdbRating,
    required this.posterurl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      year: json['year'] as String,
      genres: List<String>.from(json['genres'] as List),
      ratings: List<int>.from(json['ratings'] as List),
      poster: json['poster'] as String,
      contentRating: json['contentRating'] as String,
      duration: json['duration'] as String,
      releaseDate: DateTime.parse(json['releaseDate'] as String),
      averageRating: (json['averageRating'] as num).toDouble(),
      originalTitle: json['originalTitle'] as String,
      storyline: json['storyline'] as String,
      actors: List<String>.from(json['actors'] as List),
      imdbRating: json['imdbRating'] as String,
      posterurl: json['posterurl'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'year': year,
    'genres': genres,
    'ratings': ratings,
    'poster': poster,
    'contentRating': contentRating,
    'duration': duration,
    'releaseDate': releaseDate.toIso8601String(),
    'averageRating': averageRating,
    'originalTitle': originalTitle,
    'storyline': storyline,
    'actors': actors,
    'imdbRating': imdbRating,
    'posterurl': posterurl,
  };
}
