import 'package:flutter/material.dart';
import '../../core/ui/glass_card.dart';
import '../../core/theme/app_colors.dart';
import '../../core/ui/liquid_background.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // 1. Header (Greeting)
              const Text(
                "Good Morning,\nHaify User",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 30),

              // 2. The Big "Haify Score" Ring
              Center(
                child: GlassCard(
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Placeholder for the Ring (We will animate this later)
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.neonEmerald, width: 8),
                        ),
                        child: const Center(
                          child: Text(
                            "85",
                            style: TextStyle(
                              color: AppColors.neonEmerald,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Daily Wellness Score",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 3. Activity Grid (Move, Hydrate, Fuel, Focus)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildStatCard("Move", "5,432", "steps",
                      AppColors.neonEmerald, Icons.directions_walk),
                  _buildStatCard("Hydrate", "1,250", "ml", AppColors.neonCyan,
                      Icons.water_drop),
                  _buildStatCard("Fuel", "1,840", "kcal", AppColors.neonOrange,
                      Icons.local_fire_department),
                  _buildStatCard(
                      "Focus", "45", "mins", AppColors.neonPurple, Icons.timer),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, String unit, Color color, IconData icon) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$unit • $title",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
