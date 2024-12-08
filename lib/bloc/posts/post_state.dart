import 'package:assignment/model/post.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<PostModel> posts;
  final bool hasMore;

  PostsLoaded({required this.posts, required this.hasMore});
}

class PostsError extends PostsState {
  final String message;

  PostsError({required this.message});
}
