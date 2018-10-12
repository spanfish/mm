CREATE TABLE users (
  username VARCHAR(30),
  password VARCHAR(30),
  email  VARCHAR(50),
  enabled CHAR(1)
);

CREATE TABLE user_roles (
  username VARCHAR(30),
  role VARCHAR(30)
);