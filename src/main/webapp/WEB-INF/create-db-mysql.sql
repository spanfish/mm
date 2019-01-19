create user mm@localhost identified by '9350'
CREATE DATABASE mm CHARACTER SET utf8;
grant all on mm.* to mm@localhost


CREATE TABLE users (
  username varchar(30) NOT NULL,
  userDispname varchar(30) DEFAULT NULL,
  password varchar(30) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  enabled char(1) DEFAULT NULL,
  version int(11) DEFAULT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE roles (
  role varchar(30) NOT NULL,
  description varchar(30) DEFAULT NULL,
  version int(11) DEFAULT NULL,
  PRIMARY KEY (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE user_role (
  username varchar(30) NOT NULL,
  role varchar(30) NOT NULL,
  PRIMARY KEY (username,role),
  FOREIGN KEY (username) REFERENCES users (username) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (role) REFERENCES roles (role) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8
  
CREATE TABLE plan (
  planid varchar(100) NOT NULL,
  status varchar(30) DEFAULT NULL,
  templateId varchar(30) DEFAULT NULL,
  create_date date DEFAULT NULL,
  updateDate date DEFAULT NULL,
  creator_name varchar(30) DEFAULT NULL,
  customer varchar(30) DEFAULT NULL,
  notifyNo varchar(30) DEFAULT NULL,
  versionNo int(11) DEFAULT NULL,
  memo varchar(30) DEFAULT NULL,
  reviewer_name varchar(30) DEFAULT NULL,
  review_date date DEFAULT NULL,
  reviewStatus varchar(30) DEFAULT NULL,
  approver_name varchar(30) DEFAULT NULL,
  approve_date date DEFAULT NULL,
  approveStatus varchar(30) DEFAULT NULL,
  message varchar(200) DEFAULT NULL,
  version int(11) DEFAULT NULL,
  FOREIGN KEY (reviewer_name) REFERENCES users (username) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (approver_name) REFERENCES users (username) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (creator_name) REFERENCES users (username) ON DELETE NO ACTION ON UPDATE NO ACTION,
  PRIMARY KEY (planid),
  UNIQUE KEY (notifyNo),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE planitem (
  id varchar(100) NOT NULL,
  plan_id varchar(100) DEFAULT NULL,
  itemname varchar(100) DEFAULT NULL,
  itemvalue varchar(100) DEFAULT NULL,
  version int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (plan_id) REFERENCES plan (planid) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE template (
  id varchar(100) NOT NULL,
  name varchar(100) DEFAULT NULL,
  viewname varchar(100) DEFAULT NULL,
  notifiyNoFormat varchar(100) DEFAULT NULL,
  enabled int(11) DEFAULT NULL,
  creators varchar(400) DEFAULT NULL,
  reviewers varchar(400) DEFAULT NULL,
  approvers varchar(400) DEFAULT NULL,
  version int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE template_approver (
  template_id varchar(100) NOT NULL,
  user_id varchar(100) NOT NULL,
  PRIMARY KEY (template_id,user_id),
  FOREIGN KEY (template_id) REFERENCES template (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (user_id) REFERENCES users (username) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE template_reviewer (
  template_id varchar(100) NOT NULL,
  user_id varchar(100) NOT NULL,
  PRIMARY KEY (template_id,user_id),
  FOREIGN KEY (user_id) REFERENCES users (username) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (template_id) REFERENCES template (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE template_creator (
  template_id varchar(100) NOT NULL,
  user_id varchar(100) NOT NULL,
  PRIMARY KEY (template_id,user_id),
  FOREIGN KEY (user_id) REFERENCES users (username) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (template_id) REFERENCES template (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8

INSERT INTO users VALUES ('admin', 'Admin', 'Qwert123', 'wang_xiangwei@hotmail.com', '1', 0);
INSERT INTO roles VALUES('ROLE_USER', 'User', 0);
INSERT INTO roles VALUES('ROLE_ADMIN', 'Admin', 0);
INSERT INTO user_role VALUES('admin', 'ROLE_ADMIN');
INSERT INTO user_role VALUES('admin', 'ROLE_USER');

INSERT INTO template VALUES('1', 'Haixin', 'haixin', 'HX%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('2', 'Dahua', 'dahua', 'DH%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('3', 'Gubei', 'gubei', 'GB%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('4', 'HengQiang', 'hengqiang', 'HQ%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('5', 'JingTian', 'jingtian', 'JT%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('6', 'KongKe', 'kongke', 'KK%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('7', 'MeiQi', 'meiqi', 'MQ%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('8', 'ShengBen', 'ShengBen', 'SB%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('9', 'TianYi', 'tianyi', 'TY%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('10', 'Hangzhou TuYa', 'tuya', 'TY%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('11', 'WangYi', 'wangyi', 'WY%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('12', 'YuFan', 'yufan', 'YF%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);
INSERT INTO template VALUES('13', 'Hangzhou ZhongKeWei', 'zhongkewei', 'ZKW%yy%%mm%%dd%%02dMB',  1, null, null, null, 0);


INSERT INTO template_creator VALUES('1', 'admin');
INSERT INTO template_reviewer VALUES('1', 'admin');
INSERT INTO template_approver VALUES('1', 'admin');
INSERT INTO template_creator VALUES('2', 'admin');
INSERT INTO template_reviewer VALUES('2', 'admin');
INSERT INTO template_approver VALUES('2', 'admin');
INSERT INTO template_creator VALUES('3', 'admin');
INSERT INTO template_reviewer VALUES('3', 'admin');
INSERT INTO template_approver VALUES('3', 'admin');
INSERT INTO template_creator VALUES('4', 'admin');
INSERT INTO template_reviewer VALUES('4', 'admin');
INSERT INTO template_approver VALUES('4', 'admin');
INSERT INTO template_creator VALUES('5', 'admin');
INSERT INTO template_reviewer VALUES('5', 'admin');
INSERT INTO template_approver VALUES('5', 'admin');
INSERT INTO template_creator VALUES('6', 'admin');
INSERT INTO template_reviewer VALUES('6', 'admin');
INSERT INTO template_approver VALUES('6', 'admin');
INSERT INTO template_creator VALUES('7', 'admin');
INSERT INTO template_reviewer VALUES('7', 'admin');
INSERT INTO template_approver VALUES('7', 'admin');
INSERT INTO template_creator VALUES('8', 'admin');
INSERT INTO template_reviewer VALUES('8', 'admin');
INSERT INTO template_approver VALUES('8', 'admin');
INSERT INTO template_creator VALUES('9', 'admin');
INSERT INTO template_reviewer VALUES('9', 'admin');
INSERT INTO template_approver VALUES('9', 'admin');
INSERT INTO template_creator VALUES('10', 'admin');
INSERT INTO template_reviewer VALUES('10', 'admin');
INSERT INTO template_approver VALUES('10', 'admin');
INSERT INTO template_creator VALUES('11', 'admin');
INSERT INTO template_reviewer VALUES('11', 'admin');
INSERT INTO template_approver VALUES('11', 'admin');
INSERT INTO template_creator VALUES('12', 'admin');
INSERT INTO template_reviewer VALUES('12', 'admin');
INSERT INTO template_approver VALUES('12', 'admin');
INSERT INTO template_creator VALUES('13', 'admin');
INSERT INTO template_reviewer VALUES('13', 'admin');
INSERT INTO template_approver VALUES('13', 'admin');
