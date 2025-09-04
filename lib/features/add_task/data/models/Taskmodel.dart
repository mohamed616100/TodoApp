class Taskmodel {
  String? id; // document id
  final String title;
  final String description;
  final String group;
  final String status;
  final String date;
  final String? photoUrl;

  Taskmodel({
    this.id,
    this.photoUrl,
    required this.title,
    required this.description,
    required this.group,
    this.status = "In Progress",
    required this.date,
  });

  /// from Firebase
  factory Taskmodel.fromJson(Map<String, dynamic> json, {String? id}) {
    return Taskmodel(
      id: id,
      photoUrl: json['photoUrl'],
      title: json['Title'],
      description: json['Description'],
      group: json['Group'],
      status: json['Status'] ?? "In Progress",
      date: json['Date'],
    );
  }

  /// to Firebase
  Map<String, dynamic> toJson() {
    return {
      "photoUrl": photoUrl,
      "Title": title,
      "Description": description,
      "Group": group,
      "Date": date,
      "Status": status,
    };
  }

  /// copyWith method
  Taskmodel copyWith({
    String? id,
    String? title,
    String? description,
    String? group,
    String? status,
    String? date,
    String? photoUrl,
  }) {
    return Taskmodel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      group: group ?? this.group,
      status: status ?? this.status,
      date: date ?? this.date,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
