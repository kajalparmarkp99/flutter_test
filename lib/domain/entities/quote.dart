import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String id;
  final String content;
  final String author;
  final List<dynamic>? tags;
  final String? authorSlug;
  final int? length;
  final String? dateAdded;
  final String? dateModified;


  const Quote({
    required this.id,
    required this.content,
    required this.author,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified
  });

  @override
  List<Object?> get props => [id, content, author,tags,authorSlug,length,dateAdded,dateModified];
}
