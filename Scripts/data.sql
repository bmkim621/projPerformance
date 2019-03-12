-- 시설
insert into facilities values
(1, 3, 120, '대구오페라하우스 본관', 30, 30, 30, 30),
(2, 3, 120, '대구오페라하우스 별관', 30, 30, 30, 30);

-- insert into resv_seat values('A', 1, 'P19008'), ('A', 20, 'P19008');

-- 공연
insert into performance values
('P19001', '한헝 수교 30주년 기념 공연 오페라 콘체르탄테 <반크 반>', 'A', 160, '19:00', '2019-01-17', '2019-01-17', 1, null, '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1524.jpg', 120, 30, 30, 30, 30),
('P19002', '무대점검 및 공사', 'E', null, null, '2019-01-18', '2019-02-06', 1, null, null, 120, 30, 30, 30, 30),
('P19003', '렉처오페라 <버섯피자>', 'A', 80, '19:30', '2019-02-22', '2019-02-22', 1, null, '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1526.jpg', 120, 30, 30, 30, 30),
('P19004', '렉처오페라 <버섯피자>', 'A', 80, '15:00', '2019-02-23', '2019-02-23', 1, null, '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1526.jpg', 120, 30, 30, 30, 30),
('P19005', '오페라 유니버시아드<마술피리>', 'A', 150, '19:30', '2019-03-07', '2019-03-07', 1, 'SEAT1', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1516.jpg', 120, 30, 30, 30, 30),
('P19006', '오페라 유니버시아드<마술피리>', 'A', 150, '19:30', '2019-03-08', '2019-03-08', 1, 'SEAT1', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1516.jpg', 120, 30, 30, 30, 30),
('P19007', '오페라 유니버시아드<마술피리>', 'A', 150, '15:00', '2019-03-09', '2019-03-09', 1, 'SEAT1', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1516.jpg', 120, 30, 30, 30, 30),
('P19008', '영아티스트 오페라 <사랑의 묘약>', 'A', 150, '19:30', '2019-03-29', '2019-03-29', 1, 'SEAT2', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1525.jpg', 120, 30, 30, 30, 30),
('P19009', '영아티스트 오페라 <사랑의 묘약>', 'A', 150, '15:00', '2019-03-30', '2019-03-30', 1, 'SEAT2', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1525.jpg', 120, 30, 30, 30, 30),
('P19010', '오페라 <팔리아치>', 'A', 90, '19:30', '2019-04-26', '2019-04-26', 1, 'SEAT2', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1518.jpg', 120, 30, 30, 30, 30),
('P19011', '오페라 <팔리아치>', 'A', 90, '15:00', '2019-04-27', '2019-04-27', 1, 'SEAT2', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1518.jpg', 120, 30, 30, 30, 30),
('P19012', '가족오페라 <헨젤과 그레텔>', 'A', 90, '19:30', '2019-05-24', '2019-05-24', 1, 'SEAT2', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1519.jpg', 120, 30, 30, 30, 30),
('P19013', '가족오페라 <헨젤과 그레텔>', 'A', 90, '15:00', '2019-05-25', '2019-05-25', 1, 'SEAT2', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1519.jpg', 120, 30, 30, 30, 30),
('P19014', '제5회 DIMF 뮤지컬스타 본선', 'B', null, '14:00', '2019-06-01', '2019-06-01', 1, null, null, 120, 30, 30, 30, 30),
('P19015', '모나코 몬테카를로 발레단 <신데렐라>', 'A', 120, '15:00', '2019-06-08', '2019-06-08', 1, 'SEAT2', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1520.jpg', 120, 30, 30, 30, 30),
('P19016', '모나코 몬테카를로 발레단 <신데렐라>', 'A', 120, '17:00', '2019-06-09', '2019-06-09', 1, 'SEAT2', '/upload/2019/02/25/638e95ad-12e1-4fbd-8267-26e748305d98_1520.jpg', 120, 30, 30, 30, 30),
('P19017', '제 13회 대구국제뮤지컬페스티벌', 'B', null, null, '2019-06-14', '2019-07-09', 1, null, null, 120, 30, 30, 30, 30);


insert into performance values
('P18001', '국립발레단 <호두까기인형>', 'A', 120, '19:30', '2018-12-04', '2018-12-04', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1497.jpg', 120, 30, 30, 30, 30),
('P18002', '국립발레단 <호두까기인형>', 'A', 120, '19:30', '2018-12-05', '2018-12-05', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1497.jpg', 120, 30, 30, 30, 30),
('P18003', '2018 오펀스튜디오 수료음악회', 'A', 90, '15:00', '2018-12-15', '2018-12-15', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1522.jpg', 120, 30, 30, 30, 30),
('P18004', '2018 오펀스튜디오 수료음악회', 'A', 90, '17:00', '2018-12-15', '2018-12-15', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1522.jpg', 120, 30, 30, 30, 30),
('P18005', '오페라 <라 보엠>', 'A', 120, '15:00', '2018-12-22', '2018-12-22', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1498.jpg', 120, 30, 30, 30, 30),
('P18006', '오페라 <라 보엠>', 'A', 120, '19:30', '2018-12-24', '2018-12-24', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1498.jpg', 120, 30, 30, 30, 30),
('P18007', '오페라 <라 보엠>', 'A', 120, '15:00', '2018-12-25', '2018-12-25', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1498.jpg', 120, 30, 30, 30, 30),
('P18008', '오페라 <라 보엠>', 'A', 120, '19:30', '2018-12-26', '2018-12-26', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1498.jpg', 120, 30, 30, 30, 30),
('P18009', '렉처오페라 <로미오와 줄리엣 & 파우스트> - 대구', 'A', 120, '19:30', '2018-11-02', '2018-11-02', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1502.jpg', 120, 30, 30, 30, 30),
('P18010', '렉처오페라 <로미오와 줄리엣 & 파우스트> - 대구', 'A', 120, '15:00', '2018-11-03', '2018-11-03', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1502.jpg', 120, 30, 30, 30, 30),
('P18011', '하이체와 함께하는 푸치니 갈라콘서트', 'A', 120, '19:30', '2018-11-22', '2018-11-22', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1468.jpg', 120, 30, 30, 30, 30),
('P18012', '렉처오페라 <친구 프리츠> - 대구', 'A', 120, '19:30', '2018-11-23', '2018-11-23', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1503.jpg', 120, 30, 30, 30, 30),
('P18013', '렉처오페라 <친구 프리츠> - 대구', 'A', 120, '15:00', '2018-11-24', '2018-11-24', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1503.jpg', 120, 30, 30, 30, 30),
('P18014', '[문화가 있는 날 공연] 오페라, 가사가 들리네', 'A', 90, '17:00', '2018-11-26', '2018-11-26', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1507.jpg', 120, 30, 30, 30, 30),
('P18015', '뮤지컬 시카고', 'B', 150, '19:30', '2018-11-02', '2018-11-02', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1457.jpg', 120, 30, 30, 30, 30),
('P18016', '뮤지컬 시카고', 'B', 150, '14:00', '2018-11-03', '2018-11-03', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1457.jpg', 120, 30, 30, 30, 30),
('P18017', '뮤지컬 시카고', 'B', 150, '18:30', '2018-11-04', '2018-11-04', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1457.jpg', 120, 30, 30, 30, 30),
('P18018', '[메인오페라] 라 트라비아타', 'C', 120, '19:30', '2018-10-19', '2018-10-19', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1481.jpg', 120, 30, 30, 30, 30),
('P18019', '[메인오페라] 라 트라비아타', 'C', 120, '15:00', '2018-10-20', '2018-10-20', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1481.jpg', 120, 30, 30, 30, 30),
('P18020', '[특별행사] 오페라 오디세이 4 <유쾌한 미망인> - 김문경', 'C', null, '19:30', '2018-10-01', '2018-10-01', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1494.jpg', 120, 30, 30, 30, 30),
('P18021', '[메인오페라] 유쾌한 미망인', 'C', null, '19:30', '2018-10-04', '2018-10-04', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1480.jpg', 120, 30, 30, 30, 30),
('P18022', '[메인오페라] 유쾌한 미망인', 'C', null, '15:00', '2018-10-06', '2018-10-06', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1480.jpg', 120, 30, 30, 30, 30),
('P18023', '[콘서트 시리즈] 폐막콘서트&오페라대상시상식', 'C', null, '17:00', '2018-10-21', '2018-10-21', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1487.jpg', 120, 30, 30, 30, 30),
('P18024', '[문화가 있는 날 공연] 오페라, 가사가 들리네', 'A', null, '19:30', '2018-10-24', '2018-10-24', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1504.jpg', 120, 30, 30, 30, 30),
('P18025', '[메인오페라] 돈 카를로', 'C', null, '19:30', '2018-09-14', '2018-09-14', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1477.jpg', 120, 30, 30, 30, 30),
('P18026', '[메인오페라] 돈 카를로', 'C', null, '17:00', '2018-09-16', '2018-09-16', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1477.jpg', 120, 30, 30, 30, 30),
('P18027', '[오페라 콘체르탄테] <살로메>', 'C', null, '19:30', '2018-09-18', '2018-09-18', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1478.jpg', 120, 30, 30, 30, 30),
('P18028', '[메인오페라] 윤심덕 - 사의 찬미', 'C', null, '19:30', '2018-09-28', '2018-09-28', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1479.jpg', 120, 30, 30, 30, 30),
('P18029', '[메인오페라] 윤심덕 - 사의 찬미', 'C', null, '15:00', '2018-09-29', '2018-09-29', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1479.jpg', 120, 30, 30, 30, 30),
('P18030', '오펀스튜디오 특강 <베이스 연광철과의 만남>', 'A', 90, null, '2018-08-17', '2018-08-17', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1500.jpg', 120, 30, 30, 30, 30),
('P18031', '[문화가 있는 날 공연] 오페라, 가사가 들리네', 'A', null, '19:30', '2018-08-28', '2018-08-28', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1511.jpg', 120, 30, 30, 30, 30),
('P18032', '대구성악콩쿠르 본선', 'B', null, '19:00', '2018-08-30', '2018-08-30', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1476.jpg', 120, 30, 30, 30, 30),
('P18033', '제9회 전국아마추어 성악콩쿠르(본선)', 'C', null, '17:00', '2018-08-25', '2018-08-25', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1499.jpg', 120, 30, 30, 30, 30),
('P18034', '렉처오페라 <사랑의 모약>', 'A', null, '19:30', '2018-07-06', '2018-07-06', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1470.jpg', 120, 30, 30, 30, 30),
('P18035', '렉처오페라 <사랑의 모약>', 'A', null, '15:00', '2018-07-07', '2018-07-07', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1470.jpg', 120, 30, 30, 30, 30),
('P18036', '[문화가 있는 날 공연] 오페라, 가사가 들리네', 'A', null, '19:30', '2018-07-24', '2018-07-24', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1512.jpg', 120, 30, 30, 30, 30),
('P18037', '오페라 <투란도트>', 'A', null, '19:30', '2018-07-27', '2018-07-27', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1453.jpg', 120, 30, 30, 30, 30),
('P18038', '오페라 <투란도트>', 'A', null, '17:00', '2018-07-28', '2018-07-28', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1453.jpg', 120, 30, 30, 30, 30),
('P18039', '[DIMF] DIMF 어워즈', 'B', null, '19:30', '2018-07-09', '2018-07-09', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1474.jpg', 120, 30, 30, 30, 30),
('P18040', '오페라스타즈 불멸의 작곡가를 노래하다', 'A', null, '19:30', '2018-06-01', '2018-06-01', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1469.jpg', 120, 30, 30, 30, 30),
('P18041', '[문화가 있는 날 공연] 오페라, 가사가 들리네', 'A', null, '19:30', '2018-06-26', '2018-06-26', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1509.jpg', 120, 30, 30, 30, 30),
('P18042', '[DIMF] 개막작 메피스토', 'B', 165, '19:30', '2018-06-22', '2018-06-22', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1471.jpg', 120, 30, 30, 30, 30),
('P18043', '[DIMF] 개막작 메피스토', 'B', 165, '15:00', '2018-06-23', '2018-06-23', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1471.jpg', 120, 30, 30, 30, 30),
('P18044', '가족오페라 <마술피리>', 'A', null, '14:00', '2018-05-26', '2018-05-26', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1452.jpg', 120, 30, 30, 30, 30),
('P18045', '가족오페라 <마술피리>', 'A', null, '17:00', '2018-05-26', '2018-05-26', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1452.jpg', 120, 30, 30, 30, 30),
('P18046', '2018 권효원의 춤', 'B', null, '19:30', '2018-05-12', '2018-05-12', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1455.jpg', 120, 30, 30, 30, 30),
('P18047', '렉처오페라 <나비부인> / 대구오페라하우스 별관 카메라타', 'A', null, '19:30', '2018-04-13', '2018-04-13', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1450.jpg', 120, 30, 30, 30, 30),
('P18048', '렉처오페라 <나비부인> / 대구오페라하우스 별관 카메라타', 'A', null, '15:00', '2018-04-14', '2018-04-14', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1450.jpg', 120, 30, 30, 30, 30),
('P18049', '오페라 <나비부인>', 'A', null, '19:30', '2018-04-27', '2018-04-27', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1451.jpg', 120, 30, 30, 30, 30),
('P18050', '오페라 <나비부인>', 'A', null, '15:00', '2018-04-28', '2018-04-28', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1451.jpg', 120, 30, 30, 30, 30),
('P18051', '대구 CBS 창립기념음악회', 'B', null, '19:30', '2018-04-03', '2018-04-03', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1454.jpg', 120, 30, 30, 30, 30),
('P18052', '완벽한 로봇 디바 <에버>', 'A', null, '15:00', '2018-03-01', '2018-03-01', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1439.jpg', 120, 30, 30, 30, 30),
('P18053', '완벽한 로봇 디바 <에버>', 'A', null, '19:30', '2018-03-02', '2018-03-02', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1439.jpg', 120, 30, 30, 30, 30),
('P18054', '완벽한 로봇 디바 <에버>', 'A', null, '15:00', '2018-03-03', '2018-03-03', 2, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1439.jpg', 120, 30, 30, 30, 30),
('P18055', '영아티스트 오페라 <라 보엠>', 'A', null, '19:30', '2018-03-23', '2018-03-23', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1442.jpg', 120, 30, 30, 30, 30),
('P18056', '영아티스트 오페라 <라 보엠>', 'A', null, '15:00', '2018-03-24', '2018-03-24', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1442.jpg', 120, 30, 30, 30, 30),
('P18057', '오페라 유니버시아드 <피가로의 결혼>', 'A', null, '19:30', '2018-03-08', '2018-03-08', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1440.jpg', 120, 30, 30, 30, 30),
('P18058', '오페라 유니버시아드 <피가로의 결혼>', 'A', null, '19:30', '2018-03-09', '2018-03-09', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1440.jpg', 120, 30, 30, 30, 30),
('P18059', '오페라 유니버시아드 <피가로의 결혼>', 'A', null, '15:00', '2018-03-10', '2018-03-10', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1440.jpg', 120, 30, 30, 30, 30),
('P18060', '앙코르 <아이다>', 'A', 150, '19:30', '2018-01-26', '2018-01-26', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1431.jpg', 120, 30, 30, 30, 30),
('P18061', '뮤지컬 헤드윅', 'B', null, '19:00', '2018-01-13', '2018-01-13', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1430.jpg', 120, 30, 30, 30, 30),
('P18062', '뮤지컬 헤드윅', 'B', null, '18:00', '2018-01-14', '2018-01-14', 1, null, '/upload/2018/01/01/7fbba25a-c0ab-46d3-ac00-3a9b41ec3f85_1430.jpg', 120, 30, 30, 30, 30);



-- 좌석
insert into seat values
('SEAT1', 'A', 1, 1, 40), ('SEAT1', 'B', 1, 1, 40), ('SEAT1', 'C', 1, 1, 40),
('SEAT2', 'A', 1, 1, 40), ('SEAT2', 'B', 1, 1, 40), ('SEAT2', 'C', 1, 1, 40);

-- 할인
insert into discount values
('00', 0, '기본가(할인 선택없음)'), ('01', 10, '대구오페라하우스 홈페이지 회원'), ('02', 10, '코코아 회원'), ('03', 20, '예술인패스 할인(본인)'),
('10', 20, '아이조아 카드 소지자'), ('11', 20, '산모수첩 소지자'), ('04', 20, '문화패스(총소년 및 대학생 8세~24세)'),
('05', 50, '만 65세 이상(본인)');

-- 결제
insert into payment values
('PAY01', '신용카드'), ('PAY02', '무통장입금'), ('PAY03', '휴대폰결제');

-- 등급
insert into grade values ('G01', '관리자'), ('G02', '사원');

-- 고객
insert into tbl_member (member_code, member_name, id, password, email, phone, address, isMember, grade_code) values 
('M19001', '김보민', 'bmkim621', password('qwerty1234'), 'test@gmail.com', '010-123-1234', '대구광역시', 0, null),
('M19002', '홍길동', 'gdhong', password('12341234'), 'hong@naver.com.com', '010-777-7777', '대구광역시', 1, 'G01'),
('M19003', '김철수', 'test01', password('12341234'), 'kcs@ghanmail.net', '010-111-1111', '서울특별시', 0, null);

-- 공지
insert into notice(content, title, is_notice, member_code, writer) values
('안녕하세요? 대구오페라하우스입니다. 이번 3월 3일자로 저희 대구오페라하우스가 임시 개통을 하였습니다. 부족한 부분들에 대해서는 꾸준히 Update 하겠습니다. 여러분들의 따뜻한 말씀을 기다리겠습니다. 감사합니다.', '대구오페라하우스 홈페이지 임시개통', 0, 'M19002', '관리자'),
('(재)대구오페라하우스 제17회 소극장오페라 및 창작오페라 공모 선정작을 최종 선정팀에게 전화로 알려드렸습니다. 지원자분들의 많은 관심과 성원에 감사드립니다.', '(재)대구오페라하우스 제 17회 소극장오페라 및 창작오페라 공모 선정작 발표 안내', 0, 'M19002', '관리자'),
(null, '2019 Daegu Opera House Oprenstudio Audition', 0, 'M19002', '관리자'),
('캐스팅은 사전 공지 없이 변경될 수 있습니다.', '발레 <호두까기인형> 캐스팅 변경 안내', 0, 'M19002', '관리자'),
(null, '제16회 대구국제오페라축제 얼리버드 티켓오픈 안내', 0, 'M19002', '관리자'),
('2019년도 오페라코치 & 반주자 선발오디션 최종합격자는 전화로 합격여부를 알려드렸습니다. 지원자분들의 많은 관심과 성원에 감사드립니다.', '2019 (재)대구오페라하우스 오페라코치 & 반주자 선발오디션 최종합격자 안내', 0, 'M19002', '관리자'),
(null, '2019 오펀스튜디오 오디션 합격자 공지', 0, 'M19002', '관리자'),
(null, '2018 렉쳐오페라 공연작품 공모사업', 0, 'M19002', '관리자'),
(null, '2018 상반기 정기대관 공고', 0, 'M19002', '관리자'),
('대구국제오페라축제 온라인 자원활동가 3기 오페라팬(Operafan) 합격자를 아래와 같이 발표합니다. 많은 지원과 관심 감사드립니다.', '온라인 자원활동가 오페라팬 3기 합격자 발표', 0, 'M19002', '관리자'),
(null, '2019년 상반기 수시대관 신청 공고', 0, 'M19002', '관리자');

-- 후기
insert into review(review_title, review_writer, review_content, member_code) values
('공연관람후기 테스트', '김철수', '공연관람후기 테스트입니다.', 'M19003'),
('코믹반전스릴러 연극 <그녀가 산다> - 대구공연', '김철수', '색다른 코드의 코믹스릴러! 반전의 스토리!!', 'M19003'),
('[서구문화회관] 비타민콘서트 안내', '김철수', '서구문화회관 시즌기획공연 "비타민콘서트" 안내', 'M19003');

insert into book(book_number, member_code, show_code, payment_code, discount_code, book_date, book_time, book_state, book_zone, book_num, seat_grade, seat_category) values 
('B19001', 'M19003', 'P19008', 'PAY01', '00', '2019-03-29', '19:30', 0, 'A', 10, 'R', 'SEAT2'),
('B19002', 'M19003', 'P19007', 'PAY01', '00', '2019-03-09', '15:00', 0, 'A', 10, 'N', 'SEAT1'),
('B19003', 'M19003', 'P19008', 'PAY01', '00', '2019-03-29', '19:30', 0, 'A', 32, 'B', 'SEAT2');

