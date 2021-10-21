import 'dart:convert';

Api apiFromJson(String str) => Api.fromJson(json.decode(str));

String apiToJson(Api data) => json.encode(data.toJson());

class Api {
  Api({
    required this.url,
    required this.facts,
  });

  String url;
  String facts;

  factory Api.fromJson(Map<String, dynamic> json) => Api(
        url: json["url"],
        facts: json["facts"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "facts": facts,
      };
}
