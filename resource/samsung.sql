
create table users (
    user_id varchar2(20) primary key,
    password varchar2(20) not null,
    email varchar2(100) not null,
    Description varchar2(500) default 'My Description'
);

create table pic (
    user_pic_no number(11) primary key,
    user_id varchar2(20),
    file_name varchar2(100) not null,
    file_size varchar2(50) not null,
    file_data BLOB not null,
    constraint fk_user_id_pic foreign key(user_id) references users(user_id) on delete cascade
);

create table contents (
    content_no number(11) primary key,
    user_id varchar2(20) not null,
    youtube_url varchar2(100) not null,
    text CLOB not null,
    genre varchar2(20) not null,
    tag varchar2(20) not null,
    like_count number(11) default 0,
    create_date date,
    constraint fk_user_id foreign key(user_id) references users(user_id) on delete cascade
);

create sequence content_seq;

create table comments (
    comment_no number(11) primary key,
    content_no number(11) not null,
    user_id varchar2(20) not null,
    comment_text varchar2(300) not null,
    create_date date,
    constraint fk_content_no foreign key(content_no) references contents(content_no) on delete cascade,
    constraint fk_user_id_comments foreign key(user_id) references users(user_id) on delete cascade
);

create sequence comment_seq;


insert into users values('test', '1234', 'test@naver.com','안녕하세요');
insert into users values('test2', '5678', 'test2@naver.com','안녕하세요~!');

insert into contents values(content_seq.nextval, 'test', 'https://www.youtube.com/watch?v=IXlDOkICNr8', '테스트테스트', 'dance', '신난다', 0, sysdate);
insert into contents values(content_seq.nextval, 'test', 'https://www.youtube.com/watch?v=2gvbKJYWaRA', '테스트입니다', 'pop', '잔잔하다', 0, sysdate);

insert into comments values(comment_seq.nextval, 1, 'test', '댓글 테스트입니다', sysdate);
insert into comments values(comment_seq.nextval, 2, 'test2', '댓글 테스트입니다222', sysdate);

