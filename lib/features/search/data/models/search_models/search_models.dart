import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'author.dart';

class SearchModels extends Equatable {
  final String? imageUrl;
  final String? bookId;
  final String? workId;
  final String? bookUrl;
  final String? title;
  final List<Author>? author;
  final String? rank;
  final String? rating;
  final String? totalRatings;
  final String? publishedYear;
  final String? totalEditions;

  const SearchModels({
    this.imageUrl,
    this.bookId,
    this.workId,
    this.bookUrl,
    this.title,
    this.author,
    this.rank,
    this.rating,
    this.totalRatings,
    this.publishedYear,
    this.totalEditions,
  });

  factory SearchModels.fromFromJson(Map<String, dynamic> data) {
    return SearchModels(
      imageUrl: data['imageUrl'] as String?,
      bookId: data['bookId'] as String?,
      workId: data['workId'] as String?,
      bookUrl: data['bookUrl'] as String?,
      title: data['title'] as String?,
      author: (data['author'] as List<dynamic>?)
          ?.map((e) => Author.fromFromJson(e as Map<String, dynamic>))
          .toList(),
      rank: data['rank'] as String?,
      rating: data['rating'] as String?,
      totalRatings: data['totalRatings'] as String?,
      publishedYear: data['publishedYear'] as String?,
      totalEditions: data['totalEditions'] as String?,
    );
  }

  Map<String, dynamic> toFromJson() => {
        'imageUrl': imageUrl,
        'bookId': bookId,
        'workId': workId,
        'bookUrl': bookUrl,
        'title': title,
        'author': author?.map((e) => e.toFromJson()).toList(),
        'rank': rank,
        'rating': rating,
        'totalRatings': totalRatings,
        'publishedYear': publishedYear,
        'totalEditions': totalEditions,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchModels].
  factory SearchModels.fromJson(String data) {
    return SearchModels.fromFromJson(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchModels] to a JSON string.
  String toJson() => json.encode(toFromJson());

  @override
  List<Object?> get props {
    return [
      imageUrl,
      bookId,
      workId,
      bookUrl,
      title,
      author,
      rank,
      rating,
      totalRatings,
      publishedYear,
      totalEditions,
    ];
  }
}
