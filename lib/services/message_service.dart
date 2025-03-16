import 'dart:async';

class MessageService {
  final StreamController<List<String>> _messageController = StreamController<List<String>>.broadcast();
  final List<String> _messages = []; // Lista para almacenar mensajes

  Stream<List<String>> get messagesStream => _messageController.stream;

  void addMessage(String message) {
    _messages.add(message); // Agregar nuevo mensaje a la lista
    _messageController.add(List.from(_messages)); // Emitir la lista completa
  }

  void dispose() {
    _messageController.close();
  }
}
