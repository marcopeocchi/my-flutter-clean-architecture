import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final int id;
  // ignore: non_constant_identifier_names
  final int user_id;
  final String title;
  final String body;

  PostModel({
    required this.id,
    // ignore: non_constant_identifier_names
    required this.user_id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
