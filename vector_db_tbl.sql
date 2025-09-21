DROP DATABASE IF EXISTS `vector`;
CREATE DATABASE `vector`;
USE `vector`;

DROP TABLE if exists products;

CREATE TABLE `products` (
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `embedding` vector(4) NOT NULL,
  VECTOR KEY `embedding` (`embedding`) `M`=6 `DISTANCE`=euclidean
);

INSERT INTO products (name, description, embedding)
VALUES ('Coffee Machine',
        'Built to make the best coffee you can imagine',
        VEC_FromText('[0.3, 0.5, 0.2, 0.1]'));

SELECT VEC_ToText(embedding) FROM products;
