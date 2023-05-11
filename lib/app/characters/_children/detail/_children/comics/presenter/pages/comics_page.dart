import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/presenter/widgets/comic_card.dart';

import '../../../../../../../../core/colors/colors.dart';
import '../../../../../../domain/entities/character.dart';
import '../bloc/bloc/comics_bloc.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({required this.character, super.key});

  final Character character;

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  late ComicsBloc _comicsBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    _comicsBloc = Modular.get<ComicsBloc>();
    _comicsBloc.add(
      GetComicsByCharacterIdEvent(
        characterId: widget.character.id,
      ),
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
      _comicsBloc.add(
        GetNextComicsByCharacterIdEvent(
          characterId: widget.character.id,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comics'),
      ),
      body: BlocProvider<ComicsBloc>.value(
        value: _comicsBloc,
        child: BlocBuilder<ComicsBloc, ComicsState>(
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
                    const Text('There was an error loading comics'),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.primary),
                      ),
                      onPressed: () {
                        _comicsBloc.add(
                          GetComicsByCharacterIdEvent(
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
              final comics = state.comics;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: comics.length,
                  itemBuilder: (context, index) {
                    final comic = comics[index];
                    return GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed(
                          'comics/detail/',
                          arguments: comic,
                        );
                      },
                      child: ComicCard(
                        comic: comic,
                      ),
                    );
                  },
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
