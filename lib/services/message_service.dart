import 'dart:async';

class MessageService {
  // Crear un Broadcast StreamController
  final StreamController<int> _messageController = StreamController<int>.broadcast();
  

  // Método para obtener el Stream
  Stream<int> get notificationStream => _messageController.stream;

  // Método para agregar nuevas notificaciones
  void addMessage(int count) {
    _messageController.add(count);
  }

  // Cerrar el StreamController cuando ya no sea necesario
  void dispose() {
    _messageController.close();
  }
}