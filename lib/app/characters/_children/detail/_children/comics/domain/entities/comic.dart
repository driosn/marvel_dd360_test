import 'package:equatable/equatable.dart';

import '../../data/models/comic_model.dart';

class Comic extends Equatable {
  const Comic({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceUri,
    required this.urls,
    required this.series,
    required this.variants,
    required this.collections,
    required this.collectedIssues,
    required this.dates,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  final int id;
  final int digitalId;
  final String title;
  final int issueNumber;
  final String variantDescription;
  final String description;
  final String modified;
  final String isbn;
  final String upc;
  final String diamondCode;
  final String ean;
  final String issn;
  final String format;
  final int pageCount;
  final List<dynamic> textObjects;
  final String resourceUri;
  final List<Url> urls;
  final Series series;
  final List<dynamic> variants;
  final List<dynamic> collections;
  final List<dynamic> collectedIssues;
  final List<Date> dates;
  final Thumbnail thumbnail;
  final List<dynamic> images;
  final Creators creators;
  final Characters characters;
  final Stories stories;
  final Characters events;

  @override
  List<Object?> get props => [
        id,
        digitalId,
        title,
        issueNumber,
        variantDescription,
        description,
        modified,
        isbn,
        upc,
        diamondCode,
        ean,
        issn,
        format,
        pageCount,
        textObjects,
        resourceUri,
        urls,
        series,
        variants,
        collections,
        collectedIssues,
        dates,
        thumbnail,
        images,
        creators,
        characters,
        stories,
        events,
      ];
}
