CREATE SCHEMA openpkw DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
CREATE USER 'openpkw'@'localhost' IDENTIFIED BY 'lwejlr2k3jlsfedlk2j34';
GRANT ALL PRIVILEGES ON openpkw.* TO 'openpkw'@'localhost';
FLUSH PRIVILEGES;