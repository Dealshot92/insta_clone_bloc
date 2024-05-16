import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class HomePageChangedEvent extends HomeEvent {
  final int index;

  HomePageChangedEvent(this.index);

  @override
  List<Object?> get props => [];
}

class HomeAnimateToPageEvent extends HomeEvent {
  final int index;

  HomeAnimateToPageEvent(this.index);

  @override
  List<Object?> get props => [index];
}
