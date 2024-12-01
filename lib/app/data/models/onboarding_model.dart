// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OnboardingModel {
  final String image;
  final String title;
  OnboardingModel({
    required this.image,
    required this.title,
  });

  OnboardingModel copyWith({
    String? image,
    String? title,
  }) {
    return OnboardingModel(
      image: image ?? this.image,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
    };
  }

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      image: map['image'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OnboardingModel(image: $image, title: $title)';

  @override
  bool operator ==(covariant OnboardingModel other) {
    if (identical(this, other)) return true;

    return other.image == image && other.title == title;
  }

  @override
  int get hashCode => image.hashCode ^ title.hashCode;
}
