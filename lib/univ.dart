class Univ {
  final String name;
  final List<String> webpages;
  Univ({
    required this.name,
    required this.webpages,
  });

  factory Univ.fromJson(Map<String, dynamic> json) {
    return Univ(
      name: json['name'] ?? 'Unknown name',
      webpages: List<String>.from(json['web_pages'] ?? []),);
  }

  toLowerCase() {}
}
