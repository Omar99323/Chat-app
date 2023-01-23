import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/pages/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/rigester_cubit/register_cubit.dart';
import 'package:scholar_chat/pages/rigester_cubit/register_state.dart';
import '../consts.dart';
import '../widgets/button.dart';
import '../widgets/text_field.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  static String id = 'Register';
  String? email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isloading = true;
        } else if (state is RegisterSuccess) {
          BlocProvider.of<ChatCubit>(context).showMessages();
          Navigator.pushNamed(context, Thechat.id, arguments: email);
          isloading = false;
        } else if (state is RegisterFailure) {
          snakbar(context, state.errormsg);
          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                      'assets/images/scholar.png',
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
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Textfield(
                      obscure: false,
                      onchanged: (data) {
                        email = data;
                      },
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
                          BlocProvider.of<RegisterCubit>(context)
                              .registeruser(email: email!, password: password!);
                        }
                      },
                      txt: 'Sign Up',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '  Sign In',
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
        );
      },
    );
  }
}
