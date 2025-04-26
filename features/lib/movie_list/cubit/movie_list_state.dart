part of 'movie_list_cubit.dart';

final class MovieListState extends BaseState {
  const MovieListState({super.status = AsyncStatus.initial});

  @override
  MovieListState copyWith({String? errorMessage, AsyncStatus? status}) {
    return MovieListState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
