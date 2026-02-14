import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LiquidBackground extends StatelessWidget {
  final Widget child;
  const LiquidBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: AppColors.pitchBlack),
        // Simple Glow Orbs
        Positioned(
          top: -100,
          left: -100,
          child: _buildOrb(AppColors.neonEmerald),
        ),
        Positioned(
          bottom: -100,
          right: -100,
          child: _buildOrb(AppColors.neonPurple),
        ),
        SafeArea(child: child),
      ],
    );
  }

  Widget _buildOrb(Color color) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 100,
            spreadRadius: 20,
          ),
        ],
      ),
    );
  }
}
