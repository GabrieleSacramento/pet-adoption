import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_doption_app/src/modules/Auth/domain/entities/user_authentication_entity.dart';
import 'package:pet_doption_app/src/modules/Auth/domain/use_cases/user_authentication_use_case.dart';

part 'user_authentication_state.dart';

class UserAuthenticationCubit extends Cubit<UserAuthenticationState> {
  final UserAuthenticationUseCase userAuthenticationUseCase;
  UserAuthenticationCubit({required this.userAuthenticationUseCase})
      : super(UserAuthenticationInitial());

  void signUp(UserAuthenticationEntity userAuthenticationEntity) async {
    emit(UserAuthenticationLoading());

    try {
      final result =
          await userAuthenticationUseCase.signup(userAuthenticationEntity);
      result.fold(
        (l) => emit(UserAuthenticationError(message: l.message!)),
        (r) => emit(UserAuthenticationSuccess(user: r)),
      );
    } on FirebaseAuthException catch (e) {
      emit(UserAuthenticationError(message: e.message!));
    }
  }

  void signIn(UserAuthenticationEntity userAuthenticationEntity) async {
    emit(UserAuthenticationLoading());

    try {
      final result =
          await userAuthenticationUseCase.login(userAuthenticationEntity);
      result.fold(
        (l) => emit(UserAuthenticationError(message: l.message!)),
        (r) => emit(UserAuthenticationSuccess(user: r)),
      );
    } on FirebaseAuthException catch (e) {
      emit(UserAuthenticationError(message: e.message!));
    }
  }
}
