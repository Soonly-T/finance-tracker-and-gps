class CoordinatesOperations {
  final int? id;
  final String title;
  final double latitude;
  final double longitude;
  final String dateOfAddition;

  CoordinatesOperations({
    this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.dateOfAddition,
  });

  Map<String, dynamic> toMap() {
    return {
      "ID": id,
      "Title": title,
      "Latitude": latitude,
      "Longitude": longitude,
      "DateOfAddition": dateOfAddition,
    };
  }

  factory CoordinatesOperations.fromMap(Map<String, dynamic> map) {
    return CoordinatesOperations(
      id: map["ID"] as int?,
      title: map["Title"] as String,
      latitude: map["Latitude"] as double,
      longitude: map["Longitude"] as double,
      dateOfAddition: map["DateOfAddition"] as String,
    );
  }

  @override
  String toString() {
    return 'CoordinatesOperations(Title: $title, Latitude: $latitude, Longitude: $longitude, DateOfAddition: $dateOfAddition)';
  }
}
