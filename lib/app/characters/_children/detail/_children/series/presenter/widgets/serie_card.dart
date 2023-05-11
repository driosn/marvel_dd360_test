import 'package:flutter/material.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/series/domain/entities/serie.dart';

class SerieCard extends StatelessWidget {
  const SerieCard({required this.serie, super.key});

  final Serie serie;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            tag: serie.id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  4,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    '${serie.thumbnail.path}.${serie.thumbnail.extension}',
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
                    tag: 'name-${serie.id}',
                    child: Text(
                      serie.title,
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
    );
  }
}
