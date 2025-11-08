import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_item_dto.freezed.dart';
part 'name_item_dto.g.dart';

@freezed
abstract class NameItemDto with _$NameItemDto {
  const factory NameItemDto({required String name}) = _NameItemDto;

  factory NameItemDto.fromJson(Map<String, dynamic> json) =>
      _$NameItemDtoFromJson(json);
}
