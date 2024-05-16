

import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel({
    required super.id,
    required super.content,
    required super.author,
    required List<dynamic> super.tags,
    super.authorSlug,
    super.length,
    super.dateAdded,
    super.dateModified,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['_id'],
      content: json['content'],
      author: json['author'],
      tags : json['tags'],
      authorSlug : json['authorSlug'],
      length :json['length'],
      dateAdded : json['dateAdded'],
      dateModified :json['dateModified'],
    );
  }
}
