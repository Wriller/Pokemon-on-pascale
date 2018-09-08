program battle_of_pascal;
var a,b,c,game,i,i1,i2,dam,damage,fight,hp,xp,full_xp,i3,coin,hp2,p,os:integer;
    sl,start,f:string;
    monster:array [1..10,1..10] of integer;
    monster_name:array [1..10] of string;
    pet:array [1..12,1..12] of integer; //1-жизни;2-урон;3-уровень;4-опыт;5-следуюзий_этап_опыта_для_след_уровня;
    pet_name:array [1..12] of string;
begin
  pet_name[1]:='Таракан'; pet[1,1]:=150; pet[1,2]:=30; pet[1,3]:=1; pet[1,4]:=0;pet[1,5]:=200;
  pet_name[2]:='Бабочка'; pet[2,1]:=120; pet[2,2]:=50; pet[2,3]:=1; pet[2,4]:=0;pet[1,5]:=200;
  monster_name[1]:='Муха';monster[1,1]:=100;monster[1,2]:=15;monster[1,3]:=1; monster[1,4]:=0; monster[1,5]:=200;
  monster_name[2]:='Жук-кораед';monster[2,1]:=120;monster[2,2]:=17;monster[2,3]:=1; monster[2,4]:=0; monster[2,5]:=200;
  monster_name[3]:='Дождевой-червяк';monster[3,1]:=110;monster[3,2]:=20;monster[3,3]:=1; monster[3,4]:=0; monster[3,5]:=200;
  monster_name[4]:='Гусеница';monster[4,1]:=140;monster[4,2]:=18;monster[4,3]:=1; monster[4,4]:=0; monster[4,5]:=200;
  monster_name[5]:='Паучек';monster[5,1]:=200;monster[5,2]:=30;monster[5,3]:=1; monster[5,4]:=0; monster[5,5]:=200;
  monster_name[6]:='Крыса';monster[6,1]:=300;monster[6,2]:=20;monster[6,3]:=2; monster[6,4]:=0; monster[6,5]:=500;
  monster_name[7]:='Белка';monster[7,1]:=200;monster[7,2]:=32;monster[7,3]:=2; monster[7,4]:=0; monster[7,5]:=500;
  monster_name[8]:='Ёжик';monster[8,1]:=200;monster[8,2]:=24;monster[8,3]:=2; monster[8,4]:=0; monster[8,5]:=500;
  monster_name[9]:='Кабан';monster[9,1]:=500;monster[9,2]:=41;monster[9,3]:=3; monster[9,4]:=0; monster[9,5]:=750;
  monster_name[10]:='Обезьяна';monster[10,1]:=625;monster[10,2]:=50;monster[10,3]:=4; monster[10,4]:=0; monster[10,5]:=1000;
  writeln ('Добро пожаловать и мини-игру "Битва Паскаля", введите "старт" чтобы начать');
  readln (start); i:=1; i2:=1;
  if (start = 'старт') then
    begin
      writeln ('у вас есть один ',pet_name[1],' и ',pet_name[2],' а против вас сражается ',monster_name[1]); xp:=100; os:=2; coin:=10;
      while (game <> 1) do
      begin
        dam:=0; a:=1; b:=0; hp:=pet[i,1]; hp2:=monster[i2,1]; full_xp:=0; fight:=0;
        
        writeln('Введите "выбор", чтобы выбрать существо или "бой", чтобы начать сражение');
        readln (f);
        if (f='выбор') then 
        begin
          writeln ('Введите имя существа кем вы хотите сражаться');
          writeln ('Список ваших существ: ',pet_name);
          readln (f);
          for i3:=1 to 10 do if (pet_name[i3]=f) then begin i:=i3; writeln ('Вы выбрали: ',pet_name[i3]); end;
        end;
        if (f='бой') then begin
        while (fight<>1) do
        begin
          if (dam=1) then begin 
                            if (a mod 2<>0) then begin damage:=pet[i,2]+random(10); monster[i2,1]:=monster[i2,1]-damage; end
                                            else begin damage:=monster[i2,2]+random(10); pet[i,1]:=pet[i,1]-damage; end; 
                            if (monster[i2,1]<=0) then begin b:=1; monster[i2,1]:=0;  end;
                            if (pet[i,1]<=0) then begin b:=2; pet[i,1]:=0;  end;
                          end; writeln;
          writeln ('||||||||',monster_name[i2],'||||||||||||||||');
          writeln ('||||||||жизни: ',monster[i2,1],'||||||||урон: ',monster[i2,2],'||||||||',' lvl:',monster[i2,3]);
          writeln;writeln;if (dam=0) then begin writeln('  нажмите ENTER чтобы нанести урон'); writeln ('  или напишите "приручить" чтобы попробовать приручить существо'); end;
                          if (dam=1) then begin if (b=0) then if (a mod 2<>0) then begin writeln('        Вы нанесли ',damage,' урона'); end
                                                                              else begin writeln('        Вам нанесли ',damage,' урона'); end;
                                                if (b=1) then begin pet[i,1]:=hp; full_xp:=xp+random(10); pet[i,4]:=pet[i,4]+full_xp; i2:=i2+1; writeln ('        Вы ПОБЕДИЛИ'); writeln ('    и получили +',full_xp,' к опыту');
                                                if (pet[i,4]>=pet[i,5]) then begin pet[i,3]:=pet[i,3]+1; pet[i,4]:=0; pet[i,5]:=pet[i,5]+250; 
                                                           writeln ('        Вы получили новый УРОВЕНЬ!'); writeln ('      Ваш уровень: ',pet[i,3]); writeln ('Вы получили +5 монет'); coin:=coin+5; writeln ('Теперь у вас ',coin,' монет'); end
                                                else begin writeln ('До уровня: ',pet[i,3]+1,' вам осталось ',pet[i,4],'/',pet[i,5]); fight:=1; end; end;
                                                if (b=2) then begin writeln ('        Вы ПРОИГРАЛИ'); writeln ('Ваше существо ',pet_name[i],' успешно умерло, МОЛОДЕЦ!, теперь выбери другое существо и продолжай сражаться');
                                                                    fight:=1; pet_name[i]:=pet_name[i]+'-Призрак'; pet[1,1]:=0; pet[1,2]:=0; end; end;
          writeln;writeln;writeln;
          writeln ('||||||||',pet_name[i],'||||||||||||||||');
          writeln ('||||||||жизни: ',pet[i,1],'||||||||урон: ',pet[i,2],'||||||||',' lvl:',pet[i,3]);
          readln (sl); a:=a+1; dam:=1;
          if (sl='приручить') then begin if (coin>=10) then begin writeln ('Попытка приручения этого сущетсва стоит 10 монет'); writeln ('У вас есть ',coin,' монет'); writeln; writeln ('Нажмите ENTER, чтобы попробовать приручить');
                                                                  readln; coin:=coin-10; p:=random(3); if (p=2) then begin writeln ('Вы успешно приручили это существо! Поздравляем'); fight:=1; os:=os+1;
                                                                                                                           pet_name[os]:=monster_name[i2]; pet[os,1]:=hp2; pet[os,2]:=monster[i2,2]; pet[os,3]:=monster[i2,3]; pet[os,4]:=monster[i2,4]; pet[os,5]:=monster[i2,5]; i2:=i2+1; end
                                                                                                 else begin writeln ('Вам не удалось приручить это существо!'); readln; end; end
                                                       else begin writeln ('У вас недостаточно монет для приручения, получить монеты можно при повышении уровня своего персоонажа!'); readln; end; end;
        end;
        end;
        if (i2>10) then game:=1;
      end;
      writeln ('Вы прошли игру!'); readln;
    end
    else
    writeln ('Досвиданья');
end.