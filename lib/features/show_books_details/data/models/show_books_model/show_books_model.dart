import 'package:equatable/equatable.dart';

class ShowBooksModel extends Equatable {
  final String? imageUrl;
  final String? quoteText;
  final List<dynamic> urls;
  final String? likes;

  const ShowBooksModel(
      {this.imageUrl, this.quoteText, required this.urls, this.likes});

  factory ShowBooksModel.fromJson(Map<String, dynamic> json) => ShowBooksModel(
        imageUrl: json['imageUrl'] as String?,
        quoteText: json['quoteText'] as String?,
        urls: json['urls'] as List<dynamic>,
        likes: json['likes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'quoteText': quoteText,
        'urls': urls,
        'likes': likes,
      };

  @override
  List<Object?> get props => [imageUrl, quoteText, urls, likes];
}
