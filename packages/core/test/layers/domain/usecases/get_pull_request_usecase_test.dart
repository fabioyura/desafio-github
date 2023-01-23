import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/repositories/i_pull_request_repository.dart';
import 'package:core/layers/domain/usecases/get_pull_request_usecase.dart';
import '../../../mocks/pull_request_mock.dart';

void main() {
  late IPullRequestRepository repository;
  late GetPullRequestUseCase useCase;

  setUp(() {
    repository = PullRequestMockRepository();
    useCase = GetPullRequestUseCase(repository: repository);
  });
  group('Get PullRequest Use Case Test', () {
    test('Should be return PullRequest Entity when Load UseCase', () async {
      final expected = pullRequestMockEntity;
      when(() => repository.load()).thenAnswer((_) async => Right(expected));
      final result = await useCase();
      expect(result, Right(expected));
    });

    test('Should be return Failure when PullRequest NOT Load UseCase ',
        () async {
      const expected = Failure(message: '');
      when(() => repository.load())
          .thenAnswer((_) async => const Left(expected));
      final result = await useCase();
      expect(result, const Left(expected));
    });
  });
}
