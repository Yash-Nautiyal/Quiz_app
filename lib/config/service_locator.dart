import 'package:brainstock/views/home/data/repositories/quiz_data_repositories.dart';
import 'package:brainstock/views/home/data/sources/remote_data_sources.dart';
import 'package:brainstock/views/home/domain/repositories/domain_quiz_repository.dart';
import 'package:brainstock/views/home/domain/usecases/quiz_fetch_usecase.dart';
import 'package:brainstock/views/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton<QuizRemoteDataSource>(
    () => QuizRemoteDataSourceImpl(
      client: getIt(),
    ),
  );
  getIt.registerLazySingleton<DomainQuizRepository>(
    () => QuizDataRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => QuizFetchUsecase(
      repository: getIt(),
    ),
  );
  getIt.registerFactory(
    () => HomeBloc(
      fetchQuizUseCase: getIt(),
    ),
  );
}
