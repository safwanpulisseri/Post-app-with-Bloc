import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String title;
  final String body;
  int id;
  int userId;
  PostEntity(
      {required this.body,
      required this.id,
      required this.title,
      required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [this.title, this.userId, this.body, this.id];
}
