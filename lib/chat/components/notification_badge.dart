import 'package:flutter/material.dart';
import 'package:stream_controller/services/message_service.dart';

class NotificationBadge extends StatelessWidget {
  final MessageService messageService;

  const NotificationBadge({
    super.key,
    required this.messageService,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      stream: messageService.messagesStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 16.0),
            child: Badge(
              label: Text('${snapshot.data?.length ?? 0}'),
              child: Icon(Icons.notifications),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications),
          );
        }
      },
    );
  }
}
