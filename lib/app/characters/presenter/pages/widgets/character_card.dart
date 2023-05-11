import 'package:flutter/material.dart';

import '../../../domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
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
            tag: character.id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                    '${character.thumbnail.path}.${character.thumbnail.extension}',
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
                    tag: 'name-${character.id}',
                    child: Text(
                      character.name,
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
