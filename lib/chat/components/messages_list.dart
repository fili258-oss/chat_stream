import 'package:flutter/material.dart';
import 'package:stream_controller/services/message_service.dart';

class MessagesList extends StatelessWidget {
  final MessageService messageService;

  const MessagesList({super.key, required this.messageService});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<String>>(
        stream: messageService.messagesStream, // Usamos el stream de mensajes
        initialData: [],
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay mensajes aún"));
          }
          final messages = snapshot.data!;
          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(messages[index]),
              );
            },
          );
        },
      ),
    );
  }
}
