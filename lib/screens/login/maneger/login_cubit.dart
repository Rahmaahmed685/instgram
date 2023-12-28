import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../shared_prefrances.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({
    required String email,
    required String password,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(LoginSuccessState());
      saveLoggedIn();
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'user-not-found') {
          emit(LoginFailureState('No user found for that email.'));
          // displayToast('No user found for that email.');
        } else if (error.code == 'wrong-password') {
          emit(LoginFailureState('Wrong password provided for that user.'));
          // displayToast('Wrong password provided for that user.');
        }
      }
      emit(LoginFailureState(error.toString()));
      // Fluttertoast.showToast(msg: error.toString());
    });
  }

  void saveLoggedIn() async {
    PreferenceUtils.setBool(PreferenceKey.loggedIn, true);
  }
}

