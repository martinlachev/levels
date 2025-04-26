import 'package:flutter/material.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie List')),
      body: Center(
        child: Text(
          'Movie List Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
