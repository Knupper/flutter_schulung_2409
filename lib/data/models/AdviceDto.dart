class AdviceDto {
  AdviceDto({
    required this.id,
    required this.advice,
  });

  final String advice;
  final int id;

  factory AdviceDto.fromJson(Map<String, dynamic> json) {
    return AdviceDto(
      id: json['id'],
      advice: json['advice'],
    );
  }
}
