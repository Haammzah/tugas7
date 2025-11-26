import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas7/themeprovider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTema = Provider.of<Themeprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan Tema & Nama"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= DARK MODE =================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Dark Mode", style: TextStyle(fontSize: 18)),
                Switch(
                  value: providerTema.isDarkMode,
                  onChanged: (value) {
                    providerTema.toggleTheme(value);
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ================= USERNAME DROPDOWN =================
            const Text("Pilih Nama Pengguna:", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),

            DropdownButton<String>(
              value: providerTema.namaPengguna.isNotEmpty
                  ? providerTema.namaPengguna
                  : null,
              hint: const Text("Pilih nama"),
              isExpanded: true,
              items: ["hamzah", "yazid", "ina"]
                  .map(
                    (nama) => DropdownMenuItem(
                      value: nama,
                      child: Text(nama),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                providerTema.simpanNama(value!);
              },
            ),

            const SizedBox(height: 25),

            // ================= MENAMPILKAN NAMA =================
            Text(
              "Nama tersimpan: ${providerTema.namaPengguna.isEmpty ? "- Belum dipilih -" : providerTema.namaPengguna}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
