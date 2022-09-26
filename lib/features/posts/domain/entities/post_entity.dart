import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String title;
  final String body;

  const Post({required this.title, required this.body});

  @override
  List<Object?> get props => [title, body];
}
