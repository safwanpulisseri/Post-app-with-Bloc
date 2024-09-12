import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../sample_post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestedEvent>((event, emit) async {
      emit(PostStateLoading());

      await Future.delayed(const Duration(seconds: 2), () {
        emit(PostStateLoaded(posts: posts));
      });
    });
  }
}
