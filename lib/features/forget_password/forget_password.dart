import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/assets_manager.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFCC00)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Forget Password',
          style: TextStyle(color: Color(0xFFFFCC00), fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),


                _buildIllustrationArea(),

                const SizedBox(height: 50),
                _buildEmailTextField(),
                const SizedBox(height: 30),

                _buildVerifyEmailButton(context),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIllustrationArea() {
    return SizedBox(
      height: 250,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            ImageAssets.forgetPassword,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 30, 30, 30),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.image_not_supported, color: Colors.white54, size: 50),
                    const SizedBox(height: 10),
                    Text(
                      'Forget Password Illustration Placeholder',
                      style: TextStyle(color: Colors.white54.withOpacity(0.7), fontSize: 14),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email, color: Color(0xFFFFCC00)),
        hintText: 'Email',
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _buildVerifyEmailButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFCC00),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text(
          'Verify Email',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}