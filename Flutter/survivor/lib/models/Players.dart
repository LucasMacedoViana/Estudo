class Players{
  final String id;
  final String name;
  final int points;

  Players({required this.id,required this.name, this.points = 0});

  factory Players.fromJson(Map<String, dynamic> json) {
    return Players(
      id: json['id'],
      name: json['name'],
      points: json['points'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'points': points,
  };

  Players copyWith({
    String? id,
    String? name,
    int? points,
  }) {
    return Players(
      id: id ?? this.id,
      name: name ?? this.name,
      points: points ?? this.points,
    );
  }
}