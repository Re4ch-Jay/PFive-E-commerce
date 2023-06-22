import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:p_five_ecommerce/controllers/validations/signup_validation.dart';
import 'package:p_five_ecommerce/views/widgets/auth_button.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupValidation signupValidationProvider =
        Provider.of<SignupValidation>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PFive'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return signupValidationProvider.firstName.error;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      errorText: signupValidationProvider.firstName.error,
                    ),
                    onChanged: (value) =>
                        {signupValidationProvider.setFirstName(value)},
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return signupValidationProvider.lastName.error;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      errorText: signupValidationProvider.lastName.error,
                    ),
                    onChanged: (value) => {
                      signupValidationProvider.setLastName(value),
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return signupValidationProvider.email.error;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: signupValidationProvider.email.error,
                    ),
                    onChanged: (value) => {
                      signupValidationProvider.setEmail(value),
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return signupValidationProvider.password.error;
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: signupValidationProvider.password.error,
                    ),
                    onChanged: (value) => {
                      signupValidationProvider.setPassword(value),
                    },
                  ),
                  AuthButton(
                    buttonText: 'Sign Up',
                    onTap: () {
                      if (!signupValidationProvider.isValidSignup) {
                        print('not allow');
                        null;
                      } else {
                        context.push('/home');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
