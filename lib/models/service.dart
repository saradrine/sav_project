class Service {
  final String nom;
  final String? description;

  Service({
    required this.nom,
    required this.description,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      nom: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': nom,
      'description': description,
    };
  }
}
