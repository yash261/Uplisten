class Audio {
  final String title;
  final String url;
  final String duration;

  Audio({
    required this.title,
    required this.duration,
    required this.url,
  });

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      title: json['title'],
      duration: json['duration'],
      url: json['url'],
    );
  }
}
