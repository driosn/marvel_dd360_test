import 'package:flutter/material.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/series/data/models/serie_model.dart';
import 'package:marvel_dd360_test/core/colors/colors.dart';

class SerieDetailPage extends StatelessWidget {
  const SerieDetailPage({
    required this.serie,
    super.key,
  });

  final SerieModel serie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          title: Hero(
            tag: 'name-${serie.id}',
            child: Text(serie.title),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: serie.id,
                child: Container(
                  margin: const EdgeInsets.all(32),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [],
                    image: DecorationImage(
                      image: NetworkImage(
                        '${serie.thumbnail.path}.${serie.thumbnail.extension}',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              if (serie.description.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    serie.description,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ]
            ],
          ),
        ));
  }
}
