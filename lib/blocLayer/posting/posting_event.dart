part of 'posting_bloc.dart';

@immutable
abstract class PostingEvent {
  const PostingEvent();
}

class PostingEventSubmit extends PostingEvent {
  Map<String, dynamic> data;
  PostingEventSubmit(this.data);
}