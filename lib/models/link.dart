import 'package:obsidian_clipper/routes/home_screen.dart';

final String linkTable = 'links';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnImage = 'image';
final String columnOriginalUrl = 'original_url';


class Link {
  int? id;
  String title;
  String image;
  String originalUrl;

  int get persistedId => id!;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnImage: image,
      columnOriginalUrl: originalUrl
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Link({this.id, required this.title, required this.image, required this.originalUrl});

  factory Link.fromMap(Map<String, Object?> map) {
    return Link(
      id: map[columnId] as int?,
      title: map[columnTitle] as String,
      image: map[columnImage] as String,
      originalUrl: map[columnOriginalUrl] as String,
    );
  }

  factory Link.fromDto(LinkDto dto) {
    return Link(title: dto.title, image: dto.image, id: dto.id, originalUrl: dto.originalUrl);
  }
}


