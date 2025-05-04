import 'package:flutter/cupertino.dart';
import 'package:utils/utils.dart';
import 'package:features/features.dart';

part 'movie_list_state.dart';

class MovieListCubit extends BaseCubit<MovieListState> {
  static const movieListPath =
      'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json';

  MovieListCubit() : super(MovieListState());

  @override
  void onInit() async {
    super.onInit();

    setStatus(AsyncStatus.globalLoading);

    final result = await HTTPClient().sendRequest(
      path: movieListPath,
      method: HTTPMethod.get,
      fromListJson: (jsonList) {
        return jsonList
            .map((json) => Movie.fromJson(json as Map<String, dynamic>))
            .toList();
      },
    );

    if (result.isFailure) {
      setError(result.error.message);
    }

    debugPrint(result.toString());
  }
}
