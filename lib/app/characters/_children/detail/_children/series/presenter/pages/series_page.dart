// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/series/presenter/widgets/serie_card.dart';
import '../../../../../../../../core/colors/colors.dart';
import '../../../../../../domain/entities/character.dart';
import '../../../series/presenter/bloc/series_bloc.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  late SeriesBloc _seriesBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    _seriesBloc = Modular.get<SeriesBloc>();
    _seriesBloc.add(
      GetSeriesByCharacterIdEvent(
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
      _seriesBloc.add(
        GetNextSeriesByCharacterIdEvent(
          characterId: widget.character.id,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider<SeriesBloc>.value(
          value: _seriesBloc,
          child: BlocBuilder<SeriesBloc, SeriesState>(
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
                          _seriesBloc.add(
                            GetSeriesByCharacterIdEvent(
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
                final series = state.series;

                return GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: series.length,
                  itemBuilder: (context, index) {
                    final serie = series[index];
                    return GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed(
                          'serie/detail/',
                          arguments: serie,
                        );
                      },
                      child: SerieCard(
                        serie: serie,
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
