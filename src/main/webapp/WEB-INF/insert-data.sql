INSERT INTO users VALUES ('xwang', '王向伟', '1234', 'wangxw@icloud.com', '1');
INSERT INTO users VALUES ('test1', '测试1', '1234', 'wangxw@icloud.com', '1');
INSERT INTO users VALUES ('test2', '测试2', '1234', 'wangxw@icloud.com', '1');
INSERT INTO users VALUES ('test3', '测试3', '1234', 'wangxw@icloud.com', '0');
INSERT INTO user_roles VALUES('xwang', 'ROLE_USER');
INSERT INTO user_roles VALUES('xwang', 'ROLE_ADMIN');
INSERT INTO user_roles VALUES('xwang2', 'ROLE_USER');

INSERT INTO template VALUES('1', '海信', 'inputPlan', 'HX%yy%%mm%%dd%%02dMB',  1, null, null, null);
INSERT INTO template VALUES('2', '杭州涂鸦', 'TYPage', 'TY%yy%%mm%%dd%%02dMB',  1, null, null, null);
INSERT INTO template VALUES('3', '上海盛本智能科技有限公司', 'ShengBen', 'SB%yy%%mm%%dd%%02dMB',  1, null, null, null);

INSERT INTO template_creator VALUES('1', 'xwang');
INSERT INTO template_reviewer VALUES('1', 'xwang')
INSERT INTO template_approver VALUES('1', 'xwang')