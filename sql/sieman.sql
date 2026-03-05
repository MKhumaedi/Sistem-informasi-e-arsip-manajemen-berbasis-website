-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24 Jun 2022 pada 16.26
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sieman`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_arsip`
--

CREATE TABLE `data_arsip` (
  `id` int(11) NOT NULL,
  `noarsip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pencipta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit_pengolah` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `uraian` text COLLATE utf8_unicode_ci NOT NULL,
  `ket` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nobox` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `media` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` text COLLATE utf8_unicode_ci,
  `tgl_input` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `data_arsip`
--

INSERT INTO `data_arsip` (`id`, `noarsip`, `pencipta`, `unit_pengolah`, `tanggal`, `uraian`, `ket`, `kode`, `jumlah`, `nobox`, `lokasi`, `media`, `file`, `tgl_input`, `tgl_update`, `username`) VALUES
(130, '02', '5', '4', '2022-06-11', '', 'asli', '30', 1, '', '5', '5', 'Proposal_TA-KTI_M__Khumaedi.docx', '2022-06-11 13:32:53', '0000-00-00 00:00:00', 'admin'),
(125, '1111', '5', '6', '2021-07-14', 'wwww', 'asli', '9', 1, '009', '1', '8', '', '2021-07-14 14:22:38', '0000-00-00 00:00:00', 'admin'),
(126, '22222', '5', '6', '2021-07-14', 'eeeee', 'asli', '19', 1, '002', '1', '3', '', '2021-07-14 14:23:42', '0000-00-00 00:00:00', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_kode`
--

CREATE TABLE `master_kode` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `retensi` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `master_kode`
--

INSERT INTO `master_kode` (`id`, `kode`, `nama`, `retensi`) VALUES
(30, 'A120', 'Surat Jalan Tes Material', 1),
(29, 'UMUM.02', 'Inventaris Barang Bergerak', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_lokasi`
--

CREATE TABLE `master_lokasi` (
  `id` int(11) NOT NULL,
  `nama_lokasi` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `master_lokasi`
--

INSERT INTO `master_lokasi` (`id`, `nama_lokasi`) VALUES
(1, 'PPIC'),
(2, 'ENGINEERING'),
(3, 'COMERS'),
(4, 'IT'),
(5, 'QIP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_media`
--

CREATE TABLE `master_media` (
  `id` int(11) NOT NULL,
  `nama_media` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `master_media`
--

INSERT INTO `master_media` (`id`, `nama_media`) VALUES
(5, 'Document'),
(6, 'Audio Disc'),
(4, 'Blueprint'),
(3, 'Kartografi'),
(2, 'Tekstual'),
(7, 'Video Cartridge'),
(8, 'Digital'),
(9, 'Media'),
(10, 'USB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_pencipta`
--

CREATE TABLE `master_pencipta` (
  `id` int(11) NOT NULL,
  `nama_pencipta` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `master_pencipta`
--

INSERT INTO `master_pencipta` (`id`, `nama_pencipta`) VALUES
(5, 'Data Management');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_pengolah`
--

CREATE TABLE `master_pengolah` (
  `id` int(11) NOT NULL,
  `nama_pengolah` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `master_pengolah`
--

INSERT INTO `master_pengolah` (`id`, `nama_pengolah`) VALUES
(1, 'Unit Arsip QIP'),
(4, 'Unit Arsip Bea dan Cukai'),
(2, 'Unit Arsip Kepegawaian'),
(5, 'Unit Arsip Pengadaan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_user`
--

CREATE TABLE `master_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` enum('admin','user') COLLATE utf8_unicode_ci NOT NULL,
  `akses_klas` text COLLATE utf8_unicode_ci NOT NULL,
  `akses_modul` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `master_user`
--

INSERT INTO `master_user` (`id`, `username`, `password`, `tipe`, `akses_klas`, `akses_modul`) VALUES
(1, 'admin', '$2y$10$M57KBHBtl9HsFQP6rxrqUOuSqO/MiQJnTqTu4wM5OlWwa/lTKyb2S', 'admin', '', '{"entridata":"on","sirkulasi":"on","klasifikasi":"on","pencipta":"on","pengolah":"on","lokasi":"on","media":"on","user":"on"}'),
(6, 'user', '$2y$10$m2Ewr1J9ONSIX/lNM6g.AeY5sOQbPZsKICK5jqlN.4.rcIce0zf4G', 'user', 'Sirkulasi', '{"sirkulasi":"on","klasifikasi":"on"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sirkulasi`
--

CREATE TABLE `sirkulasi` (
  `id` int(11) NOT NULL,
  `noarsip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username_peminjam` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keperluan` text COLLATE utf8_unicode_ci,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_haruskembali` datetime NOT NULL,
  `tgl_pengembalian` datetime DEFAULT NULL,
  `tgl_transaksi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sirkulasi`
--

INSERT INTO `sirkulasi` (`id`, `noarsip`, `username_peminjam`, `keperluan`, `tgl_pinjam`, `tgl_haruskembali`, `tgl_pengembalian`, `tgl_transaksi`) VALUES
(13, '002', 'user', 'pajak kendaraan', '2021-07-16 00:00:00', '2021-07-20 00:00:00', NULL, '2021-07-22 20:15:06'),
(11, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-07-22 20:09:36', '2021-07-22 20:09:26'),
(10, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-07-22 20:07:43', '2021-07-22 20:06:50'),
(8, '001', 'may', 'jkfuga', '2021-07-17 00:00:00', '2021-07-17 00:00:00', NULL, '2021-07-17 05:40:30'),
(7, '001', 'azzahra', 'ingin pinjam', '2021-07-17 00:00:00', '2021-07-24 00:00:00', NULL, '2021-07-17 05:39:26'),
(14, '01', 'bab1', 'tugas', '2021-10-06 00:00:00', '2021-10-07 00:00:00', NULL, '2021-10-06 22:28:48'),
(15, '001', 'user', 'tugas', '2021-10-06 00:00:00', '2021-10-07 00:00:00', NULL, '2021-10-06 22:31:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_log`
--

CREATE TABLE `system_log` (
  `id` int(11) NOT NULL,
  `kode_transaksi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username_transaksi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tgl_transaksi` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_arsip`
--
ALTER TABLE `data_arsip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noarsip` (`noarsip`),
  ADD KEY `pencipta` (`pencipta`),
  ADD KEY `unit_pengolah` (`unit_pengolah`);
ALTER TABLE `data_arsip` ADD FULLTEXT KEY `uraian` (`uraian`);

--
-- Indexes for table `master_kode`
--
ALTER TABLE `master_kode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD KEY `nama` (`nama`);

--
-- Indexes for table `master_lokasi`
--
ALTER TABLE `master_lokasi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_lokasi` (`nama_lokasi`);

--
-- Indexes for table `master_media`
--
ALTER TABLE `master_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_media` (`nama_media`);

--
-- Indexes for table `master_pencipta`
--
ALTER TABLE `master_pencipta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_pencipta` (`nama_pencipta`);

--
-- Indexes for table `master_pengolah`
--
ALTER TABLE `master_pengolah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_pengolah` (`nama_pengolah`);

--
-- Indexes for table `master_user`
--
ALTER TABLE `master_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sirkulasi`
--
ALTER TABLE `sirkulasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noarsip` (`noarsip`),
  ADD KEY `username_peminjam` (`username_peminjam`),
  ADD KEY `tgl_pinjam` (`tgl_pinjam`),
  ADD KEY `tgl_pengembalian` (`tgl_pengembalian`),
  ADD KEY `tgl_haruskembali` (`tgl_haruskembali`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `username_transaksi` (`username_transaksi`),
  ADD KEY `tgl_transaksi` (`tgl_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_arsip`
--
ALTER TABLE `data_arsip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `master_kode`
--
ALTER TABLE `master_kode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `master_lokasi`
--
ALTER TABLE `master_lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `master_media`
--
ALTER TABLE `master_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `master_pencipta`
--
ALTER TABLE `master_pencipta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `master_pengolah`
--
ALTER TABLE `master_pengolah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `master_user`
--
ALTER TABLE `master_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sirkulasi`
--
ALTER TABLE `sirkulasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
