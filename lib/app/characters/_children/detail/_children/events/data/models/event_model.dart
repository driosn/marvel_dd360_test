import '../../domain/entities/event.dart';

class EventModel extends Event {
  const EventModel({
    required int id,
    required String title,
    required String description,
    required String resourceUri,
    required List<Url> urls,
    required String modified,
    required DateTime start,
    required DateTime end,
    required Thumbnail thumbnail,
    required Creators creators,
    required Characters characters,
    required Stories stories,
    required Characters comics,
    required Characters series,
    required Next next,
    required Next previous,
  }) : super(
          id: id,
          title: title,
          description: description,
          resourceUri: resourceUri,
          urls: urls,
          modified: modified,
          start: start,
          end: end,
          thumbnail: thumbnail,
          creators: creators,
          characters: characters,
          stories: stories,
          comics: comics,
          series: series,
          next: next,
          previous: previous,
        );

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        resourceUri: json["resourceURI"] ?? '',
        urls: List<Url>.from((json["urls"] ?? []).map((x) => Url.fromJson(x))),
        modified: json["modified"] ?? '',
        start: DateTime.parse(json["start"] ?? '0000-00-00'),
        end: DateTime.parse(json["end"] ?? '0000-00-00'),
        thumbnail: Thumbnail.fromJson(json["thumbnail"] ?? {}),
        creators: Creators.fromJson(json["creators"] ?? {}),
        characters: Characters.fromJson(json["characters"] ?? {}),
        stories: Stories.fromJson(json["stories"] ?? {}),
        comics: Characters.fromJson(json["comics"] ?? {}),
        series: Characters.fromJson(json["series"] ?? {}),
        next: Next.fromJson(json["next"] ?? {}),
        previous: Next.fromJson(json["previous"] ?? {}),
      );
}

class Characters {
  final int available;
  final String collectionUri;
  final List<Next> items;
  final int returned;

  Characters({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"] ?? 0,
        collectionUri: json["collectionURI"] ?? '',
        items:
            List<Next>.from((json["items"] ?? []).map((x) => Next.fromJson(x))),
        returned: json["returned"] ?? 0,
      );
}

class Next {
  final String resourceUri;
  final String name;

  Next({
    required this.resourceUri,
    required this.name,
  });

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        resourceUri: json["resourceURI"] ?? '',
        name: json["name"] ?? '',
      );
}

class Creators {
  final int available;
  final String collectionUri;
  final List<CreatorsItem> items;
  final int returned;

  Creators({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
        available: json["available"] ?? 0,
        collectionUri: json["collectionURI"] ?? '',
        items: List<CreatorsItem>.from(
            (json["items"] ?? []).map((x) => CreatorsItem.fromJson(x))),
        returned: json["returned"] ?? 0,
      );
}

class CreatorsItem {
  final String resourceUri;
  final String name;
  final String role;

  CreatorsItem({
    required this.resourceUri,
    required this.name,
    required this.role,
  });

  factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"] ?? '',
        name: json["name"] ?? '',
        role: json["role"] ?? '',
      );
}

class Stories {
  final int available;
  final String collectionUri;
  final List<StoriesItem> items;
  final int returned;

  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"] ?? 0,
        collectionUri: json["collectionURI"] ?? '',
        items: List<StoriesItem>.from(
            (json["items"] ?? []).map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"] ?? 0,
      );
}

class StoriesItem {
  final String resourceUri;
  final String name;
  final String type;

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
  final String path;
  final String extension;

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
  final String type;
  final String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"] ?? '',
        url: json["url"] ?? '',
      );
}
