import 'package:urllib/src/dynamic_object.dart';
import 'package:http/http.dart' as http;

// 创建 urllib 的方法
DynamicObject createUrlLib() {
  var urllib = DynamicObject();
  var request = DynamicObject();

  // urlopen
  request.addMethod('urlopen', (String url) async {
    final response = await http.get(Uri.parse(url));
    return response.body;
  });

  // post
  request.addMethod('post', (String url, {Map<String, dynamic>? data}) async {
    final response = await http.post(
      Uri.parse(url),
      body: data,
    );
    return response.body;
  });

  urllib.addMethod('request', () => request);

  return urllib;
}
