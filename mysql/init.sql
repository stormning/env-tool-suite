CREATE DATABASE bitbucket CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL ON bitbucket.* TO ‘bitbucket‘@‘%‘ IDENTIFIED BY ‘bitbucket‘;
GRANT ALL PRIVILEGES ON bitbucket.* TO ‘bitbucket‘@‘localhost‘ IDENTIFIED BY ‘bitbucket‘;
FLUSH PRIVILEGES;