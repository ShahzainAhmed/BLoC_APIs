// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_apis/features/posts/models/posts_data_ui_model.dart';
import 'package:bloc_apis/features/posts/repos/posts_repo.dart';
import 'package:meta/meta.dart';
part 'posts_event.dart';
part 'posts_state.dart';

/* 
event -> bloc -> state
Bloc is going to take an event, event goes inside the bloc, and bloc emits a state
 */

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostsAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<PostsDataUiModel> posts = await PostsRepo.fetchPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> postAddEvent(
      PostsAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPosts();

    if (success) {
      emit(PostsAdditionSuccessState());
    } else {
      emit(PostsAdditionErrorState());
    }
  }
}
