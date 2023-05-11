import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/presenter/bloc/events_bloc.dart';

import '../../../../../../../../core/colors/colors.dart';
import '../../../../../../domain/entities/character.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({required this.character, super.key});

  final Character character;

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late EventsBloc _eventsBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    _eventsBloc = Modular.get<EventsBloc>();
    _eventsBloc.add(
      GetEventsByCharacterIdEvent(characterId: widget.character.id),
    );

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
    if (_scrollController.position.pixels > nextPageTrigger) {
      _eventsBloc.add(
        GetNextEventsByCharacterIdEvent(
          characterId: widget.character.id,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider<EventsBloc>.value(
          value: _eventsBloc,
          child: BlocBuilder<EventsBloc, EventsState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.isFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('There was an error loading events'),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.primary),
                        ),
                        onPressed: () {
                          _eventsBloc.add(
                            GetEventsByCharacterIdEvent(
                              characterId: widget.character.id,
                            ),
                          );
                        },
                        child: const Text('Retry'),
                      )
                    ],
                  ),
                );
              }

              if (state.isLoaded) {
                final events = state.events;

                return GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed(
                          'events/detail/',
                          arguments: event,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(3, 3),
                              color: Colors.black26,
                              blurRadius: 3,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            Hero(
                              tag: event.id,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    4,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      '${event.thumbnail.path}.${event.thumbnail.extension}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  width: double.infinity,
                                  height: 36,
                                  color: Colors.black87.withOpacity(0.65),
                                  child: Center(
                                    child: Hero(
                                      tag: 'name-${event.id}',
                                      child: Text(
                                        event.title,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
