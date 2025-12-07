import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/colors_manager.dart'; // تأكد من صحة مسار ColorsManager

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  // 1. تحديد الحالة (State) داخل الـ Widget المنفصل
  String _selectedLanguageCode = 'US';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFlag('US', label: '🇺🇸'),
          const SizedBox(width: 10),
          _buildFlag('EG', label: '🇪🇬'),
        ],
      ),
    );
  }

  // 2. دالة بناء العلم (تتضمن آلية الضغط والتحديث)
  Widget _buildFlag(String languageCode, {required String label}) {
    final isActive = _selectedLanguageCode == languageCode;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguageCode = languageCode;
          // 💡 ملاحظة: هنا يمكنك أيضاً استدعاء دالة لتغيير لغة التطبيق فعلياً
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: isActive
            ? BoxDecoration(
          color: ColorsManager.yellow,
          borderRadius: BorderRadius.circular(20),
        )
            : null,
        child: Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}