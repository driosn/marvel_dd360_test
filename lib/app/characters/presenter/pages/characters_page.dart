import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/presenter/pages/widgets/character_card.dart';
import 'package:marvel_dd360_test/core/colors/colors.dart';

import '../bloc/characters_bloc.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late CharactersBloc _chacactersBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    _chacactersBloc = Modular.get<CharactersBloc>();
    _chacactersBloc.add(const GetCharactersEvent());

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
      _chacactersBloc.add(
        const GetNextCharactersEvent(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Characters'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        child: BlocProvider<CharactersBloc>.value(
          value: _chacactersBloc,
          child: BlocBuilder<CharactersBloc, CharactersState>(
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
                      const Text('There was an error loading characters'),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.primary),
                        ),
                        onPressed: () {
                          _chacactersBloc.add(const GetCharactersEvent());
                        },
                        child: const Text('Retry'),
                      )
                    ],
                  ),
                );
              }

              if (state.isLoaded) {
                final characters = state.characters;

                return Stack(
                  children: [
                    GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: characters.length,
                      itemBuilder: (context, index) {
                        final character = characters[index];
                        return GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed(
                              'detail/',
                              arguments: character,
                            );
                          },
                          child: CharacterCard(
                            character: character,
                          ),
                        );
                      },
                    ),
                  ],
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
