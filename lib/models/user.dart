class User {
  final String id;
  final String avatar;
  final Stats stats;
  final String username;

  User({
    required this.id,
    required this.avatar,
    required this.stats,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      avatar: json['avatar'] ?? '',
      stats: Stats.fromJson(json['stats'] ?? {}),
      username: json['username'] ?? '',
    );
  }
}

class Stats {
  final int likesReceived;
  final int routesCompleted;
  final int routesCreated;
  final int totalKilometers;

  Stats({
    required this.likesReceived,
    required this.routesCompleted,
    required this.routesCreated,
    required this.totalKilometers,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      likesReceived: json['likesRebuts'] ?? 0,
      routesCompleted: json['rutesCompletades'] ?? 0,
      routesCreated: json['rutesCreades'] ?? 0,
      totalKilometers: json['totalKm'] ?? 0,
    );
  }
}
