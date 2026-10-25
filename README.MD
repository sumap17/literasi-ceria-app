# Literasi Ceria 📚

Aplikasi Pembelajaran Membaca, Menulis, dan Mendengar dengan Umpan Balik Otomatis untuk Siswa Sekolah Dasar (Kelas 1–6).

## 📌 Deskripsi Proyek
"Literasi Ceria" adalah aplikasi berbasis Android yang dirancang untuk membantu siswa SD belajar membaca, menulis, dan mendengar melalui umpan balik interaktif secara otomatis. Aplikasi ini mendukung **Mode Kelas** (materi dari guru) dan **Mode Bebas** (latihan mandiri).

## 👥 Tim Pengembang
* **Project Manager:** Zarfan Azka
* **Finance & Marketing Officer:** Ikshan
* **System Analyst & Database Developer:** Sukma
* **UI/UX Designer & Software Tester:** Rizki
* **Android Developer & AI/ML Developer:** Faisal

## 🛠️ Persiapan Lingkungan Pengembangan (Stack & Tools)
* **Mobile / Frontend:** Android (Kotlin) / Flutter
* **Backend & API:** Node.js (Express)
* **Database:** MySQL (Server Utama) & Room/SQLite (Lokal Android)
* **AI Engine / Integration:** ML Kit Digital Ink Recognition, Speech-to-Text API, Text-to-Speech (TTS)

## 🗄️ Struktur Database
Database `literasi_ceria` terdiri dari 13 tabel utama:
1. `users`, `kelas`, `siswa`, `orang_tua_siswa` (Manajemen Akun Multi-peran)
2. `materi`, `soal`, `tugas` (Modul Pembelajaran & Mode Kelas)
3. `sesi_belajar`, `hasil_latihan`, `umpan_balik` (Riwayat & Feedback Otomatis)
4. `lencana`, `siswa_lencana`, `progres_siswa`, `kesalahan_siswa` (Gamifikasi & Perbaikan Adaptif)