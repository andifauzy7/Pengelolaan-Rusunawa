part of 'posting_bloc.dart';

@immutable
abstract class PostingState {
  const PostingState();
}

class PostingInitial extends PostingState {}

class PostingStateLoading extends PostingState {}

class PostingStateSuccess extends PostingState {
  String message;
  PostingStateSuccess(this.message);
}

class PostingStateFailed extends PostingState {
  String message;
  PostingStateFailed(this.message);
}

