import 'package:flutter/material.dart';
import 'package:movies_app/core/funcations/validators.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';

// 💡 تم تغيير اسم الفئة إلى Login (حسب طلب المستخدم)
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

  // دالة منطق تسجيل الدخول
  void _performLogin() {
    // 💡 تنفيذ منطق الدخول الفعلي هنا
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login Successful!')),
    );
    // إذا نجح التحقق، يتم الانتقال إلى الشاشة الرئيسية
    // Navigator.pushReplacementNamed(context, RoutesManager.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          // الـ Form Widget موجود بالفعل وهذا صحيح
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  ImageAssets.movieLogo,
                  height: 120,
                  width: 120,
                ),
                const SizedBox(height: 70),
                _buildEmailTextField(),
                const SizedBox(height: 20),

                _buildPasswordTextField(),

                _buildForgetPasswordLink(),
                const SizedBox(height: 30),
                _buildLoginButton(context),

                const SizedBox(height: 15),

                _buildCreateAccountAndOrSeparator(),

                const SizedBox(height: 25),

                _buildGoogleLoginButton(),
                const SizedBox(height: 40),
                _buildLanguageSwitch(),
                const SizedBox(height: 20),
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
      style:  const TextStyle(color: ColorsManager.white),
      // 💡 ربط الدالة validateEmail هنا
      validator: Validators.validateEmail,
      decoration: InputDecoration(
        prefixIcon:  const Icon(Icons.email, color: ColorsManager.yellow),
        hintText: 'Email',
        hintStyle: const TextStyle(color: ColorsManager.white),
        filled: true,
        fillColor:  const Color(0xFF1E1E1E),
        contentPadding:  const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
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
      style: const TextStyle(color: ColorsManager.white),
      // 💡 ربط الدالة validatePassword هنا
      validator: Validators.validatePassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: ColorsManager.yellow),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white70,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        hintText: 'Password',
        hintStyle: const TextStyle(color: ColorsManager.white),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
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
          Navigator.pushNamed(context, RoutesManager.forgetPassword);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize:  const Size(50, 30),
          alignment: Alignment.centerRight,
        ),
        child: const Text(
          'Forget Password ?',
          style: TextStyle(
            color: ColorsManager.yellow,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // 💡 هذا الجزء يمنع الدخول حتى يتم التحقق من صحة جميع الحقول
          if (_formKey.currentState!.validate()) {
            _performLogin();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.yellow,
          padding:  const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child:  const Text(
          'Login',
          style: TextStyle(color: ColorsManager.black, fontSize: 18, fontWeight: FontWeight.bold),
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
              style: TextStyle(color:ColorsManager.white, fontSize: 15),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesManager.register);
              },
              child:  const Text(
                ' Create One',
                style: TextStyle(color: ColorsManager.yellow, fontSize: 15),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const Expanded(child: Divider(color: ColorsManager.white, thickness: 1.5, endIndent: 5)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('OR', style: TextStyle(color: ColorsManager.white, fontSize: 14)),
            ),
            const Expanded(child: Divider(color: ColorsManager.white, thickness: 1.5, indent: 5)),
          ],
        ),
      ],
    );
  }

  Widget _buildGoogleLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.yellow,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png',
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              'Login With Google',
              style: TextStyle(color: ColorsManager.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSwitch() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color:  const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFlag('usa_flag', label: '🇺🇸', isActive: true),
          const SizedBox(width: 10),
          _buildFlag('egypt_flag', label: '🇪🇬', isActive: false),
        ],
      ),
    );
  }

  Widget _buildFlag(String assetPath, {required String label, required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: isActive ? BoxDecoration(
        color:  ColorsManager.yellow,
        borderRadius: BorderRadius.circular(20),
      ) : null,
      child: Text(
        label,
        style:  const TextStyle(fontSize: 20),
      ),
    );
  }
}