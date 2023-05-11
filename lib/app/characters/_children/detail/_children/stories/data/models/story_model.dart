import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/domain/entities/story.dart';

class StoryModel extends Story {
  const StoryModel({
    required int id,
    required String title,
    required String description,
    required String resourceUri,
    required String type,
    required String modified,
    required Creators creators,
    required Characters characters,
    required Characters series,
    required Characters comics,
    required Characters events,
    required OriginalIssue originalIssue,
  }) : super(
          id: id,
          title: title,
          description: description,
          resourceUri: resourceUri,
          type: type,
          modified: modified,
          creators: creators,
          characters: characters,
          series: series,
          comics: comics,
          events: events,
          originalIssue: originalIssue,
        );

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        resourceUri: json["resourceURI"] ?? '',
        type: json["type"] ?? '',
        modified: json["modified"] ?? '',
        creators: Creators.fromJson(json["creators"] ?? {}),
        characters: Characters.fromJson(json["characters"] ?? {}),
        series: Characters.fromJson(json["series"] ?? {}),
        comics: Characters.fromJson(json["comics"] ?? {}),
        events: Characters.fromJson(json["events"] ?? {}),
        originalIssue: OriginalIssue.fromJson(json["originalIssue"] ?? {}),
      );
}

class Characters {
  final int available;
  final String collectionUri;
  final List<OriginalIssue> items;
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
        items: List<OriginalIssue>.from(
            (json["items"] ?? []).map((x) => OriginalIssue.fromJson(x))),
        returned: json["returned"] ?? 0,
      );
}

class OriginalIssue {
  final String resourceUri;
  final String name;

  OriginalIssue({
    required this.resourceUri,
    required this.name,
  });

  factory OriginalIssue.fromJson(Map<String, dynamic> json) => OriginalIssue(
        resourceUri: json["resourceURI"] ?? '',
        name: json["name"] ?? '',
      );
}

class Creators {
  final int available;
  final String collectionUri;
  final List<Item> items;
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
        items:
            List<Item>.from((json["items"] ?? []).map((x) => Item.fromJson(x))),
        returned: json["returned"] ?? 0,
      );
}

class Item {
  final String resourceUri;
  final String name;
  final String role;

  Item({
    required this.resourceUri,
    required this.name,
    required this.role,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        resourceUri: json["resourceURI"] ?? '',
        name: json["name"] ?? '',
        role: json["role"] ?? '',
      );
}
