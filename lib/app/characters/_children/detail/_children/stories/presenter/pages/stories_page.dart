import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../../core/colors/colors.dart';
import '../../../../../../domain/entities/character.dart';
import '../bloc/stories_bloc.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  late StoriesBloc _storiesBloc;

  @override
  void initState() {
    _storiesBloc = Modular.get<StoriesBloc>();
    _storiesBloc.add(
      GetStoriesByCharacterIdEvent(characterId: widget.character.id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
      ),
      body: BlocProvider<StoriesBloc>.value(
        value: _storiesBloc,
        child: BlocBuilder<StoriesBloc, StoriesState>(
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
                    const Text('There was an error loading stories'),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.primary),
                      ),
                      onPressed: () {
                        _storiesBloc.add(
                          GetStoriesByCharacterIdEvent(
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
              final stories = state.stories;

              return ListView.builder(
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];
                  return ListTile(
                    onTap: () {},
                    title: Text(
                      story.title,
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
