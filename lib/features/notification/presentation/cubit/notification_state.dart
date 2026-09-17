part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationReceived extends NotificationState {
  final NotificationContentEntity content;

  const NotificationReceived(this.content);

  @override
  List<Object> get props => [content];
}

class NotificationBackgroundOpened extends NotificationState {
  final NotificationContentEntity content;

  const NotificationBackgroundOpened(this.content);

  @override
  List<Object> get props => [content];
}

class NotificationForegroundOpened extends NotificationState {
  final NotificationContentEntity content;

  const NotificationForegroundOpened(this.content);

  @override
  List<Object> get props => [content];
}

class NotificationDisplay extends NotificationState {}

class NotificationError extends NotificationState {}

class NotificationTerminatedOpened extends NotificationState {
  final NotificationContentEntity content;

  const NotificationTerminatedOpened(this.content);

  @override
  List<Object> get props => [content];
}

class NotificationTokenChanges extends NotificationState {
  final String token;

  const NotificationTokenChanges(this.token);

  @override
  List<Object> get props => [token];
}
