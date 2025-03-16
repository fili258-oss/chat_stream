import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stream_controller/chat/components/messages_list.dart';
import 'package:stream_controller/chat/components/notification_badge.dart';
import 'package:stream_controller/services/message_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final MessageService _messageService = MessageService();

  @override
  void initState() {
    super.initState();

    // Simular la llegada de mensajes cada 5 segundos
    Timer.periodic(const Duration(seconds: 5), (timer) { 
      _messageService.addMessage("Mensaje automático ${DateTime.now().second}");
    });
  }

  @override
  void dispose() {
    _messageService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat en tiempo real'),
        actions: [
          // Widget 1: Contador de mensajes en la barra de navegación
          NotificationBadge(messageService: _messageService),
        ],
      ),

      body: Column(
        children: [
          const Text('Mensajes recibidos:', style: TextStyle(fontSize: 20)),
          MessagesList(messageService: _messageService),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Escribe un mensaje...',                
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  _messageService.addMessage(value);
                  _textController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
