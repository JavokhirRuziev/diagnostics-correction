abstract class AppEvent {}

class SelectGender extends AppEvent {
  final String gender;
  SelectGender(this.gender);
}

class SelectAge extends AppEvent {
  final int age;
  SelectAge(this.age);
}

class UpdateCharacterNumber extends AppEvent {
  final String characterNumber;
  UpdateCharacterNumber(this.characterNumber);
}

class UpdateCharacterLook extends AppEvent {
  final String characterLook;
  UpdateCharacterLook(this.characterLook);
}

class UpdateCharacterColor extends AppEvent {
  final String characterColor;
  UpdateCharacterColor(this.characterColor);
}

class UpdateTransport extends AppEvent {
  final String transport;
  UpdateTransport(this.transport);
}

class UpdatePhone extends AppEvent {
  final String phone;
  UpdatePhone(this.phone);
}

class UpdateProfession extends AppEvent {
  final String profession;
  UpdateProfession(this.profession);
}
class ResetState extends AppEvent {}
