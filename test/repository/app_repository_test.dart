import 'package:betalent/repository/app_repository.dart';
import 'package:betalent/repository/i_app_repository.dart';
import 'package:betalent/utils/api_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../test_utils/file_utils.dart';

void main() {
  late IAppRepository repository;
  late String url;

  group('using mocked dio', () {
    late DioAdapter adapter;

    setUp(() {
      adapter =
          DioAdapter(dio: ApiUtils.dio, matcher: const UrlRequestMatcher());
      repository = AppRepository(adapter.dio);
    });

    group('getEmployees', () {
      url = 'employees';
      test('should return employee list when api returns a list', () async {
        final json = await FileUtils.loadJson('getEmployees.json');

        adapter.onPost(url, (server) => server.reply(200, json));

        final result = await repository.getEmployees();
        expect(result, hasLength(3));

        final employee = result.first;
        expect(employee.id, '1');
        expect(employee.name, "João");
        expect(employee.job, "Back-end");
        expect(
            employee.admissionDate, DateTime.parse('2019-12-02T00:00:00.000Z'));
        expect(employee.phone, "5551234567890");
        expect(employee.imageUrl, "joaoImageUrl");
      });
      test('should return empty list when api returns empty', () async {
        adapter.onPost(url, (server) => server.reply(200, []));

        final result = await repository.getEmployees();
        expect(result.isEmpty, isTrue);
      });
    });
  });
}
