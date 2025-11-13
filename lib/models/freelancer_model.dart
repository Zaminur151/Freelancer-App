class Freelancer {
  final int id;
  final String username;
  final String name;
  final String image;
  final String title;
  final bool isPromoted;
  final bool isVerified;
  final bool isOnline;
  final Location location;
  final String experienceLevel;
  final double hourlyRate;
  final String freelancerLevel;
  final String levelImage;
  final Statistics statistics;
  final String memberSince;

  Freelancer({
    required this.id,
    required this.username,
    required this.name,
    required this.image,
    required this.title,
    required this.isPromoted,
    required this.isVerified,
    required this.isOnline,
    required this.location,
    required this.experienceLevel,
    required this.hourlyRate,
    required this.freelancerLevel,
    required this.levelImage,
    required this.statistics,
    required this.memberSince,
  });

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      isPromoted: json['is_promoted'] ?? false,
      isVerified: json['is_verified'] ?? false,
      isOnline: json['is_online'] ?? false,
      location: Location.fromJson(json['location'] ?? {}),
      experienceLevel: json['experience_level'] ?? '',
      hourlyRate: (json['hourly_rate'] ?? 0).toDouble(),
      freelancerLevel: json['freelancer_level'] ?? '',
      levelImage: json['level_image'] ?? '',
      statistics: Statistics.fromJson(json['statistics'] ?? {}),
      memberSince: json['member_since'] ?? '',
    );
  }
}

class Location {
  final String country;
  final String state;

  Location({
    required this.country,
    required this.state,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'] ?? '',
      state: json['state'] ?? '',
    );
  }
}

class Statistics {
  final int totalOrders;
  final int totalReviews;
  final double averageRating;

  Statistics({
    required this.totalOrders,
    required this.totalReviews,
    required this.averageRating,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      totalOrders: json['total_orders'] ?? 0,
      totalReviews: json['total_reviews'] ?? 0,
      averageRating: (json['average_rating'] ?? 0).toDouble(),
    );
  }
}
