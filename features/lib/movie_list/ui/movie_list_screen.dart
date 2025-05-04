import 'package:features/movie_list/cubit/movie_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie List')),
      body: BlocBuilder<MovieListCubit, MovieListState>(
        builder: (context, state) {
          return Center(
            child: Text(
              'Movie List Screen',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        },
      ),
    );
  }
}
