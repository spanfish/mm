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

CREATE TABLE plan (
  planid VARCHAR(30),
  createdate DATE,
  customer VARCHAR(30),
  notifyNo VARCHAR(30),
  versionNo VARCHAR(30),
  model VARCHAR(30),
  bomNo VARCHAR(30),
  softVersionNo VARCHAR(30),
  orderQuantity VARCHAR(30),
  manufactureType VARCHAR(30),
  memo VARCHAR(30),
  reviewer_name VARCHAR(30),
  approver_name VARCHAR(30)
);