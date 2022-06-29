drop database if exists iteh_projekat;
create database if not exists iteh_projekat;
use iteh_projekat;

create table User(
	userID int not null auto_increment primary key,
	firstName varchar(100) not null,
    lastName varchar(100) not null,
    email varchar(100) not null,
    username varchar(100) not null,
    profilePictureUrl varchar(300) not null default 'https://th.bing.com/th/id/OIP.oj8TqTmjPpwTQ33kqwJBGQAAAA?pid=ImgDet&w=474&h=474&rs=1',
    password varchar(100) not null
);

create table Post(
	postID int not null auto_increment primary key,
	text varchar(100) not null,
    postImageUrl varchar(300),
    userID int not null,
    createdDate timestamp not null default current_timestamp(),
    foreign key(userID) references User(userID)
);

create table Comment(
	commentID int not null auto_increment primary key,
    text varchar(100) not null,
    createdDate timestamp not null default current_timestamp(),
    userID int not null,
    postID int not null,
    foreign key(postID) references Post(postID),
    foreign key(userID) references User(userID)
);

create table Likes(
	likeID int not null auto_increment primary key,
    userID int not null,
    commentID int not null,
	foreign key(userID) references User(userID),
    foreign key(commentID) references Comment(commentID)
);