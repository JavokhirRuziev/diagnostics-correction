class AppState {
  final String? gender;
  final int? age;
  final String characterNumber;
  final String characterLook;
  final String characterColor;
  final String mainImage;
  final String? transport;
  final String? phone;
  final String? profession;

  AppState({
    this.transport,
    this.phone,
    this.profession,
    this.gender,
    this.age,
    this.characterLook = "first",
    this.characterColor = "blue",
    this.characterNumber = "first_boy",
  }) : mainImage = "assets/images/$characterNumber/$characterLook/$characterColor.png";

  AppState copyWith({
    String? transport,
    String? phone,
    String? profession,
    String? gender,
    int? age,
    String? characterNumber,
    String? characterLook,
    String? characterColor,
  }) {
    return AppState(
      transport: transport ?? this.transport,
      phone: phone ?? this.phone,
      profession: profession ?? this.profession,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      characterNumber: characterNumber ?? this.characterNumber,
      characterLook: characterLook ?? this.characterLook,
      characterColor: characterColor ?? this.characterColor,
    );
  }
}
