import 'package:http/http.dart' as http;

class LoripsumApu {
  static Future<String> getLoripsum() async {
    var url = "https://loripsum.net/api";

    var response = await http.get(url);

    String text = response.body;

    print(response.body);

    text = text.replaceAll("<p>", "");

    text = text.replaceAll("</p>", "");

    return text;
  }
}
