part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoadingSuccess extends HomeState {
  final QuizEntity quiz;
  HomeLoadingSuccess({required this.quiz});

  @override
  List<Object?> get props => [quiz];
}

class HomeLoadingFailure extends HomeState {
  final String message;
  HomeLoadingFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
