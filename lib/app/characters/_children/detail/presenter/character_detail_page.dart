import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/domain/entities/character.dart';
import 'package:marvel_dd360_test/core/colors/colors.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Hero(
          tag: 'name-${character.id}',
          child: Text(character.name),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Hero(
              tag: character.id,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 5,
                    )
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                      '${character.thumbnail.path}.${character.thumbnail.extension}',
                    ),
                  ),
                ),
              ),
            ),
            if (character.description.isNotEmpty) ...[
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  character.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
            const SizedBox(
              height: 72,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        _optionButton(
                          label: 'Comics',
                          onTap: () {
                            Modular.to.pushNamed(
                              'comics/',
                              arguments: character,
                            );
                          },
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        _optionButton(
                          label: 'Events',
                          onTap: () {
                            Modular.to.pushNamed(
                              'events/',
                              arguments: character,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        _optionButton(
                          label: 'Series',
                          onTap: () {
                            Modular.to.pushNamed(
                              'series/',
                              arguments: character,
                            );
                          },
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        _optionButton(
                            label: 'Stories',
                            onTap: () {
                              Modular.to.pushNamed(
                                'stories/',
                                arguments: character,
                              );
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(
            AppColors.primary.withOpacity(0.1),
          ),
          shadowColor: const MaterialStatePropertyAll(AppColors.primary),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: onTap,
        child: SizedBox(
          height: 60,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
