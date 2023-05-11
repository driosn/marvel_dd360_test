import '../../domain/entities/character.dart';

class CharacterModel extends Character {
  CharacterModel({
    required int id,
    required String name,
    required String description,
    required String modified,
    required Thumbnail thumbnail,
    required String resourceUri,
    required Comics comics,
    required Comics series,
    required Stories stories,
    required Comics events,
    required List<Url> urls,
  }) : super(
          id: id,
          name: name,
          description: description,
          modified: modified,
          thumbnail: thumbnail,
          resourceUri: resourceUri,
          comics: comics,
          series: series,
          stories: stories,
          events: events,
          urls: urls,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        modified: json["modified"] ?? '',
        thumbnail: Thumbnail.fromJson(json["thumbnail"] ?? {}),
        resourceUri: json["resourceURI"] ?? '',
        comics: Comics.fromJson(json["comics"] ?? {}),
        series: Comics.fromJson(json["series"] ?? {}),
        stories: Stories.fromJson(json["stories"] ?? {}),
        events: Comics.fromJson(json["events"] ?? {}),
        urls: List<Url>.from(
            (json["urls"] ?? <Url>[]).map((x) => Url.fromJson(x))),
      );
}

class Comics {
  Comics({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  int available;
  String collectionUri;
  List<ComicsItem> items;
  int returned;

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"] ?? 0,
        collectionUri: json["collectionURI"] ?? '',
        items: List<ComicsItem>.from((json["items"] ?? <ComicsItem>[])
            .map((x) => ComicsItem.fromJson(x))),
        returned: json["returned"] ?? 0,
      );
}

class ComicsItem {
  ComicsItem({
    required this.resourceUri,
    required this.name,
  });

  String resourceUri;
  String name;

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"] ?? '',
        name: json["name"] ?? '',
      );
}

class Stories {
  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  int available;
  String collectionUri;
  List<StoriesItem> items;
  int returned;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"] ?? 0,
        collectionUri: json["collectionURI"] ?? '',
        items: List<StoriesItem>.from(
            (json["items"] ?? []).map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"] ?? 0,
      );
}

class StoriesItem {
  String resourceUri;
  String name;
  String type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"] ?? '',
        name: json["name"] ?? '',
        type: json["type"] ?? '',
      );
}

class Thumbnail {
  String path;
  String extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"] ?? '',
        extension: json["extension"] ?? '',
      );
}

class Url {
  String type;
  String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"] ?? '',
        url: json["url"] ?? '',
      );
}
