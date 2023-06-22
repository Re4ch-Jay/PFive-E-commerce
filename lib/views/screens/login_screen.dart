import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:p_five_ecommerce/controllers/validations/login_validation.dart';
import 'package:p_five_ecommerce/views/widgets/auth_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginValidation loginValidationProvider =
        Provider.of<LoginValidation>(context);
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
                        return loginValidationProvider.email.error;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: loginValidationProvider.email.error,
                    ),
                    onChanged: (value) => {
                      loginValidationProvider.setEmail(value),
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return loginValidationProvider.password.error;
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: loginValidationProvider.password.error,
                    ),
                    onChanged: (value) => {
                      loginValidationProvider.setPassword(value),
                    },
                  ),
                  AuthButton(
                    buttonText: 'Login',
                    onTap: () {
                      if (!loginValidationProvider.isValidLogin) {
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
