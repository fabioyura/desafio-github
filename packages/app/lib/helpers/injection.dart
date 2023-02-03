import 'package:core/core/bloc/git_rep_bloc/git_rep_bloc.dart';
import 'package:core/core/bloc/pr_bloc/pr_bloc.dart';
import 'package:core/core/database.dart';
import 'package:core/layers/data/datasource/i_git_rep_datasource.dart';
import 'package:core/layers/data/datasource/i_pull_request_datasource.dart';
import 'package:core/layers/data/datasource/remote/git_rep_remote_datasource_imp.dart';
import 'package:core/layers/data/datasource/remote/pull_request_remote_datasource_imp.dart';
import 'package:core/layers/data/repositories/git_rep_repository_imp.dart';
import 'package:core/layers/data/repositories/pull_request_repository_imp.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/layers/domain/repositories/i_git_rep_repository.dart';
import 'package:core/layers/domain/repositories/i_pull_request_repository.dart';
import 'package:core/layers/domain/usecases/get_git_rep_usecase.dart';
import 'package:core/layers/domain/usecases/get_pull_request_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerLazySingleton<DataBase>(() => DataBase());

  getIt.registerLazySingleton<IGitRepDatasource>(
      () => GitRepRemoteDataSourceImp(dataBase: getIt<DataBase>()));
  getIt.registerLazySingleton<IGitRepRepository>(
      () => GitRepRepositoryImp(datasource: getIt<IGitRepDatasource>()));
  getIt.registerLazySingleton<GetGitRepUseCase>(
      () => GetGitRepUseCase(repository: getIt<IGitRepRepository>()));
  getIt.registerLazySingleton<GitRepBloc>(
      () => GitRepBloc(loadCase: getIt<GetGitRepUseCase>()));

  //getIt.registerLazySingleton<IPullRequestDataSource>(
  //    () => PullRequestRemoteDataSourceImp());
  //getIt.registerLazySingleton<IPullRequestRepository>(() =>
  //    PullRequestRepositoryImp(dataSource: getIt<IPullRequestDataSource>()));
  //getIt.registerLazySingleton<GetPullRequestUseCase>(
  //    () => GetPullRequestUseCase(repository: getIt<IPullRequestRepository>()));
  //getIt.registerLazySingleton<PrBloc>(() =>
  //    PrBloc(loadCase: getIt<GetPullRequestUseCase>(), rep: getIt<GitRep>()));
}
