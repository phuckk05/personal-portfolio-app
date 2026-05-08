/*
 Bộ màu chuẩn cho app
*/

import 'package:flutter/material.dart';

class AppColors {
  // Màu nền chính
  static const Color nen = Color(0xFF0A0A0A);

  // Màu card
  static const Color card = Color(0xFF1A1A1A);

  // Màu chữ chính
  static const Color chuChinh = Color(0xFFFFFFFF);

  // Màu chữ phụ
  static const Color chuPhu = Color(0xFFB3B3B3);

  // Nền đen
  static const Color nen2 = Color(0xFF0D0D0D);

  // Màu áo khoác olive nâu
  static const Color oliveNau = Color(0xFF5C4B3B);

  // Màu kem quần áo
  static const Color kem = Color(0xFFE8DED1);

  // Màu xám trời từ background
  static const Color xamTroi = Color(0xFFBFC2C9);

  // Màu trắng chữ
  static const Color trang = Color(0xFFF5F5F5);

  // Màu nhấn luxury
  static const Color vangLuxury = Color(0xFFD4AF37);

  static const LinearGradient luxuryGradient = LinearGradient(
    colors: [Color(0xFF0D0D0D), Color(0xFF5C4B3B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blackGradient = LinearGradient(
    colors: [Color(0xFF0D0D0D), Color(0xFF5C4B3B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
