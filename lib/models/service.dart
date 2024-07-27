class Service {
  final int id;
  final String nom;
  final String? description;

  Service({
    required this.id,
    required this.nom,
    required this.description,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: int.parse(json['id']),
      nom: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': nom,
      'description': description,
    };
  }
}
