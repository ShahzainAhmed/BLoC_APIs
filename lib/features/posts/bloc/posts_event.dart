part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

// First Event :
// PostsInitialFetchEvent, means as soon as the app is opened,
// the intiial event is going to be the fetching of API


class PostsInitialFetchEvent extends PostsEvent {}

class PostsAddEvent extends PostsEvent {}
