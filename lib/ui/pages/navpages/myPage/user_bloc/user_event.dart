part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {}

