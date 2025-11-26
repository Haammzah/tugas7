import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier {
  // ============= THEME MODE =============
  ThemeMode _tema = ThemeMode.light;
  ThemeMode get tema => _tema;
  bool get isDarkMode => _tema == ThemeMode.dark;

  static const String _temaKey = "theme_key";

  // ============= USERNAME =============
  String _namaPengguna = "";
  String get namaPengguna => _namaPengguna;

  static const String _namaKey = "nama_pengguna_key";

  Themeprovider() {
    _loadTema();
    _loadNama();
  }

  // ======== LOAD TEMA ========
  void _loadTema() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_temaKey) ?? false;
    _tema = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // ======== TOGGLE TEMA ========
  void toggleTheme(bool isOn) async {
    _tema = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_temaKey, isOn);
  }

  // ======== LOAD NAMA ========
  void _loadNama() async {
    final prefs = await SharedPreferences.getInstance();
    _namaPengguna = prefs.getString(_namaKey) ?? "";
    notifyListeners();
  }

  // ======== SIMPAN NAMA ========
  void simpanNama(String nama) async {
    final prefs = await SharedPreferences.getInstance();
    _namaPengguna = nama;
    prefs.setString(_namaKey, nama);
    notifyListeners();
  }
}
