import 'dart:async';

import 'package:growpico_app/cores/presentation/error_enum.dart';

class ErrorEvent {
  final ErrorTypeEnum type;
  final String? message;
  
  ErrorEvent(this.type, this.message);
}

StreamController<ErrorEvent> globalErrorStreamController =
    StreamController<ErrorEvent>.broadcast();
