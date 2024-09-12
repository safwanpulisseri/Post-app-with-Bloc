part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  // const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostStateLoading extends PostState {}

class PostStateLoaded extends PostState {
  final List<Map<String, dynamic>> posts;
  PostStateLoaded({required this.posts});
  @override
  List<Object> get props => [];
}

class PostStateError extends PostState {
  final String message;
  PostStateError({required this.message});
  @override
  List<Object> get props => [];
}
