import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'postbloc_event.dart';
part 'postbloc_state.dart';

class PostblocBloc extends Bloc<PostblocEvent, PostblocState> {
  PostblocBloc() : super(PostblocInitial()) {
    on<PostblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
