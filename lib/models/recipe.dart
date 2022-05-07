class Recipe {
  final String name;
  final String category;
  final String url;
  final String source;

  Recipe({
    required this.name,
    required this.category,
    required this.url,
    required this.source,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['title'] ?? '',
      category: json['category'] ?? '',
      url: json['url'] ?? '',
      source: json['source'] ?? '',
    );
  }
}
