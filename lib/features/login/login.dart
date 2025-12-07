
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/widget/LanguageSwitcher.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/core/funcation/validators.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';
import '../../utils/auth_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                 SizedBox(height: 50),
                Image.asset(
                  ImageAssets.movieLogo,
                  height: 150,
                  width: 150,
                ),
                 SizedBox(height: 60),
                _buildEmailTextField(),
                 SizedBox(height: 15),
                _buildPasswordTextField(),
                _buildForgetPasswordLink(),
                 SizedBox(height: 20),
                _buildLoginButton(authController),
                 SizedBox(height: 15),
                _buildCreateAccountAndOrSeparator(),

                 SizedBox(height: 15),
                _buildGoogleLoginButton(authController),
                 SizedBox(height: 30),
                 LanguageSwitcher(),
                 SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: ColorsManager.white),
      validator: (value) => Validators.validateEmail(value),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            ImageAssets.emailIcon,   // ← حط اسم الملف هنا
            color: ColorsManager.white,
            width: 20,
            height: 20,
          ),
        ),
        hintText: 'Email',
        hintStyle: TextStyle(color: ColorsManager.white),
        filled: true,
        fillColor: ColorsManager.grey,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      style: TextStyle(color: ColorsManager.white),
      validator: (value) => Validators.validatePassword(value),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            ImageAssets.passwordIcon,   // ← غير ده لاسم ملفك
            color: ColorsManager.white,
            width: 20,
            height: 20,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: ColorsManager.white,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        hintText: 'Password',
        hintStyle: TextStyle(color: ColorsManager.white),
        filled: true,
        fillColor: ColorsManager.grey,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
  Widget _buildForgetPasswordLink() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesManager.forgetpassword);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize:  Size(50, 30),
          alignment: Alignment.centerRight,
        ),
        child:const  Text(
          'Forget Password ?',
          style: TextStyle(
            color: ColorsManager.yellow,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
  Widget _buildLoginButton(AuthController authController) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: authController.isLoading
            ? null
            : () async {
          if (_formKey.currentState!.validate()) {
            await authController.login(
                _emailController.text, _passwordController.text);

            if (authController.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(authController.errorMessage!)),
              );
            } else {
              Navigator.pushReplacementNamed(context, RoutesManager.home);
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.yellow,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: authController.isLoading
            ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: ColorsManager.black,
            strokeWidth: 2,
          ),
        )
            :const  Text(
          'Login',
          style: TextStyle(
              color: ColorsManager.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  Widget _buildCreateAccountAndOrSeparator() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't Have Account ?",
              style: TextStyle(color: ColorsManager.white, fontSize: 15),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.register);
              },
              child: const Text(
                ' Create One',
                style: TextStyle(color: ColorsManager.yellow, fontSize: 15),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children:  [
            Expanded(
                child: Divider(
                    color: ColorsManager.yellow, thickness: 1.5, endIndent: 5)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:
              Text('OR', style: TextStyle(color: ColorsManager.yellow, fontSize: 14)),
            ),
            Expanded(
                child: Divider(
                    color: ColorsManager.yellow, thickness: 1.5, indent: 5)),
          ],
        ),
      ],
    );
  }
  Widget _buildGoogleLoginButton(AuthController authController) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: authController.isLoading
            ? null
            : () async {
          try {
            authController.setLoading(true);
            await Future.delayed(const Duration(seconds: 2));
            Navigator.pushReplacementNamed(context, RoutesManager.home);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Google login failed: $e')),
            );
          } finally {
            authController.setLoading(false);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.yellow,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: authController.isLoading
            ?  SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: ColorsManager.black,
            strokeWidth: 2,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png',color: ColorsManager.black,
              height: 25,
              width: 25,
            ),
              SizedBox(width: 6),
              Text(
              'Login With Google',
              style: TextStyle(
                  color: ColorsManager.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
