
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/api/api_endpoint.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class News with _$News {
  const factory News({
    String? title,
    String? author,
    String? urlToImage,
    String? description,
    String? content,
  }) = _News;

  factory News.defaultValues() => const News(
      urlToImage: defaultImageURL);

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
