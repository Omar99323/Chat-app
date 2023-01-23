import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/pages/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/login_cubit/login_cubit.dart';
import 'package:scholar_chat/pages/login_cubit/login_state.dart';
import 'package:scholar_chat/pages/register.dart';
import '../widgets/button.dart';
import '../widgets/text_field.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  static String id = 'Login';

  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).showMessages();
          Navigator.pushNamed(context, Thechat.id, arguments: email);
          isloading = false;
        } else if (state is LoginFailure) {
          snakbar(context, state.errormsg);
          isloading = false;
        }
      },
      builder: ((context, state) => ModalProgressHUD(
            inAsyncCall: isloading,
            child: Scaffold(
              backgroundColor: primarycolor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: formkey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Image.asset(
                        logo,
                        height: 100,
                      ),
                      const Center(
                        child: Text(
                          'Scholar Chat',
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Pacifico',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: const [
                            Text(
                              'SIGN IN',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Textfield(
                        onchanged: (data) {
                          email = data;
                        },
                        obscure: false,
                        hint: 'Email',
                        pad: 10,
                      ),
                      Textfield(
                        obscure: true,
                        onchanged: (data) {
                          password = data;
                        },
                        hint: 'Password',
                        pad: 25,
                      ),
                      Button(
                        ontap: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context)
                                .loginuser(email: email!, password: password!);
                          }
                        },
                        txt: 'Sign In',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Register.id);
                            },
                            child: const Text(
                              '  Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 146, 198, 207),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Future<void> loginuser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
