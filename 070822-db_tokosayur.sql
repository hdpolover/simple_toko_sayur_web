-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 07 Agu 2022 pada 15.06
-- Versi server: 8.0.29
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ngodingin_tokosayur`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_auth`
--

CREATE TABLE `tb_auth` (
  `user_id` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `role` int NOT NULL DEFAULT '2',
  `aktivasi` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `expired_otp` varchar(255) DEFAULT NULL,
  `created_at` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `tb_auth`
--

INSERT INTO `tb_auth` (`user_id`, `email`, `password`, `status`, `role`, `aktivasi`, `otp`, `expired_otp`, `created_at`, `is_deleted`) VALUES
(5, 'admin@tokosayur.com', '$2y$10$31CQBgl.x.HsutNvGn6IaucdHM8tpyp4/ymL4qF7IpYm4T/QBGTYO', 1, 1, '0f49f2360cfbcfb6f0e033f40faff81437ba612bf45b15ebdba9497ccff2d2488c7b7adb89b011b4aec44e01c2647c22f1d9d91d92aa17c14dbaa1b7bc9ce7fcn5d3vWDzwKCfCnKRYtG8m8A+2svUN8hIQ3JOJcN96bw=', 'eda15e5c1f2778f0a2b8323f0914ca8fcc530e55fef4e5d9ad4e6d214509ac3f3bcac94d55d994942c54cb9ba79fcf068bf8c8422f89d0c8b5b45e2a4a917b6b8fo6H+TYmVxHfBFhrWLw0TlJ9VfhB8+I1QBjLQN73Vo=', '1653839610', 0, 0),
(6, 'mahendradwipurwanto@gmail.com', '$2y$10$wx7x9ndaPAKvB6MG.CP75uazGTc2IxW5cPP4e1bCqe4InPUEDdcsC', 1, 2, 'c209cb53caf5e85f3bad79c9f072f32de5aaeeab1127009dd773050e493e28a55741673124cf738ad826399314b911407bc9702bd3261319aec7832c859b162bYSyyhuOvW0PrYvK/rem8JU+U8orOHN/KJLWjcY8hi/Y=', '8b978d7c46cc3eca0eb162184cb6093a98750f78e28eadd2bff63c552eca25c7243fe58b2702991a4ab8e5b41a8c69ffd74e0fefa6621f5d82edd67c9878d9c3DPfade2y/BsBRxWFiGeJp2V4KOIpydkNvrFNGMMJrBA=', '1657083370', 1656229653, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengunjung`
--

CREATE TABLE `tb_pengunjung` (
  `id` int NOT NULL,
  `device` text,
  `created_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `tb_pengunjung`
--

INSERT INTO `tb_pengunjung` (`id`, `device`, `created_at`) VALUES
(175, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36', 1653885323),
(176, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 1656229631),
(177, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 1656229704),
(178, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 1656229718),
(179, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 1656229749),
(180, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 1656229772),
(181, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 1656229952),
(182, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 1656230109),
(183, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 1656230123),
(184, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657082517),
(185, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657082517),
(186, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657082547),
(187, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657082549),
(188, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657082552),
(189, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657082667),
(190, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657082682),
(191, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.90 Safari/537.36 2345Explorer/9.4.3.17934', 1657082757),
(192, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657083379),
(193, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657083386),
(194, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657083394),
(195, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657083407),
(196, 'Go-http-client/1.1', 1657084016),
(197, 'Go-http-client/1.1', 1657085764),
(198, 'Go-http-client/1.1', 1657087557),
(199, 'Mozilla/5.0 (Linux; U; Android 2.2; ja-jp; SC-02B Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', 1657088960),
(200, 'Mozilla/5.0 (Linux; U; Android 2.2; ja-jp; SC-02B Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', 1657088965),
(201, 'Go-http-client/1.1', 1657089421),
(202, 'Go-http-client/1.1', 1657091206),
(203, 'Go-http-client/1.1', 1657092988),
(204, 'Go-http-client/1.1', 1657094784),
(205, 'Go-http-client/1.1', 1657096594),
(206, 'Go-http-client/1.1', 1657098395),
(207, 'Go-http-client/1.1', 1657100220),
(208, 'Go-http-client/1.1', 1657102039),
(209, 'Go-http-client/1.1', 1657103800),
(210, 'Go-http-client/1.1', 1657105583),
(211, 'Go-http-client/1.1', 1657107387),
(212, 'Go-http-client/1.1', 1657109163),
(213, 'Go-http-client/1.1', 1657110984),
(214, 'Go-http-client/1.1', 1657112755),
(215, 'Go-http-client/1.1', 1657114566),
(216, 'Go-http-client/1.1', 1657116423),
(217, 'Go-http-client/1.1', 1657118175),
(218, 'Mozilla/5.0 (Linux; Android 12; POCO F2 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 1657119609),
(219, 'Go-http-client/1.1', 1657120004),
(220, 'Go-http-client/1.1', 1657121793),
(221, 'Go-http-client/1.1', 1657123537),
(222, 'Go-http-client/1.1', 1657125383),
(223, 'Mozilla/5.0 (Linux; Android 12; POCO F2 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 1657125776),
(224, 'Go-http-client/1.1', 1657127174),
(225, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.71 Safari/537.36', 1657127326),
(226, 'Go-http-client/1.1', 1657129021),
(227, 'Go-http-client/1.1', 1657130802),
(228, 'Go-http-client/1.1', 1657132606),
(229, 'Go-http-client/1.1', 1657134419),
(230, 'Go-http-client/1.1', 1657136231),
(231, 'Go-http-client/1.1', 1657138027),
(232, 'Go-http-client/1.1', 1657139801),
(233, 'Go-http-client/1.1', 1657141574),
(234, 'Go-http-client/1.1', 1657143424),
(235, 'Go-http-client/1.1', 1657145241),
(236, 'Go-http-client/1.1', 1657147056),
(237, 'Go-http-client/1.1', 1657148841),
(238, 'Go-http-client/1.1', 1657150593),
(239, 'Go-http-client/1.1', 1657152392),
(240, 'Go-http-client/1.1', 1657154192),
(241, 'Go-http-client/1.1', 1657155976),
(242, 'Go-http-client/1.1', 1657157766),
(243, 'Go-http-client/1.1', 1657159578),
(244, 'Go-http-client/1.1', 1657161449),
(245, 'Go-http-client/1.1', 1657163208),
(246, 'Go-http-client/1.1', 1657165048),
(247, 'Go-http-client/1.1', 1657166785),
(248, 'Go-http-client/1.1', 1657168592),
(249, 'Go-http-client/1.1', 1657170389),
(250, 'Go-http-client/1.1', 1657172197),
(251, 'Mozilla/5.0 (Linux; Android 12; POCO F2 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 1657172362),
(252, 'Go-http-client/1.1', 1657174001),
(253, 'Go-http-client/1.1', 1657175819),
(254, 'Go-http-client/1.1', 1657177576),
(255, 'Go-http-client/1.1', 1657179447),
(256, 'Go-http-client/1.1', 1657181202),
(257, 'Go-http-client/1.1', 1657183047),
(258, 'Go-http-client/1.1', 1657184817),
(259, 'Go-http-client/1.1', 1657186634),
(260, 'Go-http-client/1.1', 1657188459),
(261, 'Go-http-client/1.1', 1657190267),
(262, 'Mozilla/5.0 (Linux; Android 12; POCO F2 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 1657191183),
(263, 'Go-http-client/1.1', 1657192049),
(264, 'Go-http-client/1.1', 1657193813),
(265, 'Go-http-client/1.1', 1657195632),
(266, 'Go-http-client/1.1', 1657197479),
(267, 'Go-http-client/1.1', 1657199240),
(268, 'Go-http-client/1.1', 1657201037),
(269, 'Go-http-client/1.1', 1657202871),
(270, 'Go-http-client/1.1', 1657204677),
(271, 'Go-http-client/1.1', 1657206464),
(272, 'Go-http-client/1.1', 1657208274),
(273, 'Go-http-client/1.1', 1657210036),
(274, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657211661),
(275, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657211665),
(276, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 1657211673),
(277, 'Go-http-client/1.1', 1657211838),
(278, 'Go-http-client/1.1', 1657213633),
(279, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', 1657214145),
(280, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', 1657214145),
(281, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', 1657214148),
(282, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', 1657214148),
(283, 'Go-http-client/1.1', 1657215450),
(284, 'Go-http-client/1.1', 1657217262),
(285, 'Go-http-client/1.1', 1657219045),
(286, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', 1657219859),
(287, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', 1657219860),
(288, 'Go-http-client/1.1', 1657220875),
(289, 'Go-http-client/1.1', 1657222708),
(290, 'Go-http-client/1.1', 1657224503),
(291, 'Go-http-client/1.1', 1657226247),
(292, 'Go-http-client/1.1', 1657228055),
(293, 'Go-http-client/1.1', 1657229867),
(294, 'Go-http-client/1.1', 1657231669),
(295, 'Go-http-client/1.1', 1657233526),
(296, 'Go-http-client/1.1', 1657235316),
(297, 'Go-http-client/1.1', 1657236979),
(298, 'Go-http-client/1.1', 1657238892),
(299, 'Go-http-client/1.1', 1657240646),
(300, 'Go-http-client/1.1', 1657242439),
(301, 'Go-http-client/1.1', 1657244266),
(302, 'Go-http-client/1.1', 1657246032),
(303, 'Go-http-client/1.1', 1657247878),
(304, 'Go-http-client/1.1', 1657249654),
(305, 'Go-http-client/1.1', 1657251457),
(306, 'Go-http-client/1.1', 1657253247),
(307, 'Go-http-client/1.1', 1657255049),
(308, 'Go-http-client/1.1', 1657256835),
(309, 'Go-http-client/1.1', 1657258651),
(310, 'Go-http-client/1.1', 1657260431),
(311, 'Go-http-client/1.1', 1657262273),
(312, 'Go-http-client/1.1', 1657264084),
(313, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/215.1.452881003 Mobile/19F77 Safari/604.1', 1657265290),
(314, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/215.1.452881003 Mobile/19F77 Safari/604.1', 1657265525),
(315, 'Go-http-client/1.1', 1657265854),
(316, 'Go-http-client/1.1', 1657267670),
(317, 'Go-http-client/1.1', 1657269454),
(318, 'Go-http-client/1.1', 1657271284),
(319, 'Go-http-client/1.1', 1657273113),
(320, 'Go-http-client/1.1', 1657274886),
(321, 'Go-http-client/1.1', 1657276678),
(322, 'Go-http-client/1.1', 1657278438),
(323, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657280184),
(324, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657280190),
(325, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 1657280198),
(326, 'Go-http-client/1.1', 1657280271),
(327, 'Go-http-client/1.1', 1657282051),
(328, 'Go-http-client/1.1', 1657283875),
(329, 'Go-http-client/1.1', 1657285674),
(330, 'Go-http-client/1.1', 1657287500),
(331, 'Go-http-client/1.1', 1657289283),
(332, 'Go-http-client/1.1', 1657291108),
(333, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BW/1.1; bit.ly/2W6Px8S; d88deae0ac) Chrome/84.0.4147.105 Safari/537.36', 1657292141),
(334, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BW/1.1; bit.ly/2W6Px8S; d88deae0ac) Chrome/84.0.4147.105 Safari/537.36', 1657292545),
(335, 'Go-http-client/1.1', 1657292857),
(336, 'Go-http-client/1.1', 1657294665),
(337, 'Go-http-client/1.1', 1657296471),
(338, 'Go-http-client/1.1', 1657298237),
(339, 'Go-http-client/1.1', 1657300045),
(340, 'Go-http-client/1.1', 1657301857),
(341, 'Go-http-client/1.1', 1657303647),
(342, 'Go-http-client/1.1', 1657305497),
(343, 'Go-http-client/1.1', 1657307290),
(344, 'Go-http-client/1.1', 1657309063),
(345, 'Go-http-client/1.1', 1657310875),
(346, 'Go-http-client/1.1', 1657312705),
(347, 'Go-http-client/1.1', 1657314443),
(348, 'Go-http-client/1.1', 1657316321),
(349, 'Go-http-client/1.1', 1657318136),
(350, 'Go-http-client/1.1', 1657319928),
(351, 'Go-http-client/1.1', 1657321692),
(352, 'Go-http-client/1.1', 1657323465),
(353, 'Go-http-client/1.1', 1657325261),
(354, 'Go-http-client/1.1', 1657327078),
(355, 'Go-http-client/1.1', 1657328815),
(356, 'Go-http-client/1.1', 1657330677),
(357, 'Go-http-client/1.1', 1657332535),
(358, 'Go-http-client/1.1', 1657334363),
(359, 'Go-http-client/1.1', 1657336051),
(360, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1', 1657337813),
(361, 'Go-http-client/1.1', 1657337899),
(362, 'Go-http-client/1.1', 1657339670),
(363, 'Go-http-client/1.1', 1657341474),
(364, 'Go-http-client/1.1', 1657343262),
(365, 'Go-http-client/1.1', 1657345089),
(366, 'Go-http-client/1.1', 1657346880),
(367, 'Go-http-client/1.1', 1657348683),
(368, 'Go-http-client/1.1', 1657350473),
(369, 'Go-http-client/1.1', 1657352290),
(370, 'Go-http-client/1.1', 1657354084),
(371, 'Go-http-client/1.1', 1657355889),
(372, 'Go-http-client/1.1', 1657357685),
(373, 'Go-http-client/1.1', 1657359524),
(374, 'Go-http-client/1.1', 1657361357),
(375, 'Go-http-client/1.1', 1657363172),
(376, 'Go-http-client/1.1', 1657364964),
(377, 'Go-http-client/1.1', 1657366750),
(378, 'Go-http-client/1.1', 1657368480),
(379, 'Go-http-client/1.1', 1657370324),
(380, 'Go-http-client/1.1', 1657372114),
(381, 'Go-http-client/1.1', 1657373936),
(382, 'Go-http-client/1.1', 1657375734),
(383, 'Go-http-client/1.1', 1657377505),
(384, 'Go-http-client/1.1', 1657379313),
(385, 'Go-http-client/1.1', 1657381186),
(386, 'Go-http-client/1.1', 1657382919),
(387, 'Go-http-client/1.1', 1657384731),
(388, 'Go-http-client/1.1', 1657386516),
(389, 'Go-http-client/1.1', 1657388311),
(390, 'Go-http-client/1.1', 1657390142),
(391, 'Go-http-client/1.1', 1657391935),
(392, 'Go-http-client/1.1', 1657393725),
(393, 'Go-http-client/1.1', 1657395520),
(394, 'Go-http-client/1.1', 1657397311),
(395, 'Go-http-client/1.1', 1657399115),
(396, 'Go-http-client/1.1', 1657400885),
(397, 'Go-http-client/1.1', 1657402720),
(398, 'Go-http-client/1.1', 1657404521),
(399, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657431899),
(400, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657431904),
(401, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657465111),
(402, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657465117),
(403, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 1657465125),
(404, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/215.1.452881003 Mobile/19F77 Safari/604.1', 1657552880),
(405, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/215.1.452881003 Mobile/19F77 Safari/604.1', 1657553622),
(406, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657579845),
(407, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657579849),
(408, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 1657579854),
(409, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657680049),
(410, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657680053),
(411, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', 1657680059),
(412, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657706685),
(413, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1657706685),
(414, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657803117),
(415, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657803123),
(416, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 1657803125),
(417, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1657820601),
(418, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1657820601),
(419, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1657820604),
(420, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1657820604),
(421, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657828733),
(422, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657828737),
(423, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1657828745),
(424, 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 1658264795),
(425, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1658294449),
(426, 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 1658364161),
(427, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1658414419),
(428, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1658414419),
(429, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1658713829),
(430, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1658713829),
(431, 'Apache-HttpClient/5.1.3 (Java/11.0.14.1)', 1658768709),
(432, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1658768710),
(433, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1658768711),
(434, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', 1658768734),
(435, 'Apache-HttpClient/5.1.3 (Java/11.0.14.1)', 1658871807),
(436, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1658871807),
(437, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1658871808),
(438, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1658871823),
(439, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BW/1.1; bit.ly/2W6Px8S; d88deae0ac) Chrome/84.0.4147.105 Safari/537.36', 1658935245),
(440, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.71 Safari/537.36', 1658942091),
(441, 'Apache-HttpClient/5.1.3 (Java/11.0.14.1)', 1658959774),
(442, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1658959774),
(443, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1658959775),
(444, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 1658959792),
(445, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.5 Mobile/15E148 Safari/604.1', 1659024663),
(446, 'Apache-HttpClient/5.1.3 (Java/11.0.14.1)', 1659210848),
(447, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1659210849),
(448, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1659210849),
(449, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 1659210890),
(450, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36', 1659244385),
(451, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BW/1.1; bit.ly/2W6Px8S; d88deae0ac) Chrome/84.0.4147.105 Safari/537.36', 1659406606),
(452, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko; compatible; BW/1.1; bit.ly/2W6Px8S; d88deae0ac) Chrome/84.0.4147.105 Safari/537.36', 1659407050),
(453, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 1659430452),
(454, 'Apache-HttpClient/5.1.3 (Java/11.0.14.1)', 1659561983),
(455, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 1659561985),
(456, 'Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0', 1659561988);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sayur`
--

CREATE TABLE `tb_sayur` (
  `id` int NOT NULL,
  `sayur` varchar(50) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT 'assets/images/placeholder.png',
  `stok` int NOT NULL DEFAULT '0',
  `harga` int DEFAULT NULL,
  `keterangan` text,
  `created_at` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `tb_sayur`
--

INSERT INTO `tb_sayur` (`id`, `sayur`, `gambar`, `stok`, `harga`, `keterangan`, `created_at`, `is_deleted`) VALUES
(9, 'Kentang Segar', 'berkas/sayur/1656229744.jpg', 3, 25000, '', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_settings`
--

CREATE TABLE `tb_settings` (
  `key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` int NOT NULL DEFAULT '0',
  `modified_at` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_settings`
--

INSERT INTO `tb_settings` (`key`, `value`, `desc`, `created_at`, `modified_at`, `is_deleted`) VALUES
('mailer_alias', 'Toko Sayur Indonesia', NULL, 1653641032, 0, 0),
('mailer_host', 'smtp.gmail.com', NULL, 1653641032, 0, 0),
('mailer_mode', '3', NULL, 1653641032, 0, 0),
('mailer_password', 'iifyzefowfvvppkk', NULL, 1653641032, 0, 0),
('mailer_port', '587', NULL, 1653641032, 0, 0),
('mailer_username', 'ngodingin.indonesia@gmail.com\r\n', NULL, 1653641032, 0, 0),
('web_desc', 'This is Base Project Template', NULL, 1653641032, 0, 0),
('web_icon', 'favicon.ico', NULL, 1653641032, 0, 0),
('web_logo', 'favicon.ico', NULL, 1653641032, 0, 0),
('web_title', 'Toko Sayur', NULL, 1653641032, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `profil` varchar(255) DEFAULT 'assets/images/profile.png',
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `nama`, `profil`, `no_telp`, `alamat`) VALUES
(5, 'Ngodingin Indonesia', 'assets/images/profile.png', '085785111746', NULL),
(6, 'Mahendra Dwi Purwanto', 'assets/images/profile.png', '085785111746', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_wishlist`
--

CREATE TABLE `tb_wishlist` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `catatan` text,
  `status` int NOT NULL DEFAULT '1',
  `created_at` int NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `tb_wishlist`
--

INSERT INTO `tb_wishlist` (`id`, `user_id`, `catatan`, `status`, `created_at`, `is_deleted`) VALUES
(14, 6, 'test', 1, 1656230123, 0),
(15, 6, 'test', 1, 1657083407, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_wishlist_detail`
--

CREATE TABLE `tb_wishlist_detail` (
  `wishlist_id` int DEFAULT NULL,
  `sayur_id` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `tb_wishlist_detail`
--

INSERT INTO `tb_wishlist_detail` (`wishlist_id`, `sayur_id`, `jumlah`) VALUES
(14, 9, 5),
(15, 9, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_auth`
--
ALTER TABLE `tb_auth`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks untuk tabel `tb_pengunjung`
--
ALTER TABLE `tb_pengunjung`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_sayur`
--
ALTER TABLE `tb_sayur`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_settings`
--
ALTER TABLE `tb_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tb_wishlist`
--
ALTER TABLE `tb_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tb_wishlist_detail`
--
ALTER TABLE `tb_wishlist_detail`
  ADD KEY `wishlist_id` (`wishlist_id`),
  ADD KEY `sayur_id` (`sayur_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_auth`
--
ALTER TABLE `tb_auth`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_pengunjung`
--
ALTER TABLE `tb_pengunjung`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT untuk tabel `tb_sayur`
--
ALTER TABLE `tb_sayur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_wishlist`
--
ALTER TABLE `tb_wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_auth` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `tb_wishlist`
--
ALTER TABLE `tb_wishlist`
  ADD CONSTRAINT `tb_wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_auth` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `tb_wishlist_detail`
--
ALTER TABLE `tb_wishlist_detail`
  ADD CONSTRAINT `tb_wishlist_detail_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `tb_wishlist` (`id`),
  ADD CONSTRAINT `tb_wishlist_detail_ibfk_2` FOREIGN KEY (`sayur_id`) REFERENCES `tb_sayur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
