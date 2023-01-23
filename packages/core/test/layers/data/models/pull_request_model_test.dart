import 'dart:convert';

import 'package:core/layers/data/models/pull_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/pull_request_mock.dart';

void main() {
  late PullRequestModel model;
  late Map<dynamic, dynamic> map;
  setUp(() {
    model = pullRequestMockModel;
    map = pullRequestMockMap();
  });
  group('Pull Request Model Test', () {
    test('Should return PR Model fromMap', () {
      var result = PullRequestModel.fromMap(jsonDecode(pullRequestMockJson));
      expect(result, model);
    });

    test('Should convert PR Model to Map', () {
      expect(map, model.toMap());
    });
  });
}
