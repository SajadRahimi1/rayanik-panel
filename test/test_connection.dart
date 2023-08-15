import 'package:flutter_test/flutter_test.dart';
import 'package:rayanik_panel/core/constants/urls.dart';
import 'package:rayanik_panel/core/services/connect_instance.dart';

void main() {
  test('test connection', () async {
    final request = await getConnect.get(getCoursesUrl);
    print(request.body.toString());
  });
}
