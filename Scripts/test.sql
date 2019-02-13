select password('테스트'), length(password('테스트'));
select * from customer where password = password('qwerty1234');