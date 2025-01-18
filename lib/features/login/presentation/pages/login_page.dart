import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/presentation/loading.dart';
import 'package:movie_app/core/routers/routers.dart';
import 'package:movie_app/core/themes/color.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/widgets/showSnackBar/show_snackbar.dart';
import 'package:movie_app/features/login/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:movie_app/features/login/presentation/widgets/input_textfield.dart';
import 'package:movie_app/features/login/presentation/widgets/rounded_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          context.showSnackBarFail(text: state.errorMessage);
        }
        if (state is LoginLoaded) {
          context.showSnackBarSuccess(text: 'Welcome to movie...');
          context.go(RouterDerection.home);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            const RoundedContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apple,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Login with Apple',
                    style: JtStyle.pageTitleMedium,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const RoundedContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.g_mobiledata_rounded,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Login with Google',
                    style: JtStyle.pageTitleMedium,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'or with continue with email',
              style: JtStyle.smallText,
            ),
            const SizedBox(
              height: 60,
            ),
            const FormvalidateLogin(),
            _textService()
          ],
        );
      },
    );
  }

  Padding _textService() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
                text: 'By signing up, you agree to our ',
                style: JtStyle.smallText.copyWith(color: JtColor.secondary),
                children: [
                  TextSpan(
                    text: 'Terms of service ',
                    style: JtStyle.smallTextBold.copyWith(
                        color: JtColor.green,
                        decoration: TextDecoration.underline),
                  ),
                ]),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: '\nand',
              style: JtStyle.smallTextBold.copyWith(
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: ' Privacy policy',
              style: JtStyle.smallTextBold.copyWith(
                  color: JtColor.green, decoration: TextDecoration.underline),
            )
          ]))
        ],
      ),
    );
  }
}

class FormvalidateLogin extends StatefulWidget {
  const FormvalidateLogin({
    super.key,
  });

  @override
  State<FormvalidateLogin> createState() => _FormvalidateLoginState();
}

class _FormvalidateLoginState extends State<FormvalidateLogin> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InputField(
                  validator: Validator.validateEmail,
                  onSave: (value) {
                    context.read<LoginCubit>().userLoginModel.email = value!;
                  },
                  hintText: 'Enter your email...',
                  prefix: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InputField(
                  onSave: (value) {
                    context.read<LoginCubit>().userLoginModel.password = value!;
                  },
                  validator: Validator.validatePassWord,
                  hintText: 'Enter your password...',
                  prefix: const Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  suffixIcon: const Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.black,
                  ),
                  isObscureText: true,
                ),
              ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                'Forgot Password?',
                style: JtStyle.smallText,
              ),
            ),
          ],
        ),
        RoundedContainer(
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              context.read<LoginCubit>().loginUser();
            }
          },
          height: 55,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const LoadingWidget();
                  }
                  return Text(
                    'Login',
                    style: JtStyle.button.copyWith(color: Colors.black),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
