part of 'movie_list_cubit.dart';

final class MovieListState extends BaseState {
  final List<Movie> movies;

  const MovieListState({
    this.movies = const [],
    super.status = AsyncStatus.initial,
  });

  @override
  MovieListState copyWith({AsyncStatus? status, List<Movie>? movies}) {
    return MovieListState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object?> get props => [status, movies];
}
