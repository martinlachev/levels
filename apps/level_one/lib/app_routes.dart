import 'package:features/features.dart';
import 'package:utils/utils.dart';

class LevelOneRouter extends AppRouter {
  @override
  Future<String> getInitialLocation() async {
    return MovieListRoutes.movieList.path;
  }

  @override
  List<RouteBase> get routes => [...MovieListRoutes.routes()];
}
