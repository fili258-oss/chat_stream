import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:stream_controller/chat/components/notification_badge.dart';
import 'package:stream_controller/services/message_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final MessageService _messageService = MessageService();
  int _counter = 0;

    @override
  void initState() {
    super.initState();

    // Simular la llegada de notificaciones cada 3 segundos
    Timer.periodic(Duration(seconds: 3), (timer) {
      _counter++;
      _messageService
          .addMessage(_counter); // Emitir nueva notificación
    });
  }

  @override
  void dispose() {
    // Cerrar el servicio cuando el widget se elimina
    _messageService.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text('Chat en tiempo real'),
        actions: [
          // Widget 1: Contador de notificaciones en la barra de navegación
          //NotificationBadge(notificationService: _notificationService),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notificaciones recibidas:',
              style: TextStyle(fontSize: 20),
            ),
            // Widget 2: Lista de notificaciones
            //NotificationList(notificationService: _notificationService),
          ],
        ),
      ),
    );
  }
}