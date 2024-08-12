import 'dart:convert';

import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String? id;
  final String? name;

  const Author({this.id, this.name});

  factory Author.fromFromJson(Map<String, dynamic> data) => Author(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toFromJson() => {
        'id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Author].
  factory Author.fromJson(String data) {
    return Author.fromFromJson(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Author] to a JSON string.
  String toJson() => json.encode(toFromJson());

  @override
  List<Object?> get props => [id, name];
}
