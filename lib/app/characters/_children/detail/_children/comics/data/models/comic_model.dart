import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/domain/entities/comic.dart';

class ComicModel extends Comic {
  const ComicModel({
    required int id,
    required int digitalId,
    required String title,
    required int issueNumber,
    required String variantDescription,
    required String description,
    required String modified,
    required String isbn,
    required String upc,
    required String diamondCode,
    required String ean,
    required String issn,
    required String format,
    required int pageCount,
    required List<dynamic> textObjects,
    required String resourceUri,
    required List<Url> urls,
    required Series series,
    required List<dynamic> variants,
    required List<dynamic> collections,
    required List<dynamic> collectedIssues,
    required List<Date> dates,
    required Thumbnail thumbnail,
    required List<dynamic> images,
    required Creators creators,
    required Characters characters,
    required Stories stories,
    required Characters events,
  }) : super(
          id: id,
          digitalId: digitalId,
          title: title,
          issueNumber: issueNumber,
          variantDescription: variantDescription,
          description: description,
          modified: modified,
          isbn: isbn,
          upc: upc,
          diamondCode: diamondCode,
          ean: ean,
          issn: issn,
          format: format,
          pageCount: pageCount,
          textObjects: textObjects,
          resourceUri: resourceUri,
          urls: urls,
          series: series,
          variants: variants,
          collections: collections,
          collectedIssues: collectedIssues,
          dates: dates,
          thumbnail: thumbnail,
          images: images,
          creators: creators,
          characters: characters,
          stories: stories,
          events: events,
        );

  factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
        id: json["id"] ?? 0,
        digitalId: json["digitalId"] ?? 0,
        title: json["title"] ?? '',
        issueNumber: json["issueNumber"] ?? 0,
        variantDescription: json["variantDescription"] ?? '',
        description: json["description"] ?? '',
        modified: json["modified"] ?? '',
        isbn: json["isbn"] ?? '',
        upc: json["upc"] ?? '',
        diamondCode: json["diamondCode"] ?? '',
        ean: json["ean"] ?? '',
        issn: json["issn"] ?? '',
        format: json["format"] ?? '',
        pageCount: json["pageCount"] ?? 0,
        textObjects:
            List<dynamic>.from((json["textObjects"] ?? []).map((x) => x)),
        resourceUri: json["resourceURI"] ?? '',
        urls: List<Url>.from((json["urls"] ?? []).map((x) => Url.fromJson(x))),
        series: Series.fromJson(json["series"] ?? {}),
        variants: List<dynamic>.from((json["variants"] ?? []).map((x) => x)),
        collections:
            List<dynamic>.from((json["collections"] ?? []).map((x) => x)),
        collectedIssues:
            List<dynamic>.from((json["collectedIssues"] ?? []).map((x) => x)),
        dates:
            List<Date>.from((json["dates"] ?? []).map((x) => Date.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json["thumbnail"] ?? {}),
        images: List<dynamic>.from((json["images"] ?? []).map((x) => x)),
        creators: Creators.fromJson(json["creators"] ?? {}),
        characters: Characters.fromJson(json["characters"] ?? {}),
        stories: Stories.fromJson(json["stories"] ?? {}),
        events: Characters.fromJson(json["events"] ?? {}),
      );
}

class Characters {
  final int available;
  final String collectionUri;
  final List<Series> items;
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
        items: List<Series>.from(
            (json["items"] ?? []).map((x) => Series.fromJson(x))),
        returned: json["returned"] ?? 0,
      );
}

class Series {
  final String resourceUri;
  final String name;

  Series({
    required this.resourceUri,
    required this.name,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
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

class Date {
  final String type;
  final String date;

  Date({
    required this.type,
    required this.date,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: json["type"] ?? '',
        date: json["date"] ?? '',
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
