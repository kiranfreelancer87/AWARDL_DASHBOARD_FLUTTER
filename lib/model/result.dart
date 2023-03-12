import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class ResultModel {
  String? id;
  String? name;
  String? time;
  String? guesses;
  String? points;

  ResultModel({this.id, this.name, this.time, this.guesses, this.points});
  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
