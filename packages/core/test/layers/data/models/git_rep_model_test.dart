import 'dart:convert';

import 'package:core/layers/data/models/git_rep_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../mocks/git_rep_mock.dart';

void main() {
  late GitRepModel model;
  late Map<dynamic, dynamic> map;
  setUp(() {
    model = gitRepMockModel;
    map = gitRepMockToMap();
  });
  group('Git Repository Model Test', () {
    test('Should return GitRepModel from Map', () {
      final result = GitRepModel.fromMap(jsonDecode(gitRepMockFromJson));
      expect(model, result);
    });

    test('Should return GitRepModel to Map', () async {
      expect(map, model.toMap());
    });
  });
}
