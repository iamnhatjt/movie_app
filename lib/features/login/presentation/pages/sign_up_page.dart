import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/presentation/loading.dart';
import 'package:movie_app/core/themes/color.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:movie_app/core/utils/validator.dart';
import 'package:movie_app/core/widgets/showSnackBar/show_snackbar.dart';
import 'package:movie_app/features/login/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:movie_app/features/login/presentation/pages/authentication_pages.dart';
import 'package:movie_app/features/login/presentation/widgets/input_textfield.dart';
import 'package:movie_app/features/login/presentation/widgets/rounded_container.dart';

class SignUpPgae extends StatelessWidget {
  const SignUpPgae({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterError) {
              context.showSnackBarFail(text: state.errorMessage);
            }
            if (state is RegisterLoaded) {
              context.showSnackBarSuccess(text: 'Đăng ký thành công...');
              OptionType.of(context)!.changeState();
            }
          },
          builder: (context, state) {
            return const SignUpScreen();
          },
        ));
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  late final _signUpCubit = context.read<RegisterCubit>();
  String passWord = '';
  bool isLengCharactor = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            InputField(
              hintText: 'Your name...',
              prefix: const Icon(
                Icons.person_outline_rounded,
                color: Colors.black,
              ),
              validator: (value) =>
                  value?.trim() == '' ? 'Your name is not empty' : null,
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              hintText: 'Enter your email...',
              prefix: const Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              validator: Validator.validateEmail,
              onSave: (value) {
                _signUpCubit.user.email = value!;
              },
              onchange: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              hintText: 'Enter your password...',
              isObscureText: true,
              prefix: const Icon(
                Icons.lock_outline_rounded,
                color: Colors.black,
              ),
              validator: Validator.validatePassWord,
              suffixIcon: const Icon(Icons.remove_red_eye_outlined),
              onchange: (value) {
                passWord = value ?? '';
                if (value != null && value.length > 8) {
                  setState(() {
                    isLengCharactor = true;
                  });
                } else {
                  setState(() {
                    isLengCharactor = false;
                  });
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              hintText: 'Confirm your password...',
              isObscureText: true,
              prefix: const Icon(
                Icons.lock_outline_rounded,
                color: Colors.black,
              ),
              suffixIcon: const Icon(Icons.remove_red_eye_outlined),
              validator: (value) {
                return value == passWord ? null : 'Not same password...';
              },
              onSave: (value) {
                _signUpCubit.user.password = value!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 16,
                      color:
                          isLengCharactor ? Colors.greenAccent : Colors.black,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'At least 8 characters',
                      style: JtStyle.subText.copyWith(color: JtColor.secondary),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 16,
                      color:
                          isLengCharactor ? Colors.greenAccent : Colors.black,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'only lower case letter',
                      style: JtStyle.subText.copyWith(color: JtColor.secondary),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Checkbox.adaptive(
                  value: true,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'By agreeing to the terms and conditions, you are entering \n into a legally binding contract with the service provider.',
                    style: JtStyle.smallText.copyWith(color: JtColor.secondary),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedContainer(
              height: 55,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  _signUpCubit.regiterUser();
                }
              },
              color: JtColor.orange,
              child: Center(
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return const Flexible(
                          fit: FlexFit.loose, child: LoadingWidget());
                    }
                    return const Text(
                      'Sign Up',
                      style: JtStyle.button,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
