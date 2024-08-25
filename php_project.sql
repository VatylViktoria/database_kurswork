-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Сер 26 2024 р., 00:10
-- Версія сервера: 8.0.30
-- Версія PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `cms`
--

-- --------------------------------------------------------

--
-- Структура таблиці `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL COMMENT 'ID',
  `category_name` varchar(255) NOT NULL COMMENT 'Назва категорії новин'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп даних таблиці `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'Конфлікт'),
(2, 'Інтерв\'ю'),
(3, 'Реліз'),
(4, 'Концерт');

-- --------------------------------------------------------

--
-- Структура таблиці `genre`
--

CREATE TABLE `genre` (
  `id` int NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Назва жанру музики',
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп даних таблиці `genre`
--

INSERT INTO `genre` (`id`, `name`, `photo`) VALUES
(1, 'Rock', '63cd63f1f114c.jpg'),
(2, 'Classical', '63cd63fc75537.jpg'),
(3, 'Metal', '63cd640b989e1.jpg'),
(4, 'Rap', '63cd6420d5636.jpg'),
(5, 'Pop ', '63cd64395f5ac.jpg'),
(6, 'Jazz', '63cea13562b10.jpg'),
(7, 'Electronic', '63cea0735e3b4.jpg'),
(8, 'Folk ', ''),
(9, 'Blues', '63cd647cdd303.jpg'),
(10, 'Indie', '63cd644cd8635.jpg');

-- --------------------------------------------------------

--
-- Структура таблиці `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT 'Заголовок новини',
  `id_genre` int DEFAULT NULL COMMENT 'ID жанру музики',
  `id_performer` int DEFAULT NULL COMMENT 'ID виконавця',
  `id_category` int NOT NULL COMMENT 'ID категорії новини',
  `text` text NOT NULL COMMENT 'Короткий опис новини'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп даних таблиці `news`
--

INSERT INTO `news` (`id`, `title`, `id_genre`, `id_performer`, `id_category`, `text`) VALUES
(1, 'Реліз треку \"Батьківщина\"', NULL, 26, 3, 'Новий трек на підтримку українських захисників від гурта KALUSH і репера SKOFKA. Цією піснею музиканти хочуть підтримати бойовий дух українських захисників, а також допомогти зібрати гроші на розвід-комплекси SHARK для ЗСУ.'),
(2, 'Конфлікт учасників премії The Best Ukrainian Metal Act', 3, NULL, 1, 'Після суперечок навколо текстів гурту SKINHATE та його участі на цьогорічному The Best Ukrainian Metal Act, відразу п\'ять гуртів відмовилися від участі у премії — True Tough, BLIND8, Nora Plan, Fitz Roy та «ОТЕЦЬ».'),
(3, 'Конфліктне інтерв\'ю Христини Соловій', 5, 4, 2, 'Під час інтерв’ю на «Буремному подкасті» вона розповіла про своє ставлення до Ані Лорак і Тіни Кароль. Невдовзі в деяких українських ЗМІ почала з\'являтися інформація, що Христина нібито хвалить Ані Лорак, яка досі замовчує повномасштабну війну, та водночас критикує Тіну Кароль.'),
(4, 'Концерт групи \"Друга Ріка\"', 1, 5, 4, '20 січня 2023 року у місті Харкові відбудеться концерт гурту \"Друга Ріка\"');

-- --------------------------------------------------------

--
-- Структура таблиці `performer`
--

CREATE TABLE `performer` (
  `id` int NOT NULL COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'Ім''я виконавця/назва групи',
  `id_genre` int DEFAULT NULL COMMENT 'ID жанру'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп даних таблиці `performer`
--

INSERT INTO `performer` (`id`, `name`, `id_genre`) VALUES
(1, 'Океан Ельзи', 1),
(2, 'СТРУКТУРА ЩАСТЯ', 10),
(3, 'SadSvit', 10),
(4, 'Христина Соловій', 5),
(5, 'Друга Ріка', 1),
(6, 'Скрябін', 5),
(7, 'Тартак', 4),
(8, 'Один В Каное', 5),
(9, 'KRUTЬ', 10),
(10, 'Space of Variations', 3),
(11, 'Fleshgore', 3),
(12, 'THMK', 4),
(13, 'Січгарт', 3),
(14, 'SKINHATE', 3),
(15, 'True Tough', 3),
(16, 'BLIND8', 3),
(17, 'Nora Plan', 3),
(18, 'The Hardkiss', 1),
(19, 'Jerry Heil', 5),
(20, 'Tember Blanche', 5),
(21, 'Kozak System', 1),
(22, '5 Vymir', 10),
(23, 'OTOY', 4),
(24, 'Freel', 4),
(25, 'SKOFKA', 4),
(26, 'KALUSH', 4);

-- --------------------------------------------------------

--
-- Структура таблиці `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL COMMENT 'ID',
  `login` varchar(255) NOT NULL COMMENT 'Логін',
  `password` varchar(255) NOT NULL COMMENT 'Пароль',
  `lastname` varchar(255) NOT NULL COMMENT 'Прізвище',
  `firstname` varchar(255) NOT NULL COMMENT 'Ім''я',
  `access_level` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп даних таблиці `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `lastname`, `firstname`, `access_level`) VALUES
(1, 'ipz212_vvv@student.ztu.edu.ua', '4527c9b5fc3955d911b2df21c81f4563', 'Адмін', 'Адмін', 10),
(2, 'ipz212@student.ztu.edu.ua', 'e10adc3949ba59abbe56e057f20f883e', 'Tori', 'Tori', 1),
(3, 'ipz21_vvv@student.ztu.edu.ua', 'b59c67bf196a4758191e42f76670ceba', 'D', 'D', 1);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_performer` (`id_performer`);

--
-- Індекси таблиці `performer`
--
ALTER TABLE `performer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Індекси таблиці `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблиці `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `performer`
--
ALTER TABLE `performer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблиці `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=4;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `news_ibfk_3` FOREIGN KEY (`id_performer`) REFERENCES `performer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Обмеження зовнішнього ключа таблиці `performer`
--
ALTER TABLE `performer`
  ADD CONSTRAINT `performer_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
