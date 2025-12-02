import 'package:flutter/material.dart';
import 'package:movies_app/core/funcations/validators.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String _selectedAvatarPath = ImageAssets.person2;
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
  String? _validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm Password is Required";
    }
    if (confirmPassword != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }
  String? _validatePhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return "Phone Number is Required";
    }
    if (phone.length < 8) {
      return "Phone should be at least 8 digits";
    }
    return null;
  }
  void _performRegistration() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration Successful!')),
    );
     // Navigator.pushReplacementNamed(context, RoutesManager.home);
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
          'Register',
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
                 SizedBox(height: 20),
                _buildAvatarSelectionArea(),
                 SizedBox(height: 40),

                _buildTextField(
                  controller: _nameController,
                  hintText: 'Name',
                  icon: Icons.person,
                  keyboardType: TextInputType.text,
                  validator: Validators.validateName,
                ),
                 SizedBox(height: 20),

                _buildTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 20),
                _buildPasswordTextField(),
                const SizedBox(height: 20),

                _buildConfirmPasswordTextField(),
                const SizedBox(height: 20),

                // 📞 حقل رقم الهاتف (Phone Number)
                _buildTextField(
                  controller: _phoneController,
                  hintText: 'Phone Number',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  // 💡 ربط validatePhone
                  validator: _validatePhone,
                ),
                const SizedBox(height: 30),

                // 🔑 زر إنشاء حساب (Create Account Button)
                _buildCreateAccountButton(context),

                const SizedBox(height: 20),

                // رابط "لدي حساب بالفعل؟" (Already Have Account?)
                _buildLoginLink(),

                // مفتاح اللغة (Language Switch)
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
  Widget _buildAvatarSelectionArea() {
    const List<String> avatarPaths = [
      ImageAssets.person1,
      ImageAssets.person2,
      ImageAssets.person3,
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: avatarPaths.map((path) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedAvatarPath = path;
                });
              },
              child: _buildAvatar(
                path,
                isSelected: _selectedAvatarPath == path,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        const Text(
          'Avatar',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildAvatar(String imagePath, {required bool isSelected}) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(color: const Color(0xFFFFCC00), width: 4) // إطار أصفر
            : Border.all(color: Colors.transparent),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade800,
              child: const Icon(Icons.person, color: Colors.white70, size: 40),
            );
          },
        ),
      ),
    );
  }
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required TextInputType keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFFFFCC00)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 13),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      style: const TextStyle(color: Colors.white),
      validator: Validators.validatePassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: Color(0xFFFFCC00)),
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
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 13),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: !_isConfirmPasswordVisible,
      style: const TextStyle(color: Colors.white),
      validator: _validateConfirmPassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: Color(0xFFFFCC00)),
        suffixIcon: IconButton(
          icon: Icon(
            _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white70,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
            });
          },
        ),
        hintText: 'Confirm Password',
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 13),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
  Widget _buildCreateAccountButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _performRegistration();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFCC00),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text(
          'Create Account',
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already Have Account ?",
          style: TextStyle(color: Colors.white70, fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            ' Login',
            style: TextStyle(color: Color(0xFFFFCC00), fontSize: 15),
          ),
        ),
      ],
    );
  }
  Widget _buildLanguageSwitch() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFlag('usa_flag', label: '🇺🇸', isActive: true),
           SizedBox(width: 10),
          _buildFlag('egypt_flag', label: '🇪🇬', isActive: false),
        ],
      ),
    );
  }
  Widget _buildFlag(String assetPath, {required String label, required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: isActive ? BoxDecoration(
        color: const Color(0xFFFFCC00),
        borderRadius: BorderRadius.circular(20),
      ) : null,
      child: const Text(
        '🇪🇬',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}