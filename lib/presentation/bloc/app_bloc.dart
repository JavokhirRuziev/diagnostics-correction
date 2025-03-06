import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<SelectGender>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });

    on<SelectAge>((event, emit) {
      emit(state.copyWith(age: event.age));
    });

    on<UpdateCharacterNumber>((event, emit) {
      emit(state.copyWith(characterNumber: event.characterNumber));
    });

    on<UpdateCharacterLook>((event, emit) {
      emit(state.copyWith(characterLook: event.characterLook));
    });

    on<UpdateCharacterColor>((event, emit) {
      emit(state.copyWith(characterColor: event.characterColor));
    });

    on<UpdateTransport>((event, emit) {
      emit(state.copyWith(transport: event.transport));
    });

    on<UpdatePhone>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<UpdateProfession>((event, emit) {
      emit(state.copyWith(profession: event.profession));
    });

    on<ResetState>((event, emit) {
      emit(AppState());
    });

  }
}
