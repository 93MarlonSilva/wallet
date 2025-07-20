import 'package:flutter/material.dart';

class AppColors {

  static const Color sheetColor = Color(0xFF1A1A2E);
  
  // Primary colors
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF8B5CF6);
  static const Color accent = Color(0xFFEC4899);
  
  // Background colors
  static const Color background = Color(0xFF0F0F23);
  static const Color surface = Color(0xFF1A1A2E);
  static const Color surfaceVariant = Color(0xFF16213E);
  
  // Text colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFE5E7EB);
  static const Color textTertiary = Color(0xFF9CA3AF);
  
  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  
  // Card gradients
  static const List<Color> cardGradient1 = [Color(0xFF8B5CF6), Color(0xFFEC4899)];
  static const List<Color> cardGradient2 = [Color(0xFF10B981), Color(0xFF3B82F6)];
  static const List<Color> cardGradient3 = [Color(0xFFF59E0B), Color(0xFFEF4444)];
  static const List<Color> cardGradient4 = [Color(0xFF6366F1), Color(0xFF8B5CF6)];
}

class AppGradients {
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFF0F0F23),
      Color(0xFF1A1A2E),
      Color(0xFF16213E),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [
      Color(0xFF1A1A2E),
      Color(0xFF16213E),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppSizes {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;
}
