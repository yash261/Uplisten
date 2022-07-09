class Reader {
  final String readerId;
  final String displayName;

  Reader({
    required this.readerId,
    required this.displayName,
  });

  factory Reader.fromJson(Map<String, dynamic> json) {
    return Reader(
      readerId: json['reader_id'],
      displayName: json['display_name'],
    );
  }
}
