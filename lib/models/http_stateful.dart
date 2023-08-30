import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpStateFull {
  String? id, name, job, createdAt;
  HttpStateFull({
    this.id,
    this.createdAt,
    this.name,
    this.job,
  });

  static Future<HttpStateFull> connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");
    var hasilResponse = await http.post(
      url,
      body: {
        'name': name,
        'job': job,
      },
    );
    var data = json.decode(hasilResponse.body);
    return HttpStateFull(
      id: data['id'],
      createdAt: data['createdAt'],
      name: data['name'],
      job: data['job'],
    );
  }
}
