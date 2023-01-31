import 'package:core/core/bloc/git_rep_bloc/git_rep_bloc.dart';
import 'package:core/core/database.dart';
import 'package:core/layers/data/datasource/i_git_rep_datasource.dart';
import 'package:core/layers/data/datasource/i_pull_request_datasource.dart';
import 'package:core/layers/data/datasource/remote/git_rep_remote_datasource_imp.dart';
import 'package:core/layers/data/datasource/remote/pull_request_remote_datasource_imp.dart';
import 'package:core/layers/data/repositories/git_rep_repository_imp.dart';
import 'package:core/layers/domain/repositories/i_git_rep_repository.dart';
import 'package:core/layers/domain/usecases/get_git_rep_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerLazySingleton<DataBase>(() => DataBase());

  getIt.registerLazySingleton<IGitRepDatasource>(
      () => GitRepRemoteDataSourceImp(dataBase: getIt<DataBase>()));
  getIt.registerLazySingleton<IGitRepRepository>(
      () => GitRepRepositoryImp(datasource: getIt<IGitRepDatasource>()));
  getIt.registerLazySingleton(
      () => GetGitRepUseCase(repository: getIt<IGitRepRepository>()));

  getIt.registerLazySingleton<GitRepBloc>(
      () => GitRepBloc(loadCase: getIt<GetGitRepUseCase>()));
}
