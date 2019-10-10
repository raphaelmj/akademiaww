-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Mar 2019, 19:01
-- Wersja serwera: 10.1.37-MariaDB
-- Wersja PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `akademia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `self_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`id`, `name`, `alias`, `self_link`, `updated_at`) VALUES
(1, 'Aktualności', 'aktualnosci', 'aktualnosci', '2019-02-11 17:28:24');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `content`
--

CREATE TABLE `content` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `self_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `content`
--

INSERT INTO `content` (`id`, `category_id`, `title`, `alias`, `image`, `intro`, `content`, `self_link`, `status`, `updated_at`) VALUES
(1, 1, 'Hello World', 'hello-world', NULL, 'Lorem ipsum to roboczy tekst używany do celów projektowych, zwykle do prezentacji kroju pisma, kompozycji, układu kolumn, wyglądu składu, typografii itd.\r\n\r\nWiększość tekstów niesie ze sobą swoje znaczenie, które narzuca odbiorcy wpływ na ocenę wyglądu. Lorem ipsum nie przekazuje bezpośredniej treści, jest ambiwalentny, pozwalając tym samym skupić się odbiorcy wyłącznie na wyglądzie.\r\n\r\nZa pomocą tego generatora możesz ', 'Lorem ipsum to roboczy tekst używany do celów projektowych, zwykle do prezentacji kroju pisma, kompozycji, układu kolumn, wyglądu składu, typografii itd.\r\n\r\nWiększość tekstów niesie ze sobą swoje znaczenie, które narzuca odbiorcy wpływ na ocenę wyglądu. Lorem ipsum nie przekazuje bezpośredniej treści, jest ambiwalentny, pozwalając tym samym skupić się odbiorcy wyłącznie na wyglądzie.\r\n\r\nZa pomocą tego generatora możesz ', NULL, 1, '2019-02-11 17:31:14');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `course`
--

CREATE TABLE `course` (
  `id` int(10) UNSIGNED NOT NULL,
  `school_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `summary_description` text COLLATE utf8_unicode_ci,
  `program_json` text COLLATE utf8_unicode_ci,
  `price_json` text COLLATE utf8_unicode_ci,
  `self_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `course`
--

INSERT INTO `course` (`id`, `school_id`, `name`, `alias`, `description`, `summary_description`, `program_json`, `price_json`, `self_link`, `ordering`, `updated_at`) VALUES
(4, 2, 'Junior Web Developer - tworzenie stron internetowych', 'junior-web-developer-tworzenie-stron-internetowych', '<p><em><strong>Porównaj z kosztami w innych szkołach</strong></em><br />{koszt:jwebdev.xlsx}</p>\r\n<center><img class=\"img-responsive\" src=\"images/icons/tematy.png\" alt=\"\" /></center>\r\n<p> </p>\r\n<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Kurs Szkoła 3W - Junior Web Developer jest kompleksowym szkoleniem z zakresu projektowania i budowania nowoczesnych, responsywnych stron internetowych. Podczas zajęć  uczestnicy poznają całą ścieżkę realizacji projektu w profesjonalnym studiu projektowym biorąc udział w każdym jego etapie. Tworząc projekt internetowy od koncepcji po zasady promocji będziecie uczyć się wykorzystywania najnowszych narzędzi i technologii pod okiem doświadczonych wykładowców.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\" style=\"text-align: center;\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest przygotowanie uczestnika do samodzielnej lub zespołowej pracy przy projektowaniu responsywnych witryn internetowych poprzez nabycie podstaw następujących umiejętności:<br />•    Zaprojektowania i przygotowania serwisu internetowego „od strony użytkownika” - front end development<br />•    Przygotowania „zaplecza” serwisu internetowego do współpracy z serwerem - back end development</p>\r\n', '\r\n<h2 class=\"typszkolenia\"> Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br />B: stacjonarne, wyjazdowe, online;<br />C: ogólnodostępne, zamknięte;<br />D: standardowe, szyte na miarę.</p>\r\n<p style=\"text-align: center;\"> </p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Bardzo sprawne posługiwanie się myszą i klawiaturą, umiejętność tworzenia folderów i plików. Cierpliwość i chęć uczenia się. Dobrze widziana jest podstawowa znajomość języka angielskiego.</p>\r\n<p> </p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p><br /> <br /><strong> Możliwe jest również uzyskani <em>DYPLOMU AKADEMII WWW</em> po przedstawieniu pracy dyplomowej</strong>, w formie w pełni funkcjonalnego projektu internetowego zbudowanego z wykorzystaniem wiedzy nabytej podczas szkolenia.</p>\r\n<p>{koszt:jwebdev.xlsx}<br />{zapis:jwebdev}</p>\r\n<p> </p>\r\n<p><span style=\"border-radius: 2px; text-indent: 20px; width: auto; padding: 0px 4px 0px 0px; text-align: center; font: bold 11px/20px \'Helvetica Neue\',Helvetica,sans-serif; color: #ffffff; background: #bd081c  no-repeat scroll 3px 50% / 14px 14px; position: absolute; opacity: 1; z-index: 8675309; display: none; cursor: pointer;\">Zapisz</span></p>\r\n<p><span style=\"border-radius: 2px; text-indent: 20px; width: auto; padding: 0px 4px 0px 0px; text-align: center; font: bold 11px/20px \'Helvetica Neue\',Helvetica,sans-serif; color: #ffffff; background: #bd081c  no-repeat scroll 3px 50% / 14px 14px; position: absolute; opacity: 1; z-index: 8675309; display: none; cursor: pointer;\">Zapisz</span></p>\r\n<p><span style=\"border-radius: 2px; text-indent: 20px; width: auto; padding: 0px 4px 0px 0px; text-align: center; font: bold 11px/20px \'Helvetica Neue\',Helvetica,sans-serif; color: #ffffff; background: #bd081c  no-repeat scroll 3px 50% / 14px 14px; position: absolute; opacity: 1; z-index: 8675309; display: none; cursor: pointer;\">Zapisz</span></p>\r\n<p><span style=\"border-radius: 2px; text-indent: 20px; width: auto; padding: 0px 4px 0px 0px; text-align: center; font: bold 11px/20px \'Helvetica Neue\',Helvetica,sans-serif; color: #ffffff; background: #bd081c  no-repeat scroll 3px 50% / 14px 14px; position: absolute; opacity: 1; z-index: 8675309; display: none; cursor: pointer;\">Zapisz</span></p>\r\n<p><span style=\"border-radius: 2px; text-indent: 20px; width: auto; padding: 0px 4px 0px 0px; text-align: center; font: bold 11px/20px \'Helvetica Neue\',Helvetica,sans-serif; color: #ffffff; background: #bd081c  no-repeat scroll 3px 50% / 14px 14px; position: absolute; opacity: 1; z-index: 8675309; display: none; cursor: pointer;\">Zapisz</span></p>', NULL, NULL, 'tworzenie-stron-www/junior-web-developer-projektowanie-i-budowa-stron-internetowych', 1, '2019-03-01 13:44:59'),
(5, NULL, 'Junior Frontend Developer', 'junior-front-end-developer', '<p>{koszt:jfrontdev.xlsx}</p>\r\n<center><img class=\"img-responsive\" src=\"images/icons/tematy2.png\" alt=\"\" /></center>\r\n<p> </p>\r\n<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Kurs Junior Frontend Developer daje uczestnikom podstawy wiedzy niezbędnej  do pracy przy projektowaniu i budowaniu stron internetowych. Na zajęciach uczymy m.in. „pisać” strony w HTML i korzystać z edytorów oraz jak profesjonalnie „ciąć” projekty graficzno - funkcjonalne, tworzyć z nich szablony przy użyciu arkuszy stylowych ( CSS ) a także jak tworzyć efekty wizualne przy wykorzystaniu bibliotek JQuery.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest przygotowanie uczestnika w zakresie niezbędnym do samodzielnej pracy przy projektowaniu i budowie nowoczesnych,responsywnych witryn internetowych poprzez nabycie następujących umiejętności:<br />•    Poznanie słownika i składni HTML5;<br />•    Łączenia kodu HTML / CSS / JavaScript <br />•    Modyfikowania kodu HTML / CSS;<br />•    Tworzenia i optymalizowania skryptów JavaScript.<br />•    Wykorzystywania systemów CMS</p>\r\n<p> </p>\r\n', '\r\n<h2> </h2>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Sprawne posługiwanie się myszą i klawiaturą, umiejętność tworzenia folderów i plików. Znajomość języka angielskiego będzie sprzyjała nauce.</p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p><br /> <strong>Możliwe jest również uzyskani <em>DYPLOMU AKADEMII WWW</em> po przedstawieniu pracy dyplomowej</strong>, w formie w pełni funkcjonalnego projektu internetowego zbudowanego z wykorzystaniem wiedzy nabytej podczas szkolenia.</p>\r\n<p>Zobacz także: <em><strong><a href=\"tworzenie-stron-www/junior-web-developer-projektowanie-i-budowa-stron-internetowych\" target=\"_blank\" rel=\"alternate noopener noreferrer\">Junior Web Developer</a>, <a href=\"tworzenie-stron-www/junior-back-end-developer\" target=\"_blank\" rel=\"alternate noopener noreferrer\">Junior Back End</a> </strong></em></p>\r\n<p>{koszt:jfrontdev.xlsx}<br />{zapis:jfrontdev}</p>\r\n<p> </p>\r\n<p> </p>', NULL, NULL, 'tworzenie-stron-www/frontenddeveloper', 1, '2019-03-01 12:56:34'),
(6, 2, 'Junior Backend Developer', 'junior-backend-developer', '<center><img class=\"img-responsive\" src=\"images/icons/tematy3.png\" alt=\"\" /></center>\r\n<p> </p>\r\n<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Szkolenie przeznaczone jest dla osób, które zamierzają zająć się zawodowo i specjalizować w programowaniu na potrzeby Internetu: dysponują wyobraźnią, nie są pozbawione cierpliwości i dokładności. Nasz kurs daje solidne podstawy do tego, byś mógł być osobą odpowiedzialną za \"oprogramowanie\" najwymyślniejszego nawet projektu internetowego. Uczymy podstaw programowania zorientowanego obiektowo oraz języka PHP w połączeniu z wykorzystaniem frameworków Angular i Laravel.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest przygotowanie uczestników do tworzenia „zaplecza” serwisu internetowego  sprawnie współpracującego z serwerem.</p>\r\n<p> </p>\r\n', '\r\n<h2> </h2>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe,indywidualne;<br /> B: stacjonarne,  online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Bardzo dobra znajomość obsługi komputera, w tym swobodne posługiwanie się myszą i klawiaturą oraz podstawowa znajomość obsługi arkusza kalkulacyjnego. Niezbędna znajomość <em><strong>HTML5 i CSS3</strong> (Sugerujemy uczestnictwo w szkoleniu<a title=\"Junior Front End Developer\" href=\"tworzenie-stron-www/junior-front-end-developer\" target=\"_blank\" rel=\"author noopener noreferrer\"><strong> Junior Front End Developer</strong></a>)</em>.</p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p>{koszt:jbackdev.xlsx}<span style=\"font-size: 12pt;\"><strong><a title=\"Terminy\" href=\"terminy\" target=\"_blank\" rel=\"alternate noopener noreferrer\"><br /></a></strong></span>{zapis:jbackdev}</p>\r\n<p> </p>\r\n<p> </p>', NULL, NULL, 'tworzenie-stron-www/junior-back-end-developer', 2, '2019-03-01 13:45:00'),
(7, 1, 'Junior Backend Javascript Developer', 'junior-backend-javascript-developer', '<p>{koszt:jbackjscdev.xlsx}</p>\r\n<p><img src=\"images/icons_offer/backJS.png\" alt=\"\" /><br /> </p>\r\n<center></center>\r\n<p> Opis szkolenia</p>\r\n<p>Java Script stał się popularnym językiem programowania dzięki powszechnej implementacji w przeglądarkach internetowych. Jego współczesne zastosowania daleko jednak wykraczają poza ten obszar. Obejmują nie tylko aplikacje klienckie ale też zastosowania bazodanowe które z powodzeniem mogą zastąpić klasyczny duet PHP - MySQL. Dzięki nowemu podejściu do tego języka , coraz częściej wykorzystywany jest do projektowania nowoczesnych aplikacji natywnych dla różnych systemów operacyjnych i urządzeń.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest przygotowanie uczestników do tworzenia „zaplecza” serwisu internetowego  sprawnie współpracującego z serwerem w oparciu o Java Script.</p>\r\n', '\r\n<h2 class=\"typszkolenia\"> Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe,indywidualne;<br /> B: stacjonarne,  online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Bardzo dobra znajomość obsługi komputera, w tym swobodne posługiwanie się myszą i klawiaturą oraz podstawowa znajomość obsługi arkusza kalkulacyjnego. Znajomość podstaw <em><strong>HTML5 i CSS3</strong> (Sugerujemy uczestnictwo w szkoleniu<a title=\"Junior Front End Developer\" href=\"tworzenie-stron-www/junior-front-end-developer\" target=\"_blank\" rel=\"author noopener noreferrer\"><strong> Junior Front End Developer</strong></a>)</em>.</p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p>{koszt:jbackjscdev.xlsx}<span style=\"font-size: 12pt;\"><strong><a title=\"Terminy\" href=\"terminy\" target=\"_blank\" rel=\"alternate noopener noreferrer\"><br /></a></strong></span>{zapis:jbackjscdev}</p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>', NULL, NULL, 'tworzenie-stron-www/junior-backend-javascript-developer', 4, '2019-03-01 13:36:30'),
(8, 1, 'HTML 5 / CSS 3 / SASS /  GIT / SVG', 'html-5-css-3', '<p>{koszt:html_css.xlsx}</p>\r\n<h2 class=\"opisszkolenia\"><span style=\"color: #ffffff;\">Opis szkolenia</span></h2>\r\n<p>Umiejętność posługiwania się językiem HTML umożliwia poznanie wielu innych narzędzi do tworzenia stron internetowych. Stanowi on fundament każdej strony internetowej. W połączeniu z kaskadowymi arkuszami stylowymi (CSS) daje możliwość utworzenia w pełni funkcjonalnego serwisu www. HTML jest bardzo prosty w nauce. W oferowanym szkoleniu proponujemy zapoznanie się z najnowszymi wersjami HTML 5 i CSS3 oraz - co jest obecnie niezbędne - z tajnikami Bootstrpa - zapewniającego serwisowi \"responsywność\" tj. dostosowanie się do każdego urządzenia wyświetlającego:smartfona, tabletu, notebooka czy ekranie PC-eta. <br /><br />Nasi trenerzy wprowadzą Cię w tajniki kodu HTML-owego, wskażą najczęściej popełniane błędy. Nauczą, jak za pomocą klawiatury, notatnika i niewielkiej ilości tzw. „znaczników”  wywoływać  odpowiednie efekty na ekranie monitora twojego komputera, a dzięki sieci www – na wszystkich komputerach…</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest przygotowanie słuchacza do samodzielnej konstrukcji prostych, responsywnych i w pełni funkcjonalnych witryn internetowych przy pomocy HTML5 oraz arkuszy stylowych CSS3.</p>\r\n', '\r\n<p> </p>\r\n<h2 class=\"typszkolenia\"> Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\"> Wymagania</h2>\r\n<p>Sprawne posługiwanie się myszą i klawiaturą, umiejętność tworzenia folderów i plików. Dobra znajomość pakietu Office będzie sprzyjała nauce.</p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.<br /><br /><span style=\"color: #ffffff;\"><strong><span style=\"background-color: #000080;\">UWAGA! Promocja! Zajęcia popołudniowe 30% taniej<span style=\"color: #ff0000;\">*</span></span></strong></span></p>\r\n<p><span style=\"font-size: 12pt;\"><strong><a title=\"Terminy\" href=\"terminy\" target=\"_blank\" rel=\"alternate noopener noreferrer\">TERMINY</a></strong></span></p>\r\n<p>{koszt:html_css.xlsx}</p>\r\n<p>{zapis:htmlcss} </p>\r\n<p>*<span style=\"font-size: 8pt;\">Po sformowaniu grupy minimum 5 osób</span></p>', NULL, NULL, 'tworzenie-stron-www/html-5-css-3', 2, '2019-03-01 13:36:30'),
(9, 1, 'CMS Wordpress', 'cms-wordpress', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p><br />Kurs Wordpress obejmuje zapoznanie się z CMS Wordpress od strony zaplecza oraz budowy szablonu. Krok po kroku na kursie nauczymy się implementowania projektu graficznego do silnika Wordpress oraz dowiemy jaki sposób zarządzać przygotowaną stroną.</p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p><br />Celem szkolenia jest nauka obsługi CMS Wordpress pod kątem aktualizacji i zarządzania treścią oraz przygotowanie pod kątem pozycjonowania (SEO). Na zajęciach nauczymy się również budowania własnego szablonu graficznego implementacji i stylowania.</p>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p><br />Podstawowa znajomość HTML, CSS (kaskadowe arkusze stylów) i minimalne podstawy  języka PHP będą mile widziane.<br /><br /></p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p><strong>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</strong></p>\r\n<p style=\"text-align: left;\">{koszt:wordpress.xlsx}<br /><span style=\"font-size: 12pt;\"><strong><a title=\"Terminy\" href=\"terminy\" target=\"_blank\" rel=\"noopener noreferrer\">TERMINY</a></strong></span><br /><strong>Zapisz się:</strong><br />{zapis:cmsw}</p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>', NULL, NULL, 'tworzenie-stron-www/cms-wordpress', 1, '2019-03-01 13:36:30'),
(10, 1, 'Webdesign - projektowanie graficzne dla WWW', 'webdesign', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Kurs Web designer daje jego absolwentowi kompleksowe przygotowanie do projektowania grafiki stron internetowych, pozwala także na zrozumienie wymagań stawianych przed serwisem internetowym takich jak: architektura informacji, nawigacja, użyteczność i interaktywność. Podczas zajęć uczestnicy nabywają wiedzę z zakresu obsługi takich narzędzi jak Photoshop, używanie CMS, Animate oraz elementy AfterEffect\'s.</p>\r\n<p><strong>Po ukończeniu szkolenia uczestnik będzie potrafił</strong>: zaprojektować layout zgodnie z zasadami web designu, zrealizować animację serwisu wzbogaconą o elementy eVideo oraz: „ciąć” grafikę i kodować szablony HTML / CSS we współpracy z programistami. Dzięki poznaniu systemu rozproszonych GIT wersji nabędą Państwo umiejętność pracy w zespole nad rozległymi projektami programistycznymi </p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Przygotowanie do samodzielnej pracy przy projektowaniu graficznym, animacji oraz eVideo na potrzeby witryn internetowych poprzez nabycie następujących umiejętności:<br /> </p>\r\n<ul>\r\n<li>Projektowania graficznego zgodnie z zasadami obowiązującymi dla projektów internetowych;</li>\r\n<li>Realizacji projektów przy użyciu szablonów CMS i Adobe Photoshop;</li>\r\n<li>Realizacji projektów przy użyciu JQuery/Adobe Animate;</li>\r\n<li>Animacje CSS ;</li>\r\n<li>Grafika wektorowa ( animacje/ikony) SVG ;</li>\r\n<li>Obróbki video wzbogaconej o wiele efektów wizualnych przy użyciu Adobe After Effect;</li>\r\n<li>Tworzenia obiektów trójwymiarowych;</li>\r\n<li>Kodowania wykonanej grafiki przy użyciu HTML i CSS.</li>\r\n<li>Praca w zespole - system GIT</li>\r\n</ul>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Wymagana jest znajomość języka HTML oraz podstawy kaskadowych arkuszy stylowych - CSS .</p>\r\n<p> </p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p><br /> <br /> <strong>Możliwe jest również otrzymanie dyplomu po przedstawieniu pracy dyplomowej</strong>, która będzie w pełni funkcjonalnym projektem internetowym zbudowanym z wykorzystaniem wiedzy nabytej podczas szkolenia otwierającym portfolio webdesignera.</p>\r\n<p> </p>\r\n<p>{koszt:webdes.xlsx}</p>\r\n<p>{zapis:webdes}</p>\r\n<p> </p>', NULL, NULL, 'tworzenie-stron-www/webdesigner', 5, '2019-03-01 13:36:30'),
(11, NULL, 'Webdeveloper PHP', 'webdeveloper-php', '<div id=\"contentContiner\" class=\"contentClass\">\r\n<div id=\"contentContinerLeftKurs\" class=\"contentClass\">\r\n<div class=\"item-page\">\r\n<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<span id=\"result_box\" class=\"\" lang=\"pl\"><span class=\"hps\">Web developer</span> PHP to zawód z grupy zawodów związanych z programowaniem komputerowym. Osoba wykonująca ten zawód <span class=\"hps\">jest</span> <span class=\"hps\">programistą, który</span> <span class=\"hps\">specjalizuje się w rozwijaniu</span> <span class=\"hps\">aplikacji</span> <span class=\"hps\">WWW lub</span> <span class=\"hps\">rozproszonych aplikacji</span> <span class=\"hps\">sieciowych </span>od strony serwera<span class=\"hps\"> w oparciu o język PHP.</span></span><br />\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Przygotowanie do samodzielnej konstrukcji witryn internetowych poprzez nabycie następujących umiejętności:</p>\r\n<ul>\r\n<li>Projektowania i administracji relacyjnymi bazami danych;</li>\r\n<li>Tworzenia specyfikacji i realizacja projektów w oparciu o PHP;</li>\r\n<li>Pracy zespołowej z projektantami graficznymi w oparciu o szablony Smarty;</li>\r\n<li>Zabezpieczania aplikacji internetowych przed potencjalnymi atakami z zewnątrz.</li>\r\n</ul>\r\n<p>  </p>\r\n', '\r\n<h2> </h2>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<br />\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Wymagana jest znajomość języka HTML oraz podstawy kaskadowych arkuszy stylowych - CSS - lub ukończenie kursu WebStart.</p>\r\n<p> </p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p> </p>\r\n<p>{koszt:wdphp.xlsx} </p>\r\n<p> {zapis:wdphp} </p>\r\n</div>\r\n</div>\r\n</div>', NULL, NULL, 'tworzenie-stron-www/webdeveloper-php', NULL, '2019-03-01 12:56:34'),
(12, NULL, 'CMS Joomla ', 'cms-joomla', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Szkolenie CMS Joomla stanowi moduł kursu Szkoła 3W - Webmaster, traktowane jest jednak także jako samodzielna jednostka szkoleniowa. Wiedza, jaką wyniosą uczestnicy szkolenia po jego ukończeniu umożliwia realizację nawet najbardziej zaawansowanych projektów.</p>\r\n<p style=\"text-align: justify;\"> Umiejętność instalacji i konfiguracji gotowego systemu do administracji treścią ( CMS ) wraz z  dodatkowymi modułami takimi jak: galerie foto, video, audio, newsletter, moduł wyszukiwarki czy system rejestracji oraz wdrożenie własnej szaty graficznej otwiera przed Słuchaczami olbrzymie możliwości już na początku ich przygody z projektowaniem stron internetowych.</p>\r\n<p style=\"text-align: justify;\"> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest zapoznanie uczestnika  z istotą i sposobami administracji systemem zarządzania treścią (CMS).</p>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Sprawne posługiwanie się myszą i klawiaturą, umiejętność tworzenia folderów <br />i plików, znajomość języka HTML.</p>\r\n<p> </p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p>{koszt:cmsj.xlsx}</p>\r\n<p><span style=\"font-size: 12pt;\"><strong><a title=\"Terminy\" href=\"terminy\" target=\"_blank\" rel=\"noopener noreferrer\">TERMINY</a></strong></span></p>\r\n<p>{zapis:cmsj} </p>', NULL, NULL, 'tworzenie-stron-www/cms-joomla', NULL, '2019-03-01 12:56:34'),
(13, NULL, 'CSS / SASS zaawawansowany', 'css-zaawawansowany', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Kurs CSS pozwoli opanować fundament współczesnego projektowania stron czyli arkusze stylowe. Arkusze CSS umożliwiają oddzielenie warstwy prezentacyjnej od treści, dzięki czemu swobodnie możemy nadawać naszym dokumentom kształty, kolory, tła, wymiary.</p>\r\n<p>Dzięki arkuszom stylowym przeniesiemy nawet najbardziej skomplikowany projekt graficzny na interaktywną stronę www.</p>\r\n<p>Podczas zajęć z zaawansowanych arkuszy stylowych wspólnie z wykładowcą – praktykiem „zakodują” Państwo projekt graficzny przenosząc statyczną grafikę w pełni interaktywny serwis internetowy.</p>\r\n<p>Krok po kroku omawiając zaawansowane techniki kodowania szablonów nabędą Państwo umiejętności fundamentalne przy realizacji projektów stron internetowych.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<ul>\r\n<li>znajomość zaawansowanych arkuszy stylowych ( CSS/SASS )</li>\r\n<li>umiejętność kodowania szablonów html 5/css 3</li>\r\n<li>umiejętność animacji CSS/SVG</li>\r\n<li>umiejętność pisania kodu zgodnego ze specyfikacją W3C</li>\r\n<li>umiejętność optymalizacji kodu pod kątem przeglądarek ( IE, Firefox, Opera, Google Chrome, inne )</li>\r\n</ul>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Znajomość podstaw html i css</p>\r\n<p>Kto powinien uczestniczyć?</p>\r\n<p>Kurs skierowany jest do osób, które posiadają podstawowe umiejętności z zakresu tworzenia serwisów w html wraz z arkuszami CSS i chcą podnieść swoje umiejętności na wyższy poziom tworząc zgodne ze standardami oraz poprawnie wyświetlające się na wszystkich przeglądarkach szablony.</p>\r\n<p> </p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p> </p>\r\n<p>{koszt:csszaaw.xlsx}</p>\r\n<p>{zapis:csszaaw} </p>\r\n<p> </p>', NULL, NULL, 'tworzenie-stron-www/css-zaawawansowany', NULL, '2019-03-01 12:56:34'),
(14, NULL, 'HTML dla e-mailingu', 'html-dla-e-mailingu', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Umiejętność posługiwania się językiem HTML umożliwia poznanie wielu innych narzędzi do tworzenia stron internetowych, w tym do tworzenia listów cyfrowych przesyłanych za pomocą internetowych programów pocztowych. <br />Nasi trenerzy wprowadzą Cię w tajniki kodu HTML-owego, wskażą najczęściej popełniane błędy. Nauczą, jak za pomocą klawiatury, notatnika i niewielkiej ilości tzw. „znaczników” wywoływać odpowiednie efekty na ekranie monitora twojego komputera, a dzięki sieci www – na wszystkich komputerach…</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest przygotowanie słuchacza do samodzielnej budowy jednostronicowych prostych lecz w pełni funkcjonalnych \"witryn internetowych\" - jako  listów cyfrowych zawierających ilustracje i inne formy graficzne - przy pomocy języka HTML5.</p>\r\n', '\r\n<p> </p>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Sprawne posługiwanie się myszą i klawiaturą, umiejętność tworzenia folderów i plików. Dobra znajomość pakietu Office będzie sprzyjała nauce.</p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p><span style=\"font-size: 12pt;\"><strong><a title=\"Terminy\" href=\"terminy\" target=\"_blank\" rel=\"alternate\">TERMINY</a></strong></span></p>\r\n<p>{koszt:html_css.xlsx}</p>\r\n<p>{zapis:htmlcss}</p>', NULL, NULL, 'tworzenie-stron-www/html-dla-e-mailingu', NULL, '2019-03-01 12:56:34'),
(15, NULL, 'JQuery', 'jquery', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>JQuery jest darmową biblioteką napisaną w języku JavaScript. Ma ona wspomóc deweloperów jak też ludzi którzy nigdy nie programowali w wykorzystaniu możliwości języka J.S. do obsługi typowych zadań webmasterskich. Należą do nich ukrywanie i pokazywanie elementów tzw. efekty. Manipulacja drzewem znaczników ( Document Object Model ). Dynamiczna zmiana reguł CSS. Ważną częścią JQuery jest technologia Ajax na kursie można będzie można zapoznać się z zaimplementowanymi w bibliotece możliwościami tej technologii.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cele i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest przyswojenie najważniejszych elementów biblioteki JQuery. Tak by możliwe było maksymalne wykorzystanie możliwości Java Scriptu i technologii Ajax, bez długiego i żmudnego procesu poznawania języka i nauki programowania. </p>\r\n<p> </p>\r\n', '\r\n<p> </p>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Znajomość HTML i CSS na poziomie podstawowym.</p>\r\n<p> </p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p> </p>\r\n<p>{koszt:jquery.xlsx}</p>\r\n<p>{zapis:jquery} </p>', NULL, NULL, 'tworzenie-stron-www/jquery', NULL, '2019-03-01 12:56:34'),
(16, NULL, 'Java Script', 'java-script', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Java Script to forma języka programowania dla potrzeb Internetu. Znajomość JSc jest niezbędna każdej osobie, która chce się zajmować twórczością na rzecz Internetu a zwłaszcza interaktywnych stron www.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest zapoznanie uczestników z podstawami języka Java Script, umożliwiającymi tworzenie skryptów i ich przystosowywanie do potrzeb konkretnych witryn internetowych.</p>\r\n<p>  </p>\r\n', '\r\n<p> </p>\r\n<h2 class=\"typszkolenia\">Typy i rodzaje szkoleń</h2>\r\n<p style=\"text-align: center;\">A: grupowe, binarne, indywidualne;<br /> B: stacjonarne, wyjazdowe, online;<br /> C: ogólnodostępne, zamknięte;<br /> D: standardowe, szyte na miarę.</p>\r\n<h2 class=\"wymaganiaszkolenie\">Wymagania</h2>\r\n<p>Kandydat powinien znać HTML i CSS i posiadać ogólną orientacje o strukturze strony www.</p>\r\n<p> </p>\r\n<h2 class=\"cerftyfikatyszkolenie\">Certyfikaty</h2>\r\n<p>Uczestnicy naszych szkoleń otrzymują zaświadczenie ukończenia kursu <strong>wg wzoru Ministerstwa Edukacji Narodowej (CERTYFIKAT AKADEMII WWW)</strong>.</p>\r\n<p> </p>\r\n<p>{koszt:jscript.xlsx}</p>\r\n<p>{zapis:jscript} </p>', NULL, NULL, 'tworzenie-stron-www/java-script', NULL, '2019-03-01 12:56:34'),
(17, NULL, 'Kompleksowy Kurs DTP', 'kompleksowy-kurs-dtp', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Przygotowanie materiałów dla współczesnej poligrafii wymaga dobrej znajomości zasad projektowania graficznego, a z technicznego punktu widzenia, jak najlepszej znajomości obsługi programów do projektowania i obróbki grafiki rastrowej i wektorowej oraz programu do projektowania, łamania, składania i przygotowywania do druku materiałów poligraficznych. Oparty na pakiecie Adobe kurs daje niezbędna i kompleksową wiedzę w tym zakresie.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest przekazanie kursantowi kompleksowej wiedzy na temat DTP (grafiki komputerowej na potrzeby poligrafii i grafiki użytkowej) . Uczestnik pozna dogłębnie zagadnienia związane zarówno z tworzeniem jak i obróbką grafiki rastrowej, grafiki wektorowej oraz profesjonalnego składu i łamania tekstu niezbędne do profesjonalnego przygotowania bannerów reklamowych, książek, gazet, ulotek oraz wielu innych rzeczy.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'grafika/kompleksowy-kurs-dtp', NULL, '2019-03-01 12:56:34'),
(18, NULL, 'Adobe Photoshop DTP', 'adobe-photoshop-dtp', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Adobe Photoshop to jeden z najpopularniejszych w Polsce profesjonalnych programów do tworzenia i obróbki grafiki rastrowej.Szkolenie w tym zakresie dedykujemy tym, którzy chcieliby wykorzystać swoje umiejętności w pracy zawodowej i na użytek osobisty. Kurs ten otwiera możliwości pracy związanej z projektowaniem i obróbką grafiki na potrzeby poligrafii, Internetu oraz współczesnej fotografii.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest zapoznanie uczestnika z podstawowymi oraz zaawansowanymi funkcjami programu Adobe Photoshop. Po jego ukończeniu kursant potrafi profesjonalnie pracować na obrazach grafiki rastrowej na potrzeby DTP.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'grafika/adobe-photoshop-dtp', NULL, '2019-03-01 12:56:34'),
(19, NULL, 'Adobe Illustrator', 'adobe-illustrator-dtp', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Adobe Illustrator to jeden z najpopularniejszych w Polsce profesjonalnych programów do tworzenia i obróbki grafiki wektorowej.Szkolenie w tym zakresie dedykujemy tym, którzy chcieliby wykorzystać swoje umiejętności w pracy zawodowej związanej przede wszystkim z projektowaniem i obróbką grafiki na potrzeby poligrafii.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cele i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest zapoznanie uczestników z podstawowymi oraz zaawansowanymi funkcjami programu Adobe Illustrator. Po ukończeniu szkolenia kursant potrafi profesjonalnie pracować na obrazach grafiki wektorowej na potrzeby DTP.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'grafika/adobe-illustrator-dtp', NULL, '2019-03-01 12:56:34'),
(20, NULL, 'Adobe InDesign', 'adobe-indesign', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Adobe InDesign to jeden z najpopularniejszych w Polsce profesjonalnych programów do projektowania, łamania, składania i przygotowywania do druku materiałów poligraficznych. Szkolenie w tym zakresie dedykujemy tym, którzy chcieliby wykorzystać swoje umiejętności w pracy zawodowej związanej z poligrafią, oraz osobom odpowiedzialnym za zamówienia w drukarniach i na co dzień współpracujących z nimi .</p>\r\n<p> </p>\r\n<h2 class=\"opisszkolenia\">Cele szkolenia</h2>\r\n<p>Celem szkolenia jest zapoznanie uczestnika z podstawowymi oraz zaawansowanymi funkcjami programu Adobe InDesign. Po jego ukończeniu kursant potrafi profesjonalnie składać grafikę i tekst na potrzeby DTP.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'grafika/adobe-indesign', NULL, '2019-03-01 12:56:34'),
(21, NULL, 'Adobe Animate CC', 'adobe-animate-cc', '<p> <img style=\"width: 100%;\" src=\"images/animate.png\" alt=\"\" /></p>\r\n<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Kurs jest adresowany zarówno do webdesignerów jak i do ludzi zupełnie debiutujących w branży IT. Adobe Animate CC umożliwia tworzenie animowanych filmów, które bez problemu wyświetlać się będą na każdym rodzaju urządzenia mobilnego ( smartfon , tablet ) i niezależnie od rodzaju platformy. Wielką zaletą tego programu jest generowanie plików zgodnych ze standardami HTML5 ( Canvas HTML5 / JavaScript ), dzięki czemu filmy odtwarzane są zarówno na platformie Android, iOS i WindowPhonie. Przy pomocy Animate CC można także tworzyć i montować filmy animowane na klasyczne obszary eksploatacji.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Przygotowanie kilku banerów reklamowych oraz zaawansowanych filmów z użyciem technologi dostępnych w programie Adobe AnimateCC.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'grafika/adobe-animate-cc', NULL, '2019-03-01 12:56:34'),
(22, 1, 'Gimp', 'gimp', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>GIMP to darmowy program do tworzenia i obróbki grafiki rastrowej. Jest bezpłatnym lecz o wiele uboższym \"odpowiednikiem\" PHOTOSHOPA. GIMP pozwala projektować i obrabiać na przyzwoitym poziomie zdjęcia i inne materiały graficzne</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest zapoznanie uczestnika z podstawowymi oraz zaawansowanymi funkcjami programu GIMP. Po jego ukończeniu absolwent będzie potrafił pracować na obrazach grafiki rastrowej.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'grafika/gimp', 3, '2019-03-01 13:36:30'),
(23, 3, 'ECDL Base', 'ecdl-base', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Laboratorium komputerowe ECDL Akademii WWW umożliwia przygotowanie się do zdawania egzaminów w celu zdobycia certyfikatu <strong>ECDL Base</strong>. Ucząc się w naszym laboratorium i zdając egzaminy , otrzymacie uznawane międzynarodowo potwierdzenie własnych kompetencji komputerowych . Dzięki nauce w Akademii WWW każdy z uczestników kursu <strong>ECDL Base</strong> posiądzie głęboką wiedzę i umiejętności praktyczne niezbędne w pracy z komputerem osobistym i podstawowymi aplikacjami komputerowymi.<br /> Każdy z kursów prowadzony jest w oparciu o oryginalny program nauczania, którego podstawą jest sylabus ECDL. Zajęcia prowadzą certyfikowani trenerzy posiadający uprawnienia egzaminatorów ECDL (uwaga: prowadzący zajęcia nie może równocześnie prowadzić egzaminu). Integralnym elementem kursu jest analiza i rozwiązywanie testów próbnych do każdego modułu.<strong> <br /></strong></p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest nabycie przez uczestnika praktycznych umiejętności w obsłudze komputera i wykorzystywania podstawowych aplikacji oraz przygotowanie go do zdania czterech egzaminów pozwalających uzyskać certyfikat ECDL Base pomocny w utrzymaniu pracy, jej zdobyciu a także niezbędny przed wyjazdem za granice w celu poszukiwania pracy.</p>\r\n<p><strong>UWAGA!<br /></strong>Zgodnie z Załącznikiem nr 8 do „<a href=\"https://www.mr.gov.pl/strony/zadania/fundusze-europejskie/wytyczne/wytyczne-na-lata-2014-2020/wytyczne-w-zakresie-monitorowania-postepu-rzeczowego-realizacji-programow-operacyjnych-na-lata-2014-2020/\" target=\"_blank\" rel=\"noopener noreferrer\">Wytycznych w zakresie monitorowania postępu rzeczowego realizacji programów operacyjnych na lata 2014-2020”</a> z 17 maja 2017 pt. <a href=\"http://ecdl.pl/wp-content/uploads/2017/09/Zalacznik_8_Material_o_kwalifikacjach_z_lista.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">„Podstawowe informacje dotyczące uzyskiwania kwalifikacji w ramach projektów współfinansowanych z Europejskiego Funduszu Społecznego</a>”, autorstwa Ministerstwa Rozwoju,<strong> certyfikat ECDL jest kwalifikacją </strong>a Polskie Towarzystwo Informatyczne – instytucją certyfikującą dla tej kwalifikacji.<strong><br /></strong></p>\r\n', '', NULL, NULL, 'ms-office/ecdl-base', NULL, '2019-02-05 16:37:37'),
(24, 3, 'ECDL Advanced', 'ecdl-advanced', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<h2>Szkolenie <strong>ECDL-Advanced</strong> składa się z czterech niezależnych od siebie części:</h2>\r\n<ul>\r\n<li>Zaawansowane Przetwarzanie Tekstu</li>\r\n<li>Zaawansowane Arkusze Kalkulacyjne</li>\r\n<li>Zaawansowane Bazy Danych</li>\r\n<li>Zaawansowane Grafika Menadżerska i Prezentacyjna</li>\r\n</ul>\r\n<p> Do nauki można przystąpić niezależnie od posiadania lub nieposiadania innych certyfikatów ECDL na poziomie podstawowym. Można dokonać dowolnego wyboru spośród czterech części składowych ECDL-A bowiem egzaminy mogą być przeprowadzane oddzielnie z każdego modułu. Certyfikaty wydawane są też oddzielnie. Istnieje możliwość zdania wszystkich czterech modułów i uzyskania tym samym Certyfikatu i Karty Eksperta (ze zdjęciem) pakietu Office (jeśli wszystkie moduły zostaną zaliczone w formie egzaminu w przeciągu 3 lat).</p>\r\n<p>Nasze szkolenia prowadzimy w środowisku Windows <strong>7</strong> lub Windows <strong>8</strong> lub <strong>10</strong> a ich podstawą są zasadnicze elementy oprogramowania biurowego MS Office: <strong>Word, Excel, Access i PowerPoint</strong> w wersji 2013 lub wyższych , na życzenie nauka może odbywać się przy wykorzystaniu MS Office 2010. Także na życzenie (instytucji lub firm) szkolenie  możemy przeprowadzić korzystając z OpenOffice i jego aplikacji: Writer, Calc, Base i Impress<br />Szkolenie jest skierowane do wszystkich tych osób, które potrzebują wykazać się umiejętnością sprawnego posługiwania się pakietem programów biurowych na poziomie zaawansowanym. Uczymy wykorzystywania zaawansowanych funkcji poszczególnych aplikacji pakietów biurowych. Funkcje te poszerzają warsztat pracy, ułatwiają ją, a przede wszystkim pozwalają zautomatyzować wiele żmudnych czynności.<br />Uzyskanie Certyfikatu <strong>ECDL –Advanced</strong> może automatycznie pomóc otworzyć ścieżkę kariery zawodowej osobom, których praca jest lub będzie związana z obsługą komputera na wyższym poziomie. ECDL-A jest przeznaczony dla osób, które chcą się rozwijać i pragną być profesjonalistami w tym co robią. W dobie ogólnej komputeryzacji, ECDL-A jest dla każdego kto chce coś znaczyć na rynku pracy.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest nabycie przez uczestnika praktycznych możliwie najwyższych umiejętności w obsłudze komputera i wykorzystywania podstawowych aplikacji oraz przygotowanie go do zdania czterech egzaminów pozwalających uzyskać certyfikat <strong>ECDL Advanced</strong> pomocny w utrzymaniu pracy, jej zdobyciu a także niezbędny przed wyjazdem za granicę w celu poszukiwania pracy.</p>\r\n<p><strong>UWAGA!<br /></strong>Zgodnie z Załącznikiem nr 8 do „<a href=\"https://www.mr.gov.pl/strony/zadania/fundusze-europejskie/wytyczne/wytyczne-na-lata-2014-2020/wytyczne-w-zakresie-monitorowania-postepu-rzeczowego-realizacji-programow-operacyjnych-na-lata-2014-2020/\" target=\"_blank\" rel=\"noopener noreferrer\">Wytycznych w zakresie monitorowania postępu rzeczowego realizacji programów operacyjnych na lata 2014-2020”</a> z 17 maja 2017 pt. <a href=\"http://ecdl.pl/wp-content/uploads/2017/09/Zalacznik_8_Material_o_kwalifikacjach_z_lista.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">„Podstawowe informacje dotyczące uzyskiwania kwalifikacji w ramach projektów współfinansowanych z Europejskiego Funduszu Społecznego</a>”, autorstwa Ministerstwa Rozwoju,<strong> certyfikat ECDL jest kwalifikacją </strong>a Polskie Towarzystwo Informatyczne – instytucją certyfikującą dla tej kwalifikacji.<strong><br /></strong></p>\r\n', '', NULL, NULL, 'ms-office/ecdl-advanced', NULL, '2019-02-05 16:37:43'),
(25, 3, 'ECDL Standard', 'ecdl-standard', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<h2><strong>ECDL-Standard</strong></h2>\r\n<p>Laboratorium komputerowe ECDL Akademii WWW umożliwia przygotowanie się do zdawania egzaminów w celu zdobycia certyfikatu ECDL Standard. Ucząc się w naszym laboratorium i zdając egzaminy , otrzymacie uznawane międzynarodowo potwierdzenie własnych kompetencji komputerowych. Dzięki nauce w Akademii WWW każdy z uczestników kursu ECDL Standard posiądzie głęboką wiedzę i umiejętności praktyczne niezbędne w pracy z komputerem osobistym i podstawowymi aplikacjami komputerowymi.<br /> Każdy z kursów prowadzony jest w oparciu o oryginalny program nauczania, którego podstawą jest sylabus ECDL. Zajęcia prowadzą certyfikowani trenerzy posiadający uprawnienia egzaminatorów ECDL (uwaga: prowadzący zajęcia nie może równocześnie prowadzić egzaminu). Integralnym elementem kursu jest analiza i rozwiązywanie testów próbnych do każdego modułu. ECDL Standard zastępuje ”stary” ECDL Core<br /><br />Certyfikat ECDL Standard uzyskać można na 2 sposoby<br />1.    „Na raty”: przechodząc szkolenie ECDL Base i zdając jego 4 egzaminy a następnie wybierając 3 moduły  z zakresu Standard<br />2.    Przystępując do  siedmiomodułowego szkolenia  i zdając siedem egzaminów wg preferowanej przez Akademię WWW listy.</p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest nabycie przez uczestnika praktycznych umiejętności w obsłudze komputera i wykorzystywania podstawowych aplikacji oraz przygotowanie go do zdania siedmiu egzaminów pozwalających uzyskać certyfikat ECDL Standard pomocny w utrzymaniu pracy, jej zdobyciu a także niezbędny przed wyjazdem za granicę w celu poszukiwania pracy.<br /><br /><strong>UWAGA !<br /></strong>Zgodnie z Załącznikiem nr 8 do „<a href=\"https://www.mr.gov.pl/strony/zadania/fundusze-europejskie/wytyczne/wytyczne-na-lata-2014-2020/wytyczne-w-zakresie-monitorowania-postepu-rzeczowego-realizacji-programow-operacyjnych-na-lata-2014-2020/\" target=\"_blank\" rel=\"noopener noreferrer\">Wytycznych w zakresie monitorowania postępu rzeczowego realizacji programów operacyjnych na lata 2014-2020”</a> z 17 maja 2017 pt. <a href=\"http://ecdl.pl/wp-content/uploads/2017/09/Zalacznik_8_Material_o_kwalifikacjach_z_lista.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">„Podstawowe informacje dotyczące uzyskiwania kwalifikacji w ramach projektów współfinansowanych z Europejskiego Funduszu Społecznego</a>”, autorstwa Ministerstwa Rozwoju, certyfikat <strong>ECDL jest kwalifikacją</strong> a Polskie Towarzystwo Informatyczne – instytucją certyfikującą dla tej kwalifikacji.</p>\r\n', '', NULL, NULL, 'ms-office/ecdl-standard', NULL, '2019-02-05 16:37:50'),
(26, 3, 'Word I', 'word-i', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>MS Word to najpopularniejszy w Polsce komputerowy edytor tekstu. Szkolenie to dedykujemy tym, którzy nie mieli dotąd możliwości korzystania z niego i wszystkim „fałszywym początkującym” – znającym tylko określone funkcje tej aplikacji. Dzięki  szkoleniu będą mogli wykorzystywać wspaniałe możliwości MS Word zarówno w pracy jak i na użytek domowo-towarzyski.</p>\r\n<h2 class=\"opisszkolenia\">Cel szkolenia</h2>\r\n<p>Celem szkolenia jest zapoznanie uczestników z podstawami funkcjonowania programu MS Word, wprowadzania i formatowania tekstu, wstawiania obiektów jak tabele i rysunki oraz tworzenia wydruków.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'ms-office/word-i', NULL, '2019-02-05 16:37:57'),
(27, 3, 'Word II', 'word-ii', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Szkolenie Word II, dedykujemy osobom, którym dotychczasowy zakres znajomości narzędzi tej aplikacji uniemożliwia optymalne wykorzystanie komputera w pracy zawodowej. Szkolenie to przeznaczone jest dla tych wszystkich, którzy maja już duże doświadczenie w pracy z Wordem lub przeszli szkolenie na poziomie podstawowym. Uczymy wykorzystania zaawansowanych narzędzi MS Word.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Szkolenie zapoznaje uczestników z zaawansowanymi funkcjami programu Word jak np. zaawansowane metody formatowania tekstu, korespondencja seryjna, sekcje, makropolecenia.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'ms-office/word-ii', NULL, '2019-02-05 16:38:05'),
(28, 3, 'Power Point', 'power-point', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>MS PowerPoint to najpopularniejsza w Polsce komputerowa aplikacja grafiki przeznaczonej do prezentacji menedżerskich. Szkolenie to dedykujemy tym, którzy ze względu na charakter swojej pracy występują publicznie i muszą swoje wystąpienia wspierać efektowną wizualizacją danych. Narzędzia PP można wykorzystać także do celów domowych lub towarzyskich tworząc „slade show” i „filmy” do przesyłania przez pocztę internetową lub do publikacji w mediach społecznościowych.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Szkolenie ma na celu zapoznanie uczestników z programem PowerPoint, jego podstawowymi jak i bardziej złożonymi funkcjami. Po zakończeniu szkolenia uczestnik potrafi stworzyć efektowną prezentację zarówno na podstawie szablonów, jak i własnych grafik i animacji.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'ms-office/power-point', NULL, '2019-02-05 16:38:19'),
(29, 3, 'Excel I', 'excel-i', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>MS Excel to najpopularniejszy w Polsce arkusz kalkulacyjny. Szkolenie to dedykujemy tym, którzy nie mieli dotąd możliwości korzystania z niego i wszystkim „fałszywym początkującym” – znającym tylko określone funkcje tej aplikacji. Dzięki  szkoleniu będą mogli wykorzystywać wspaniałe możliwości MS Excel zarówno w pracy jak i na użytek domowy.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Szkolenie zapoznaje uczestników z podstawami funkcjonowania programu Excel. Po jego ukończeniu uczestnik potrafi robić proste obliczenia, wprowadzać podstawowe formuły, formatować dane, a także tworzyć diagramy i wykresy.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'ms-office/excel-i', NULL, '2019-02-05 16:38:27'),
(30, 3, 'Excel II', 'excel-ii', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Szkolenie Excel II, dedykujemy osobom, którym dotychczasowy zakres znajomości narzędzi tej aplikacji uniemożliwia optymalne wykorzystanie komputera w pracy zawodowej. Szkolenie to przeznaczone jest dla tych wszystkich, którzy maja już duże doświadczenie w pracy z Excelem lub przeszli szkolenie na poziomie podstawowym. Uczymy wykorzystania zaawansowanych narzędzi MS Excel.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest nauka optymalnego wykorzystania zaawansowanych narzędzi MS Excel a efektem powinno być ich zastosowanie w codziennej pracy osób zajmujących się księgowością, ekonomią, finansami czy statystyką.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'ms-office/excel-ii', NULL, '2019-02-05 16:38:36'),
(31, 3, 'Access I', 'access-i', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Szkolenie MS Access I dedykujemy tym, którzy nie mieli dotąd możliwości korzystania z niego i wszystkim „fałszywym początkującym” – znającym tylko określone funkcje tej aplikacji. Dzięki  szkoleniu będą mogli wykorzystywać wspaniałe możliwości MS Access zarówno w pracy jak i na użytek domowy.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Po odbyciu szkolenia uczestnicy znają podstawowe pojęcia związane z bazami danych oraz potrafią obsługiwać program Access w stopniu podstawowym.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'ms-office/access-i', NULL, '2019-02-05 16:38:43');
INSERT INTO `course` (`id`, `school_id`, `name`, `alias`, `description`, `summary_description`, `program_json`, `price_json`, `self_link`, `ordering`, `updated_at`) VALUES
(32, 3, 'Access II', 'access-ii', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Szkolenie Access II, dedykujemy osobom, którym dotychczasowy zakres znajomości narzędzi tej aplikacji uniemożliwia optymalne wykorzystanie komputera w pracy zawodowej. Szkolenie to przeznaczone jest dla tych wszystkich, którzy maja już duże doświadczenie w pracy z Accessem lub przeszli szkolenie na poziomie podstawowym. Uczymy wykorzystania zaawansowanych narzędzi MS Access.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Szkolenie zapoznaje uczestników z zaawansowanymi funkcjami programu Access.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'ms-office/access-ii', NULL, '2019-02-05 16:38:49'),
(33, 4, 'Java Script', 'java-script', '<h2 class=\"opisszkolenia\">Opis szkolenia</h2>\r\n<p>Java Script to forma języka programowania dla potrzeb Internetu. Znajomość JSc jest niezbędna każdej osobie, która chce się zajmować twórczością na rzecz Internetu a zwłaszcza interaktywnych stron www.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest zapoznanie uczestników z podstawami języka Java Script, umożliwiającymi tworzenie skryptów i ich przystosowywanie do potrzeb konkretnych witryn internetowych.</p>\r\n<p>  </p>\r\n', '', NULL, NULL, 'programowanie/javascript', NULL, '2019-02-05 16:44:10'),
(34, 4, 'Java ', 'java-i', '<h2 class=\"opisszkolenia\">Opis Szkolenia</h2>\r\n<p>Java to najpopularniejszy dziś, szeroko stosowany obiektowy język programowania. Kurs przeznaczony jest dla wszystkich chętnych, którzy mają choćby minimalne doświadczenie w programowaniu w innych językach.</p>\r\n<p> </p>\r\n<h2 class=\"celszkolenia\">Cel i efekt szkolenia</h2>\r\n<p>Celem szkolenia jest zapoznanie uczestników z podstawami języka Java i twórczego wykorzystania programowania w tym języku.</p>\r\n<p> </p>\r\n', '', NULL, NULL, 'programowanie/java-i', NULL, '2019-02-05 16:44:16');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gallery`
--

CREATE TABLE `gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gallery_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `learn_time`
--

CREATE TABLE `learn_time` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `link`
--

CREATE TABLE `link` (
  `id` int(10) UNSIGNED NOT NULL,
  `link_id` int(10) UNSIGNED DEFAULT NULL,
  `content_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `school_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `data_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `external_link` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `view` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linked_menu` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `custom_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_desc` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `ordering` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `link`
--

INSERT INTO `link` (`id`, `link_id`, `content_id`, `course_id`, `category_id`, `school_id`, `title`, `alias`, `path`, `data_type`, `external_link`, `status`, `view`, `linked_menu`, `params`, `custom_title`, `meta_desc`, `meta_keywords`, `ordering`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 'Tworzenie stron WWW', 'tworzenie-stron-www', 'tworzenie-stron-www', 'school', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 3, '2019-02-27 12:55:37'),
(2, 1, NULL, 4, NULL, NULL, 'Junior Web Developer - projektowanie i budowa stron internetowych', 'junior-web-developer-projektowanie-i-budowa-stron-internetowych', 'tworzenie-stron-www/junior-web-developer-projektowanie-i-budowa-stron-internetowych', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 3, '2019-02-12 11:21:57'),
(3, 1, NULL, NULL, NULL, NULL, 'Webmaster A - podstawowy', 'webmaster-a-podstawowy', 'tworzenie-stron-www/webmaster-a-podstawowy', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 15, '2019-02-12 11:21:57'),
(4, 1, NULL, NULL, NULL, NULL, 'Junior Frontend Developer', 'junior-front-end-developer', 'tworzenie-stron-www/junior-front-end-developer', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 1, '2019-02-12 11:21:57'),
(5, 1, NULL, 10, NULL, NULL, 'Webdesign - projektowanie graficzne dla WWW', 'webdesigner', 'tworzenie-stron-www/webdesigner', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 7, '2019-02-12 11:21:57'),
(6, 1, NULL, 8, NULL, NULL, 'HTML 5 / CSS 3 / SASS', 'html-5-css-3', 'tworzenie-stron-www/html-5-css-3', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 6, '2019-02-12 11:21:57'),
(7, 1, NULL, 13, NULL, NULL, 'CSS zaawawansowany', 'css-zaawawansowany', 'tworzenie-stron-www/css-zaawawansowany', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 4, '2019-02-12 11:21:57'),
(8, 1, NULL, NULL, NULL, NULL, 'PHP / Mysql', 'php-mysql', 'tworzenie-stron-www/php-mysql', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 8, '2019-02-12 11:21:57'),
(9, 1, NULL, 11, NULL, NULL, 'Webdeveloper PHP', 'webdeveloper-php', 'tworzenie-stron-www/webdeveloper-php', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, '2019-02-12 11:21:57'),
(10, 1, NULL, 14, NULL, NULL, 'HTML dla e-mailingu', 'html-dla-e-mailingu', 'tworzenie-stron-www/html-dla-e-mailingu', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 10, '2019-02-12 11:21:57'),
(11, 1, NULL, NULL, NULL, NULL, 'FlashDeveloper', 'flashdeveloper', 'tworzenie-stron-www/flashdeveloper', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 11, '2019-02-12 11:21:57'),
(12, 1, NULL, 15, NULL, NULL, 'JQuery', 'jquery', 'tworzenie-stron-www/jquery', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 12, '2019-02-12 11:21:57'),
(13, 1, NULL, 16, NULL, NULL, 'Java Script', 'java-script', 'tworzenie-stron-www/java-script', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 14, '2019-02-12 11:21:57'),
(14, 1, NULL, NULL, NULL, NULL, 'WebDeveloper JS', 'webdeveloper-js', 'tworzenie-stron-www/webdeveloper-js', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 13, '2019-02-12 11:21:57'),
(15, 1, NULL, 12, NULL, NULL, 'CMS Joomla', 'cms-joomla', 'tworzenie-stron-www/cms-joomla', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 5, '2019-02-12 11:21:57'),
(16, 1, NULL, NULL, NULL, NULL, 'JoomlaDeveloper', 'joomladeveloper', 'tworzenie-stron-www/joomladeveloper', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 16, '2019-02-13 12:22:07'),
(17, 1, NULL, 9, NULL, NULL, 'CMS Wordpress', 'cms-wordpress', 'tworzenie-stron-www/cms-wordpress', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 17, '2019-02-12 11:21:57'),
(18, 1, NULL, NULL, NULL, NULL, 'Emarketing', 'emarketing', 'tworzenie-stron-www/emarketing', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 18, '2019-02-12 11:21:57'),
(19, 1, NULL, NULL, NULL, NULL, 'Pozycjonowanie Stron WWW', 'pozycjonowanie-stron-www', 'tworzenie-stron-www/pozycjonowanie-stron-www', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 19, '2019-02-12 11:21:57'),
(20, 1, NULL, NULL, NULL, NULL, 'Google Analitics', 'google-analitics', 'tworzenie-stron-www/google-analitics', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 20, '2019-02-12 11:21:57'),
(21, 1, NULL, NULL, NULL, NULL, 'AdWords', 'adwords', 'tworzenie-stron-www/adwords', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 21, '2019-02-13 12:22:11'),
(22, 1, NULL, 5, NULL, NULL, 'Front End Developer', 'front-end-developer', 'tworzenie-stron-www/frontenddeveloper', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 22, '2019-02-13 13:24:57'),
(23, 1, NULL, NULL, NULL, NULL, 'Projektowanie WWW - Adobe Photoshop', 'projektowanie-www-adobe-photoshop', 'tworzenie-stron-www/projektowanie-www', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 23, '2019-02-13 11:45:46'),
(24, 1, NULL, NULL, NULL, NULL, 'Programista - ANGULAR JS', 'programista-angular-js', 'tworzenie-stron-www/programista-angular-js', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 25, '2019-02-12 11:21:57'),
(25, 1, NULL, NULL, NULL, NULL, 'Reklama w Internecie2', 'reklama-w-internecie', 'tworzenie-stron-www/reklama-w-internecie', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 24, '2019-02-12 11:21:57'),
(26, 1, NULL, 6, NULL, NULL, 'Junior Backend Developer', 'junior-backend-developer', 'tworzenie-stron-www/junior-back-end-developer', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 26, '2019-02-13 11:44:13'),
(28, 1, NULL, 7, NULL, NULL, 'Junior Backend Javascript Developer', 'junior-backend-javascript-developer', 'tworzenie-stron-www/junior-backend-javascript-developer', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 27, '2019-02-12 11:21:57'),
(29, NULL, NULL, NULL, NULL, 2, 'Grafika komputerowa i video', 'grafika-komputerowa-i-video', 'grafika', 'school', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 2, '2019-02-27 13:56:57'),
(30, 29, NULL, 17, NULL, NULL, 'Kompleksowy Kurs DTP', 'kompleksowy-kurs-dtp', 'grafika/kompleksowy-kurs-dtp', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 1, '2019-02-28 00:33:22'),
(31, 29, NULL, 18, NULL, NULL, 'Adobe Photoshop DTP', 'adobe-photoshop-dtp', 'grafika/adobe-photoshop-dtp', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 7, '2019-02-17 23:02:35'),
(32, 29, NULL, 19, NULL, NULL, 'Adobe Illustrator', 'adobe-illustrator-dtp', 'grafika/adobe-illustrator-dtp', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 3, '2019-02-17 23:02:34'),
(33, 29, NULL, 20, NULL, NULL, 'Adobe InDesign', 'adobe-indesign', 'grafika/adobe-indesign', 'course', NULL, NULL, NULL, NULL, '', '', NULL, NULL, 4, '2019-02-17 23:02:35'),
(34, 29, NULL, NULL, NULL, NULL, 'Quark XPress', 'quark-xpress', 'grafika/quark-xpress', 'course', NULL, NULL, NULL, NULL, '', '', NULL, NULL, 5, '2019-02-17 23:02:35'),
(35, 29, NULL, NULL, NULL, NULL, 'Corel', 'corel', 'grafika/corel', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 6, '2019-02-17 23:02:35'),
(36, 29, NULL, NULL, NULL, NULL, 'Autodesk Maya', 'autodesk-maya', 'grafika/autodesk-maya', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 2, '2019-02-28 00:33:22'),
(37, 29, NULL, NULL, NULL, NULL, '3D Studio Max', '3d-studio-max', 'grafika/3d-studio-max', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 8, '2019-02-17 23:02:35'),
(38, 29, NULL, 22, NULL, NULL, 'Gimp', 'gimp', 'grafika/gimp', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, '2019-02-17 23:02:35'),
(39, 29, NULL, NULL, NULL, NULL, 'Adobe After Effects V', 'adobe-after-effects', 'grafika/adobe-after-effects', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 10, '2019-02-17 23:02:35'),
(40, 29, NULL, 21, NULL, NULL, 'Adobe Animate CC', 'adobe-animate-cc', 'grafika/adobe-animate-cc', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 12, '2019-02-17 23:02:35'),
(41, 29, NULL, NULL, NULL, NULL, 'Montaż wideo - Premiere (podstawy) V', 'm', 'grafika/m', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 11, '2019-02-17 23:02:35'),
(42, NULL, NULL, NULL, NULL, NULL, 'MS Office i ECDL', 'ms-office', 'ms-office', 'school', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 4, '2019-02-27 12:55:37'),
(43, 42, NULL, 23, NULL, NULL, 'ECDL Base', 'ecdl-base', 'ms-office/ecdl-base', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:37:37'),
(44, 42, NULL, 24, NULL, NULL, 'ECDL Advanced', 'ecdl-advanced', 'ms-office/ecdl-advanced', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:37:43'),
(45, 42, NULL, 26, NULL, NULL, 'Word I', 'word-i', 'ms-office/word-i', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:37:57'),
(46, 42, NULL, 27, NULL, NULL, 'Word II', 'word-ii', 'ms-office/word-ii', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:38:05'),
(47, 42, NULL, 28, NULL, NULL, 'Power Point', 'power-point', 'ms-office/power-point', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:38:19'),
(48, 42, NULL, 29, NULL, NULL, 'Excel I', 'excel-i', 'ms-office/excel-i', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:38:27'),
(49, 42, NULL, 30, NULL, NULL, 'Excel II', 'excel-ii', 'ms-office/excel-ii', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:38:36'),
(50, 42, NULL, 31, NULL, NULL, 'Access I', 'access-i', 'ms-office/access-i', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:38:43'),
(51, 42, NULL, 32, NULL, NULL, 'Access II', 'access-ii', 'ms-office/access-ii', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:38:49'),
(52, 42, NULL, 25, NULL, NULL, 'ECDL Standard', 'ecdl-standard', 'ms-office/ecdl-standard', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 16:37:50'),
(53, NULL, NULL, NULL, NULL, NULL, 'Programowanie', 'programowanie', 'programowanie', 'school', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 6, '2019-02-27 12:55:37'),
(54, 53, NULL, 34, NULL, NULL, 'Java', 'java-i', 'programowanie/java-i', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 1, '2019-02-10 14:47:14'),
(55, 53, NULL, NULL, NULL, NULL, 'Java II', 'java-ii', 'programowanie/java-ii', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 2, '2019-02-10 14:47:14'),
(56, 53, NULL, NULL, NULL, NULL, 'CPP', 'cpp', 'programowanie/cpp', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 4, '2019-02-10 14:47:14'),
(57, 53, NULL, NULL, NULL, NULL, 'Sieci komputerowe', 'sieci-komputerowe', 'programowanie/sieci-komputerowe', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 3, '2019-02-10 14:47:14'),
(58, 53, NULL, NULL, NULL, NULL, 'Administracja systemem Linux', 'administracja-systemem-linux', 'programowanie/administracja-systemem-linux', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 5, '2019-02-10 14:47:14'),
(60, 53, NULL, 33, NULL, NULL, 'JavaScript', 'javascript', 'programowanie/javascript', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 6, '2019-02-10 14:47:14'),
(61, 53, NULL, NULL, NULL, NULL, 'ANGULAR', 'angular', 'programowanie/angular', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 7, '2019-02-10 14:47:14'),
(62, NULL, NULL, NULL, NULL, NULL, 'Video', 'video', 'video', 'school', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 5, '2019-02-27 12:55:37'),
(63, 62, NULL, NULL, NULL, NULL, 'Obróbka i postprodukcja wideo - After Effects', 'obrobka-i-postprodukcja-wideo-after-effects', 'obrobka-i-postprodukcja-wideo-after-effects', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 15:47:23'),
(65, 62, NULL, NULL, NULL, NULL, 'Adobe Flash Professional', 'adobe-flash-professional', 'adobe-flash-professional', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 15:47:23'),
(66, 62, NULL, NULL, NULL, NULL, 'Adobe Photoshop - podstawowy', 'adobe-photoshop-podstawowy', 'adobe-photoshop-podstawowy', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 15:47:23'),
(67, 62, NULL, NULL, NULL, NULL, 'Montaż wideo - Premiere (podstawy)', 'montaz-wideo-premiere-podstawy', 'montaz-wideo-premiere-podstawy', 'course', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '2019-02-05 15:47:23'),
(81, NULL, NULL, NULL, NULL, 1, 'Szkoły', 'szkoly', 'szkoly', 'school', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 7, '2019-02-27 12:55:37');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `link_menu`
--

CREATE TABLE `link_menu` (
  `link_id` int(10) UNSIGNED DEFAULT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `why` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `link_menu`
--

INSERT INTO `link_menu` (`link_id`, `menu_id`, `why`) VALUES
(2, 1, NULL),
(3, 1, NULL),
(1, 1, NULL),
(1, 1, NULL),
(1, 1, NULL),
(3, 1, NULL),
(6, 1, NULL),
(7, 1, NULL),
(1, 1, NULL),
(2, 1, NULL),
(3, 1, NULL),
(4, 1, NULL),
(1, 1, NULL),
(3, 1, NULL),
(6, 1, NULL),
(7, 1, NULL),
(9, 1, NULL),
(1, 1, NULL),
(2, 1, NULL),
(3, 1, NULL),
(4, 1, NULL),
(9, 1, NULL),
(6, 1, NULL),
(7, 1, NULL),
(14, 1, NULL),
(2, 2, NULL),
(7, 2, NULL),
(9, 2, NULL),
(10, 2, NULL),
(11, 2, NULL),
(13, 2, NULL),
(14, 2, NULL),
(16, 2, NULL),
(17, 2, NULL),
(18, 2, NULL),
(19, 2, NULL),
(20, 2, NULL),
(1, 2, NULL),
(5, 2, NULL),
(4, 2, NULL),
(3, 2, NULL),
(8, 2, NULL),
(12, 2, NULL),
(15, 2, NULL),
(21, 2, NULL),
(22, 2, NULL),
(23, 2, NULL),
(24, 2, NULL),
(25, 2, NULL),
(28, 2, NULL),
(29, 2, NULL),
(30, 2, NULL),
(31, 2, NULL),
(32, 2, NULL),
(33, 2, NULL),
(34, 2, NULL),
(36, 2, NULL),
(37, 2, NULL),
(41, 2, NULL),
(39, 2, NULL),
(40, 2, NULL),
(1, 1, NULL),
(2, 1, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu`
--

CREATE TABLE `menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) DEFAULT NULL,
  `links_json` longtext COLLATE utf8_unicode_ci,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `menu`
--

INSERT INTO `menu` (`id`, `name`, `alias`, `level`, `links_json`, `updated_at`) VALUES
(1, 'Menu WWW', 'menu-www', 2, '[]', '2019-03-18 17:52:35'),
(2, 'Menu Grafika', 'menu-grafika', 2, '[]', '2019-02-28 23:36:53'),
(3, 'Menu Office', 'menu-office', 2, '[]', '2019-02-28 22:46:42'),
(4, 'Menu Programowanie', 'menu-programowanie', 2, '[]', '2019-02-18 16:59:08'),
(5, 'Menu Video', 'menu-video', 2, '[]', '2019-02-19 01:07:39'),
(6, 'Menu artykuły', 'menu-artykuly', 1, '[]', '2019-02-19 16:41:17');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `run_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `name`, `run_on`) VALUES
(1, '/20190203213910-user', '2019-02-05 16:45:32'),
(2, '/20190204143335-category', '2019-02-05 16:45:32'),
(3, '/20190204143336-school', '2019-02-05 16:45:32'),
(4, '/20190204143438-content', '2019-02-05 16:45:33'),
(5, '/20190204144303-course', '2019-02-05 16:45:33'),
(6, '/20190204144303-gallery', '2019-02-05 16:45:33'),
(7, '/20190204150001-link', '2019-02-05 16:45:34'),
(8, '/20190204150002-menu', '2019-02-05 16:45:34'),
(9, '/20190204150003-menu-link', '2019-02-05 16:45:35'),
(10, '/20190204164419-learn-time', '2019-02-05 16:45:35'),
(11, '/20190204164420-term', '2019-02-05 16:45:35');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `school`
--

CREATE TABLE `school` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `self_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `school`
--

INSERT INTO `school` (`id`, `name`, `alias`, `icon`, `description`, `self_link`, `updated_at`) VALUES
(1, 'Szkoła', 'szkola', NULL, NULL, 'szkoly', '2019-02-27 13:44:54'),
(2, 'Grafika', 'grafika', NULL, NULL, 'grafika', '2019-02-05 16:09:40'),
(3, 'MS', 'ms', NULL, NULL, 'ms-office', '2019-02-05 16:09:46'),
(4, 'Programowanie', 'programowanie', NULL, NULL, 'programowanie', '2019-02-05 16:09:51'),
(5, 'Video', 'video', NULL, NULL, 'video', '2019-02-05 16:09:57');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `term`
--

CREATE TABLE `term` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `learn_term_id` int(10) UNSIGNED DEFAULT NULL,
  `time_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_day_at` date DEFAULT NULL,
  `end_day_at` date DEFAULT NULL,
  `start_time_at` time DEFAULT NULL,
  `end_time_at` time DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `status`, `updated_at`) VALUES
(1, 'admin', '$2a$10$mNEv7BP.wkYav0dZ0Ew3u.e8KfjxvMV0CGRU/HgcnO/eFvwEUZmAq', 1, '2019-02-05 18:22:18');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indeksy dla tabeli `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD KEY `content_category_id_fk` (`category_id`);

--
-- Indeksy dla tabeli `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_school_id_fk` (`school_id`);

--
-- Indeksy dla tabeli `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_course_id_fk` (`course_id`),
  ADD KEY `gallery_content_id_fk` (`content_id`);

--
-- Indeksy dla tabeli `learn_time`
--
ALTER TABLE `learn_time`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_school_id_fk` (`school_id`),
  ADD KEY `link_category_id_fk` (`category_id`),
  ADD KEY `link_course_id_fk` (`course_id`),
  ADD KEY `link_content_id_fk` (`content_id`),
  ADD KEY `link_link_id_fk` (`link_id`);

--
-- Indeksy dla tabeli `link_menu`
--
ALTER TABLE `link_menu`
  ADD KEY `menu_link_link_id_fk` (`link_id`) USING BTREE,
  ADD KEY `menu_link_menu_id_fk` (`menu_id`) USING BTREE;

--
-- Indeksy dla tabeli `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`id`),
  ADD KEY `term_learn_time_id_fk` (`learn_term_id`),
  ADD KEY `term_course_id_fk` (`course_id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `content`
--
ALTER TABLE `content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `course`
--
ALTER TABLE `course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT dla tabeli `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `learn_time`
--
ALTER TABLE `learn_time`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `link`
--
ALTER TABLE `link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT dla tabeli `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `school`
--
ALTER TABLE `school`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `term`
--
ALTER TABLE `term`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL;

--
-- Ograniczenia dla tabeli `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_school_id_fk` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE SET NULL;

--
-- Ograniczenia dla tabeli `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_content_id_fk` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `gallery_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE SET NULL;

--
-- Ograniczenia dla tabeli `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `link_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `link_content_id_fk` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `link_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `link_link_id_fk` FOREIGN KEY (`link_id`) REFERENCES `link` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `link_school_id_fk` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE SET NULL;

--
-- Ograniczenia dla tabeli `link_menu`
--
ALTER TABLE `link_menu`
  ADD CONSTRAINT `menu_links_links_id_fk` FOREIGN KEY (`link_id`) REFERENCES `link` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_links_menu_id_fk` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `term`
--
ALTER TABLE `term`
  ADD CONSTRAINT `term_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `term_learn_time_id_fk` FOREIGN KEY (`learn_term_id`) REFERENCES `learn_time` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
