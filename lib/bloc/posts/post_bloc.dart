import 'package:assignment/bloc/posts/post_event.dart';
import 'package:assignment/bloc/posts/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment/services/api_services.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final ApiService apiService;
  int _start = 0;
  final int _limit = 10;

  PostsBloc({required this.apiService}) : super(PostsInitial()) {
    on<FetchPosts>((event, emit) async {
      if (state is PostsLoaded && !(state as PostsLoaded).hasMore) {
        return; // Stop fetching if there are no more posts
      }

      try {
        if (state is PostsInitial || state is PostsLoading) {
          emit(PostsLoading());
        }

        // Fetch posts from API
        final newPosts = await apiService.fetchPosts(_start, _limit);
        _start += _limit;

        if (state is PostsLoaded) {
          final currentPosts = (state as PostsLoaded).posts;
          emit(PostsLoaded(
            posts: currentPosts + newPosts,
            hasMore: newPosts.length == _limit,
          ));
        } else {
          emit(PostsLoaded(posts: newPosts, hasMore: newPosts.length == _limit));
        }
      } catch (error) {
        emit(PostsError(message: error.toString()));
      }
    });
  }
}
