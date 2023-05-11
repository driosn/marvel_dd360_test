import 'package:equatable/equatable.dart';

import '../../data/models/character_model.dart';

class Character extends Equatable {
  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  final int id;
  final String name;
  final String description;
  final String modified;
  final Thumbnail thumbnail;
  final String resourceUri;
  final Comics comics;
  final Comics series;
  final Stories stories;
  final Comics events;
  final List<Url> urls;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        modified,
        thumbnail,
        resourceUri,
        comics,
        series,
        stories,
        events,
        urls,
      ];
}
