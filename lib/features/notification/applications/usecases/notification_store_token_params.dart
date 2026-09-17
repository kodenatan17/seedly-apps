import 'package:equatable/equatable.dart';

class NotificationStoreTokenParams extends Equatable {
  final String token;

  const NotificationStoreTokenParams(this.token);

  @override
  List<Object?> get props => [token];
}
