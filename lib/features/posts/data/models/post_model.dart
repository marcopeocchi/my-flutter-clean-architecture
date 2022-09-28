import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/entities/post_entity.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Post {
  final int id;
  // ignore: non_constant_identifier_names
  final int user_id;

  const PostModel({
    required this.id,
    // ignore: non_constant_identifier_names
    required this.user_id,
    required super.title,
    required super.body,
  }) : super();

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
