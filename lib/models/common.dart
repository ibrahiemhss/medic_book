import 'package:json_annotation/json_annotation.dart';

part 'common.changeG.dart';

// Common list data format

@JsonSerializable(nullable: false)
class CommonData {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final num view;
  final bool recommend;
  CommonData(
      {this.id,
      this.title,
      this.description,
      this.recommend,
      this.createdAt,
      this.updatedAt,
      this.view});
  factory CommonData.fromJson(Map<String, dynamic> json) =>
      _$CommonDataFromJson(json);
  Map<String, dynamic> toJson() => _$CommonDataToJson(this);
}

@JsonSerializable(nullable: false)
class CommonDataList {
  final num index;
  final num size;
  final num totalElements;

  @JsonKey(name: 'data')
  final List<CommonData> data;

  CommonDataList(this.data, this.index, this.size, this.totalElements);

  factory CommonDataList.fromJson(Map<String, dynamic> json) =>
      _$CommonDataListFromJson(json);
}
