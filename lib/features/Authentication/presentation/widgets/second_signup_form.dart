import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/utils/validators.dart';
import 'package:book_it/core/widgets/back_button_row.dart';
import 'package:book_it/features/Authentication/data/models/first_signup_data.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:book_it/core/widgets/label_text.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:book_it/core/widgets/custom_text_field.dart';
import 'package:book_it/core/widgets/primary_text.dart';
import 'package:book_it/features/Authentication/presentation/widgets/role_selector_row.dart';
import 'package:book_it/core/widgets/secondary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SecondSignupForm extends StatefulWidget {
  const SecondSignupForm({super.key, required this.firstSignupData});
  final FirstSignupData firstSignupData;

  @override
  State<SecondSignupForm> createState() => _SecondSignupFormState();
}

class _SecondSignupFormState extends State<SecondSignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String role = "renter";

  void setRole(String roleValue) {
    role = roleValue;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSignUpFailure) {
          showSnackBar(
            context: context,
            message: state.message,
            color: Colors.red,
            duration: Duration(seconds: 2),
          );
        }

        if (state is AuthenticationSignUpSuccess) {
          showSnackBar(
            context: context,
            message: " Account created Successfully you can Sign in now",
            color: Colors.green,
            duration: Duration(seconds: 2),
          );
          context.go("/signin");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  BackButtonRow(
                    onTap: () {
                      if (state is! AuthenticationLoading) {
                        FocusScope.of(context).unfocus();
                        context.pop();
                      }
                    },
                  ),
                  SizedBox(height: 30),
                  PrimaryText(text: "Finish Your Account!"),
                  SizedBox(height: 10),
                  SecondaryText(
                    text:
                        "Welcome aboard! Your account is almost done.  Discover homes, list properties, and get started today.",
                  ),
                  SizedBox(height: 60),
                  LabelText(text: "Phone Number"),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: " Enter your phone number",
                    prefixIcon: Icons.phone,

                    validator: phoneValidator,
                    controller: _phoneController,
                    isNumber: true,
                  ),
                  const SizedBox(height: 20),
                  LabelText(text: "Password"),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "Enter your Password",
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    validator: passwordValidator,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  LabelText(text: "Confirm Password"),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "Confirm your Password",
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    validator: (value) {
                      return confirmPasswordValidator(
                        value,
                        _passwordController.text,
                      );
                    },

                    controller: _confirmPasswordController,
                  ),
                  SizedBox(height: 40),

                  RoleSelectorRow(setRole: setRole),
                  SizedBox(height: 40),
                  if (state is AuthenticationLoading)
                    Center(
                      child: CircularProgressIndicator(color: kPrimaryColor),
                    )
                  else
                    PrimaryButton(
                      text: "SignUp",
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthenticationCubit>().signUp(
                            firstName: widget.firstSignupData.name!,
                            lastName: widget.firstSignupData.lastName!,
                            birthDate: widget.firstSignupData.birthDate!,
                            phoneNumber: _phoneController.text.trim(),
                            password: _passwordController.text.trim(),
                            confirmPassword: _confirmPasswordController.text
                                .trim(),
                            role: role,
                            profilePicture:
                                widget.firstSignupData.profileImage!,
                            idImage: widget.firstSignupData.idImage!,
                          );
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
