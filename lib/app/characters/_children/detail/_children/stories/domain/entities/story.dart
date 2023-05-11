import 'package:equatable/equatable.dart';

import '../../data/models/story_model.dart';

class Story extends Equatable {
  const Story({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.type,
    required this.modified,
    required this.creators,
    required this.characters,
    required this.series,
    required this.comics,
    required this.events,
    required this.originalIssue,
  });

  final int id;
  final String title;
  final String description;
  final String resourceUri;
  final String type;
  final String modified;
  final Creators creators;
  final Characters characters;
  final Characters series;
  final Characters comics;
  final Characters events;
  final OriginalIssue originalIssue;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        resourceUri,
        type,
        modified,
        creators,
        characters,
        series,
        comics,
        events,
        originalIssue,
      ];
}
