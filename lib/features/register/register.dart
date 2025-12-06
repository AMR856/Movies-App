import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/core/widget/LanguageSwitcher.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/core/funcation/validators.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';
import '../../utils/auth_controller.dart';

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
    if (confirmPassword == null || confirmPassword.isEmpty) return "Confirm Password is Required";
    if (confirmPassword != _passwordController.text) return "Passwords do not match";
    return null;
  }

  String? _validatePhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) return "Phone Number is Required";
    if (phone.length < 8) return "Phone should be at least 8 digits";
    return null;
  }
  int _getAvatarId(String path) {
    if (path == ImageAssets.person1) return 1;
    if (path == ImageAssets.person2) return 2;
    if (path == ImageAssets.person3) return 3;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: ColorsManager.yellow),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          'Register',
          style: TextStyle(color:ColorsManager.yellow, fontWeight: FontWeight.bold, fontSize: 20),
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
                _buildTextField(controller: _nameController, hintText: 'Name', icon: Icons.person, keyboardType: TextInputType.text,
                    validator: (v) => Validators.validateName(v)
                ),
                SizedBox(height: 20),
                _buildTextField(controller: _emailController, hintText: 'Email', icon: Icons.email, keyboardType: TextInputType.emailAddress,
                   validator: (v) => Validators.validateEmail(v)
                ),
                SizedBox(height: 20),
                _buildPasswordTextField(),
                 SizedBox(height: 20),
                _buildConfirmPasswordTextField(),
                 SizedBox(height: 20),
                _buildTextField(controller: _phoneController, hintText: 'Phone Number', icon: Icons.phone, keyboardType: TextInputType.phone, validator: _validatePhone),
                 SizedBox(height: 30),
                _buildCreateAccountButton(authController),
                 SizedBox(height: 20),
                _buildLoginLink(),
                 SizedBox(height: 40),
                 LanguageSwitcher(),

                 SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarSelectionArea() {
     List<String> avatarPaths = [
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
              child: _buildAvatar(path, isSelected: _selectedAvatarPath == path),
            );
          }).toList(),
        ),
         SizedBox(height: 8),
         Text(
          'Avatar',
          style: TextStyle(color: ColorsManager.white, fontSize: 16),
        ),
      ],
    );
  }
  Widget _buildAvatar(String imagePath, {required bool isSelected}) {
    double size = isSelected ? 95 : 75;

    return AnimatedContainer(
      duration:  Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: size,
      height: size,
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade800,
              child:  Icon(Icons.person, color:ColorsManager.white, size: 40),
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
      style:  TextStyle(color: ColorsManager.white),
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: ColorsManager.white),
        hintText: hintText,
        hintStyle:  TextStyle(color: ColorsManager.white),
        filled: true,
        fillColor:  ColorsManager.grey,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        errorStyle:  TextStyle(color: ColorsManager.red, fontSize: 13),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:  BorderSide(color: ColorsManager.red, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:  BorderSide(color: ColorsManager.red, width: 1.0),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      style:  TextStyle(color: ColorsManager.white),
       validator: (value) => Validators.validatePassword(value),
      decoration: InputDecoration(
        prefixIcon:  Icon(Icons.lock, color: ColorsManager.white),
        suffixIcon: IconButton(
          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: ColorsManager.white, size: 20),
          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
        ),
        hintText: 'Password',
        hintStyle:  TextStyle(color: ColorsManager.white),
        filled: true,
        fillColor: ColorsManager.grey,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: !_isConfirmPasswordVisible,
      style:  TextStyle(color: ColorsManager.white),
      validator: _validateConfirmPassword,
      decoration: InputDecoration(
        prefixIcon:  Icon(Icons.lock, color: ColorsManager.white),
        suffixIcon: IconButton(
          icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.white70, size: 20),
          onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
        ),
        hintText: 'Confirm Password',
        hintStyle:  TextStyle(color: ColorsManager.white),
        filled: true,
        fillColor: ColorsManager.grey,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildCreateAccountButton(AuthController authController) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: authController.isLoading
            ? null
            : () async {
           if (_formKey.currentState!.validate()) {
          await authController.register(
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
            phone: _phoneController.text,
            avatar: _getAvatarId(_selectedAvatarPath).toString(),
          );
          if (authController.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authController.errorMessage!)));
          } else {
            Navigator.pushReplacementNamed(context, RoutesManager.home);
          }
           }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:ColorsManager.yellow,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: authController.isLoading
            ?  SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: ColorsManager.black, strokeWidth: 2))
            :  Text('Create Account', style: TextStyle(color: ColorsManager.black, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text("Already Have Account ?", style: TextStyle(color: ColorsManager.white, fontSize: 15)),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child:  Text(' Login', style: TextStyle(color: ColorsManager.yellow, fontSize: 15)),
        ),
      ],
    );
  }


}