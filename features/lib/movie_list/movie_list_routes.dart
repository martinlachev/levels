import 'package:features/movie_list/cubit/movie_list_cubit.dart';
import 'package:features/movie_list/ui/movie_list_screen.dart';
import 'package:utils/utils.dart';
import 'package:flutter/material.dart';

enum MovieListRoutes implements AppRoute {
  movieList(path: '/movie-list', name: 'MovieList'),
  movieDetail(path: '/movie-detail', name: 'MovieDetail');

  @override
  final String path;
  @override
  final String name;

  const MovieListRoutes({required this.path, required this.name});

  @override
  RouteBase get route {
    return GoRoute(
      name: name,
      path: path,
      builder: (context, state) {
        return _child;
      },
    );
  }

  Widget get _child {
    switch (this) {
      case MovieListRoutes.movieList:
        return BlocProvider(
          create: (context) => MovieListCubit(),
          child: const MovieListScreen(),
        );
      case MovieListRoutes.movieDetail:
        return const Center(child: Text('Movie Detail Screen'));
    }
  }

  static List<RouteBase> routes() {
    return values.map((route) => route.route).toList();
  }
}
