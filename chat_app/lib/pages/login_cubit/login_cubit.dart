import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/pages/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginuser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    // ignore: unused_local_variable
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errormsg: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errormsg: 'Wrong password provided for that user.'));
      } else {
        emit(LoginFailure(errormsg: 'Something went wrong.'));
      }
    }
  }
}
