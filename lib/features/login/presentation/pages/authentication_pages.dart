// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:movie_app/features/login/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:movie_app/features/login/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:movie_app/features/login/presentation/pages/login_page.dart';
import 'package:movie_app/features/login/presentation/pages/sign_up_page.dart';

import '../widgets/header.dart';

class AuthenticaitonPage extends StatelessWidget {
  const AuthenticaitonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: const SafeArea(
              child: Column(
                children: [
                  HeaderLogin(),
                  SizedBox(
                    height: 10,
                  ),
                  OptionType(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OptionType extends StatefulWidget {
  const OptionType({
    super.key,
  });

  @override
  State<OptionType> createState() => _OptionTypeState();
  static _OptionTypeState? of(BuildContext context) =>
      context.findAncestorStateOfType();
}

class _OptionTypeState extends State<OptionType> {
  bool isLogin = true;
  void changeState() {
    setState(() {
      isLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLogin = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: isLogin ? Colors.indigo : Colors.transparent,
                            width: 2),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: JtStyle.mediumTextBold.copyWith(
                            color: isLogin ? Colors.black : Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLogin = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color:
                                !isLogin ? Colors.indigo : Colors.transparent,
                            width: 2),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: JtStyle.bodyTextBold.copyWith(
                            color: !isLogin ? Colors.black : Colors.grey),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 200, 200, 200)
                      .withOpacity(0.2)),
              child: isLogin ? const LoginPage() : const SignUpPgae(),
            ),
          ),
        ],
      ),
    );
  }
}
