import 'package:equatable/equatable.dart';

import '../../data/models/event_model.dart';

class Event extends Equatable {
  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.urls,
    required this.modified,
    required this.start,
    required this.end,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.comics,
    required this.series,
    required this.next,
    required this.previous,
  });

  final int id;
  final String title;
  final String description;
  final String resourceUri;
  final List<Url> urls;
  final String modified;
  final DateTime start;
  final DateTime end;
  final Thumbnail thumbnail;
  final Creators creators;
  final Characters characters;
  final Stories stories;
  final Characters comics;
  final Characters series;
  final Next next;
  final Next previous;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceUri,
        urls,
        modified,
        start,
        end,
        thumbnail,
        creators,
        characters,
        stories,
        comics,
        series,
        next,
        previous,
      ];
}
