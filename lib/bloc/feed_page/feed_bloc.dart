
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone_bloc/bloc/feed_page/feed_event.dart';
import 'package:insta_clone_bloc/bloc/feed_page/feed_state.dart';

import '../../model/post_model.dart';
import '../../services/db_service.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState>{
  List<Post> items = [];

  FeedBloc() : super(FeedInitialState()) {
    on<FeedLoadPostEvent>(_apiLoadFeeds);
  }
  Future<void> _apiLoadFeeds(FeedLoadPostEvent event, Emitter<FeedState> emit) async {
    emit(FeedLoadingState());

    var result = await DBService.loadFeeds();
    items = result;

    emit(FeedLoadPostState(items));
  }
}