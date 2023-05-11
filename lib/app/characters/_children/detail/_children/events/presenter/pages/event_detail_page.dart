import 'package:flutter/material.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/domain/entities/event.dart';
import 'package:marvel_dd360_test/core/colors/colors.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({
    required this.event,
    super.key,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Hero(
          tag: 'name-${event.id}',
          child: Text(event.title),
        ),
      ),
      body: Hero(
        tag: event.id,
        child: Container(
          margin: const EdgeInsets.all(32),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
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
                '${event.thumbnail.path}.${event.thumbnail.extension}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
