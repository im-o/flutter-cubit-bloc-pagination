import 'package:cubit_bloc_pagination/presentation/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/posts/posts_cubit.dart';
import 'data/repositories/posts_repository.dart';
import 'data/services/posts_service.dart';

void main() {
  runApp(PaginationApp(repository: PostsRepository(PostService())));
}

class PaginationApp extends StatelessWidget {
  final PostsRepository repository;

  const PaginationApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostsCubit(repository),
        child: PostView(),
      ),
    );
  }
}
