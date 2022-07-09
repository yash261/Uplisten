class Author {
  final String id;
  final String fName;
  final String lName;
  final String dob;
  final String dod;

  Author({
    required this.id,
    required this.fName,
   required  this.lName,
   required  this.dob,
    required this.dod,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      fName: json['first_name'],
      lName: json['last_name'],
      dob: json['dob'],
      dod: json['dod'],
    );
  }
}
