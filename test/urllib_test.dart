import 'package:urllib/urllib.dart';
import 'package:test/test.dart';

void main() {
  group('urllib tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('urllib.request.urlopen should work', () async {
      final response = await urllib.request.urlopen('https://xiaoa.name');
      expect(response, isNotEmpty);
    });
  });
}
