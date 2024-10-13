
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:news_app/api/api_endpoint.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@HiveType(typeId: 0)
@freezed
class News with _$News {
  const factory News({
    @HiveField(0) String? title,
    @HiveField(1) String? author,
    @HiveField(2) String? urlToImage,
    @HiveField(3) String? description,
    @HiveField(4) String? content,
  }) = _News;

  factory News.defaultValues() => const News(
      urlToImage: defaultImageURL);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
