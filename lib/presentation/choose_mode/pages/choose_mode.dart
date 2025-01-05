import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/presentation/auth/pages/signup_or_siginin.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify/presentation/splash/bloc/land_page_cubit.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});
  final String route = '/choose-mode';

  @override
  Widget build(BuildContext context) {
    context.read<LandPageCubit>().updateLandPage(route);
    final themeCubit = context.watch<ThemeCubit>();

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBG),
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withValues(alpha: 38), // ~0.15 opacity
          ),
          // Page Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.logo),
                  ),
                  const Spacer(),
                  const Text(
                    'Choose Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Dark and Light Mode Options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Dark Mode
                      _ModeOption(
                        label: 'Dark Mode',
                        icon: AppVectors.moon,
                        active: themeCubit.state == ThemeMode.dark,
                        onTap: () {
                          themeCubit.updateTheme(ThemeMode.dark);
                        },
                      ),
                      const SizedBox(width: 40),
                      // Light Mode
                      _ModeOption(
                        label: 'Light Mode',
                        icon: AppVectors.sun,
                        active: themeCubit.state == ThemeMode.light,
                        onTap: () {
                          themeCubit.updateTheme(ThemeMode.light);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Continue Button
                  BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignupOrSigninPage(),
                        ),
                      );
                    },
                    title: 'Continue',
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Extracted ModeOption widget for reuse and better readability
class _ModeOption extends StatelessWidget {
  final String label;
  final String icon;
  final bool active;
  final VoidCallback onTap;

  const _ModeOption({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color(0xff30393C)
                      .withValues(alpha: 128), // ~0.5 opacity
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  icon,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: active ? AppColors.primary : AppColors.grey,
          ),
        ),
      ],
    );
  }
}
