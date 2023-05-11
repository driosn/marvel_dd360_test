import 'package:equatable/equatable.dart';

import '../../data/models/serie_model.dart';

class Serie extends Equatable {
  const Serie({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.urls,
    required this.startYear,
    required this.endYear,
    required this.rating,
    required this.type,
    required this.modified,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.comics,
    required this.events,
  });

  final int id;
  final String title;
  final String description;
  final String resourceUri;
  final List<Url> urls;
  final int startYear;
  final int endYear;
  final String rating;
  final String type;
  final String modified;
  final Thumbnail thumbnail;
  final Creators creators;
  final Characters characters;
  final Stories stories;
  final Characters comics;
  final Characters events;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceUri,
        urls,
        startYear,
        endYear,
        rating,
        type,
        modified,
        thumbnail,
        creators,
        characters,
        stories,
        comics,
        events,
      ];
}
