import 'dart:convert';

import 'package:core/core/error/data_failure.dart';
import 'package:core/layers/data/models/git_rep_model.dart';

import 'package:core/core/database.dart';
import 'package:core/layers/data/datasource/remote/git_rep_remote_datasource_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/git_rep_mock.dart';

void main() {
  late GitRepRemoteDataSourceImp datasource;
  late DataBase database;
  setUp(() {
    database = DataMock();
    datasource = GitRepRemoteDataSourceImp(dataBase: database);
  });
  test('Should be call the get function', () async {
    when(() => database.getRepositoryHttp())
        .thenAnswer((_) async => Right(jsonEncode(lalaMock())));

    var result = await datasource.load();

    expect(Right<DataFailure, List<GitRepModel>>(getGitRepMock()), result);
  });
}
