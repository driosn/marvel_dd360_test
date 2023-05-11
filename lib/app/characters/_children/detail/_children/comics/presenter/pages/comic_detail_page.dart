import 'package:flutter/material.dart';
import 'package:marvel_dd360_test/core/colors/colors.dart';

import '../../domain/entities/comic.dart';

class ComicDetailPage extends StatelessWidget {
  const ComicDetailPage({
    required this.comic,
    super.key,
  });

  final Comic comic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Hero(
          tag: 'name-${comic.id}',
          child: Text(comic.title),
        ),
      ),
      body: Hero(
        tag: comic.id,
        child: Container(
          margin: const EdgeInsets.all(32),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
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
                '${comic.thumbnail.path}.${comic.thumbnail.extension}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
