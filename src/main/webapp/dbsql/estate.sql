create table if not exists estate
(

	estateId varchar(15) not null,
	owner varchar(20) not null,
	price int not null,
	address varchar(30) not null,
	category varchar(20),
	description text not null,
	fileName varchar(100),
	carousel varchar(300),
	vdId varchar(100),
	primary key(estateId)
);

select * from estate;

update estate set vdId='2FBW7dK0vus' where estateId='ISBN1231';

insert into estate values('ISBN1231','lijar1214','1002010','부산광역시 해운대구 해운대로 570','푸른 아파트','수영장,놀이터,85%,해운대의 중심에 위치한 고급 아파트로, 3개의 넓은 침실과 2개의 현대식 욕실, 대형 주방, 넓은 거실 및 발코니가 있습니다. 단지 내 수영장과 놀이터, 주차 공간이 제공되며, 주변에 쇼핑몰과 학교가 인접해 있습니다.','11.jpg','12.jpg,13.jpg','4jnzf1yj48M');
insert into estate values(
'ISBN1232','lijar1214',
'600000','대구광역시 중구 동성로 23',
'희망 오피스',
'회의실,카페,95%,현대적인 디자인의 오피스 빌딩으로, 넓고 밝은 오픈 플랜 사무실을 제공하며, 각 층에 주방과 휴게실이 마련되어 있습니다. 5개의 대형 회의실과 10개의 소형 미팅룸이 있으며, 건물 내 카페와 라운지 공간에서 휴식을 취할 수 있습니다.',
'11.jpg','12.jpg,13.jpg','jPkBJY1KI_Q');
insert into estate values(
'ISBN1233','lijar1214',
'650000','인천광역시 남동구 인주대로 650',
'성공 빌라',
'주차장,공원,80%,최근에 건축된 빌라로, 2개의 안락한 침실과 1개의 모던한 욕실, 주방, 넓은 거실 및 정원을 갖추고 있습니다. 개인 주차 공간과 단지 내 공원이 있으며, 근처에 학교와 상점이 있어 생활이 편리합니다.',
'11.jpg','12.jpg,13.jpg','GI_dfaznOCc');
insert into estate values(
'ISBN1234','lijar1214',
'70000','광주광역시 서구 상무대로 112',
'리더 빌딩',
'헬스장,식당,카페,92%,광주의 비즈니스 중심지에 위치한 고급 오피스 빌딩으로, 각 층마다 주방과 15개의 대형 회의실을 갖추고 있습니다. 체력 단련실과 직원 전용 식당, 카페가 있으며, 24시간 운영되는 고속 엘리베이터와 철저한 보안 시스템을 자랑합니다.',
'11.jpg','12.jpg,13.jpg','NeKFqOLhwK0');
insert into estate values(
'ISBN1235','lijar1214',
'680000','대전광역시 유성구 대학로 99',
'평화 맨션',
'주차장,수영장,75%,4개의 넓은 침실과 3개의 현대식 욕실, 대형 주방, 두 개의 발코니가 있는 아파트입니다. 주차 공간 2개와 단지 내 수영장이 제공되며, 인근에 대형 쇼핑몰과 학교가 있어 가족 생활에 적합합니다.',
'11.jpg','12.jpg,13.jpg','gDBMJj4-xAk');
insert into estate values(
'ISBN1236','lijar1214',
'680000','서울특별시 종로구 세종대로 110',
'삼성 타워',
'주차장,헬스장,식당,94%,프리미엄 오피스 빌딩으로, 최신식 설비와 함께 각 층마다 고급 주방과 회의실이 있습니다. 직원 전용 휴게실과 체력 단련실을 이용할 수 있으며, 24시간 보안 시스템이 적용됩니다. 인근에 다양한 비즈니스 시설과 레스토랑이 위치해 있습니다.',
'11.jpg','12.jpg,13.jpg','jKgDWO7Qeoc');

delete from estate;

drop table estate;