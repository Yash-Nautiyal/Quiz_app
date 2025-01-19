import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brainstock/views/home/domain/entities/quiz_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/quiz_fetch_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final QuizFetchUsecase fetchQuizUseCase;

  HomeBloc({
    required this.fetchQuizUseCase,
  }) : super(HomeInitial()) {
    on<HomeFetchQuizEvent>(_homeFetchQuizEvent);
  }

  FutureOr<void> _homeFetchQuizEvent(
      HomeFetchQuizEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final result = await fetchQuizUseCase();
    result.fold(
      (failure) => emit(HomeLoadingFailure(message: "Failed to fetch quiz")),
      (quiz) => emit(HomeLoadingSuccess(quiz: quiz)),
    );
  }
}
