import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:movies_app/core/resources/colors_manager.dart';
import 'package:movies_app/providers/config_provider.dart';
import 'package:provider/provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: AnimatedToggleSwitch<String>.dual(
        current: configProvider.currentLanguage,
        first: 'en',
        second: 'ar',
        spacing: 10.0,
        height: 50,
        style: const ToggleStyle(
          backgroundColor: Color(0xFF1E1E1E),
          borderColor: Colors.transparent,
        ),
        borderWidth: 0,
        styleBuilder: (value) => ToggleStyle(
          indicatorColor: ColorsManager.yellow,
          borderRadius: BorderRadius.circular(20),
        ),
        iconBuilder: (value) {
          if (value == 'en') {
            return const Text('🇺🇸', style: TextStyle(fontSize: 20));
          } else {
            return const Text('🇪🇬', style: TextStyle(fontSize: 20));
          }
        },
        textBuilder: (value) {
          if (value == 'en') {
            return const Text('🇪🇬', style: TextStyle(fontSize: 20));
          } else {
            return const Text('🇺🇸', style: TextStyle(fontSize: 20));
          }
        },
        onChanged: (value) {
          configProvider.changeAppLanguage(value);
        },
      ),
    );
  }
}
