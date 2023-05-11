import 'package:flutter/material.dart';

import '../../domain/entities/comic.dart';

class ComicCard extends StatelessWidget {
  const ComicCard({
    required this.comic,
    super.key,
  });

  final Comic comic;

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
            tag: comic.id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  4,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    '${comic.thumbnail.path}.${comic.thumbnail.extension}',
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
                    tag: 'name-${comic.id}',
                    child: Text(
                      comic.title,
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
