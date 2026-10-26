CREATE DATABASE literasi_ceria;
USE literasi_ceria;

-- Database Schema: Literasi Ceria
-- Role Pengguna: Siswa, Guru, Orang Tua, Admin

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('siswa', 'guru', 'orang_tua', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE kelas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kelas VARCHAR(50) NOT NULL,
    tingkat ENUM('1', '2', '3', '4', '5', '6') NOT NULL,
    guru_id INT,
    FOREIGN KEY (guru_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    kelas_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (kelas_id) REFERENCES kelas(id) ON DELETE SET NULL
);

CREATE TABLE orang_tua_siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orang_tua_id INT NOT NULL,
    siswa_id INT NOT NULL,
    FOREIGN KEY (orang_tua_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (siswa_id) REFERENCES siswa(id) ON DELETE CASCADE
);

CREATE TABLE materi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modul ENUM('membaca', 'menulis', 'mendengar') NOT NULL,
    tingkat_kelas ENUM('1', '2', '3', '4', '5', '6') NOT NULL,
    judul VARCHAR(150) NOT NULL,
    deskripsi TEXT
);

CREATE TABLE soal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    materi_id INT NOT NULL,
    konten_soal TEXT NOT NULL,
    kunci_jawaban TEXT NOT NULL,
    file_audio VARCHAR(255),
    file_gambar VARCHAR(255),
    FOREIGN KEY (materi_id) REFERENCES materi(id) ON DELETE CASCADE
);

CREATE TABLE tugas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kelas_id INT NOT NULL,
    materi_id INT NOT NULL,
    guru_id INT NOT NULL,
    deadline DATETIME,
    FOREIGN KEY (kelas_id) REFERENCES kelas(id) ON DELETE CASCADE,
    FOREIGN KEY (materi_id) REFERENCES materi(id) ON DELETE CASCADE,
    FOREIGN KEY (guru_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE sesi_belajar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT NOT NULL,
    mode ENUM('kelas', 'bebas') NOT NULL,
    tugas_id INT NULL,
    waktu_mulai TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (siswa_id) REFERENCES siswa(id) ON DELETE CASCADE,
    FOREIGN KEY (tugas_id) REFERENCES tugas(id) ON DELETE SET NULL
);

CREATE TABLE hasil_latihan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sesi_id INT NOT NULL,
    soal_id INT NOT NULL,
    jawaban_siswa TEXT,
    skor INT DEFAULT 0,
    umpan_balik TEXT,
    percobaan_ke INT DEFAULT 1,
    FOREIGN KEY (sesi_id) REFERENCES sesi_belajar(id) ON DELETE CASCADE,
    FOREIGN KEY (soal_id) REFERENCES soal(id) ON DELETE CASCADE
);

CREATE TABLE kesalahan_siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT NOT NULL,
    karakter_atau_kata VARCHAR(50) NOT NULL,
    jumlah_kesalahan INT DEFAULT 1,
    FOREIGN KEY (siswa_id) REFERENCES siswa(id) ON DELETE CASCADE
);

CREATE TABLE progres_siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT UNIQUE NOT NULL,
    total_bintang INT DEFAULT 0,
    total_skor INT DEFAULT 0,
    level_saat_ini INT DEFAULT 1,
    FOREIGN KEY (siswa_id) REFERENCES siswa(id) ON DELETE CASCADE
);


CREATE TABLE umpan_balik (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kategori ENUM('benar', 'hampir_benar', 'salah', 'salah_berulang') NOT NULL,
    pesan TEXT NOT NULL
);


CREATE TABLE lencana (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_lencana VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    icon_url VARCHAR(255)
);


CREATE TABLE siswa_lencana (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT NOT NULL,
    lencana_id INT NOT NULL,
    tanggal_didapat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (siswa_id) REFERENCES siswa(id) ON DELETE CASCADE,
    FOREIGN KEY (lencana_id) REFERENCES lencana(id) ON DELETE CASCADE
);