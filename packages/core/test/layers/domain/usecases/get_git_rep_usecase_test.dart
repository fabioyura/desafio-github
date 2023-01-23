import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/repositories/i_git_rep_repository.dart';
import 'package:core/layers/domain/usecases/get_git_rep_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/git_rep_mock.dart';

void main() {
  late IGitRepRepository repository;
  late GetGitRepUseCase usecase;

  setUp(() {
    repository = GitRepMockRepository();
    usecase = GetGitRepUseCase(repository: repository);
  });
  group('Get GitRep Use Case Test', () {
    test('Should be return GitRepModel when Load Usecase', () async {
      final expected = gitRepMockEntity;
      when(() => repository.load()).thenAnswer((_) async => Right(expected));
      final result = await usecase();

      expect(result, Right(expected));
    });

    test('Should be return Failure when NOT Load GitRep Usecase', () async {
      const expected = Failure(message: '');
      when(() => repository.load())
          .thenAnswer((_) async => const Left(expected));
      final result = await usecase();
      expect(result, const Left(expected));
    });
  });
}
