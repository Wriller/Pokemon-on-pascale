program battle_of_pascal;
var a,b,c,game,i,i1,i2,dam,damage,fight,hp,xp,full_xp,i3,coin,hp2,p,os:integer;
    sl,start,f:string;
    monster:array [1..10,1..10] of integer;
    monster_name:array [1..10] of string;
    pet:array [1..12,1..12] of integer; //1-�����;2-����;3-�������;4-����;5-���������_����_�����_���_����_������;
    pet_name:array [1..12] of string;
begin
  pet_name[1]:='�������'; pet[1,1]:=150; pet[1,2]:=30; pet[1,3]:=1; pet[1,4]:=0;pet[1,5]:=200;
  pet_name[2]:='�������'; pet[2,1]:=120; pet[2,2]:=50; pet[2,3]:=1; pet[2,4]:=0;pet[1,5]:=200;
  monster_name[1]:='����';monster[1,1]:=100;monster[1,2]:=15;monster[1,3]:=1; monster[1,4]:=0; monster[1,5]:=200;
  monster_name[2]:='���-������';monster[2,1]:=120;monster[2,2]:=17;monster[2,3]:=1; monster[2,4]:=0; monster[2,5]:=200;
  monster_name[3]:='��������-������';monster[3,1]:=110;monster[3,2]:=20;monster[3,3]:=1; monster[3,4]:=0; monster[3,5]:=200;
  monster_name[4]:='��������';monster[4,1]:=140;monster[4,2]:=18;monster[4,3]:=1; monster[4,4]:=0; monster[4,5]:=200;
  monster_name[5]:='������';monster[5,1]:=200;monster[5,2]:=30;monster[5,3]:=1; monster[5,4]:=0; monster[5,5]:=200;
  monster_name[6]:='�����';monster[6,1]:=300;monster[6,2]:=20;monster[6,3]:=2; monster[6,4]:=0; monster[6,5]:=500;
  monster_name[7]:='�����';monster[7,1]:=200;monster[7,2]:=32;monster[7,3]:=2; monster[7,4]:=0; monster[7,5]:=500;
  monster_name[8]:='����';monster[8,1]:=200;monster[8,2]:=24;monster[8,3]:=2; monster[8,4]:=0; monster[8,5]:=500;
  monster_name[9]:='�����';monster[9,1]:=500;monster[9,2]:=41;monster[9,3]:=3; monster[9,4]:=0; monster[9,5]:=750;
  monster_name[10]:='��������';monster[10,1]:=625;monster[10,2]:=50;monster[10,3]:=4; monster[10,4]:=0; monster[10,5]:=1000;
  writeln ('����� ���������� � ����-���� "����� �������", ������� "�����" ����� ������');
  readln (start); i:=1; i2:=1;
  if (start = '�����') then
    begin
      writeln ('� ��� ���� ���� ',pet_name[1],' � ',pet_name[2],' � ������ ��� ��������� ',monster_name[1]); xp:=100; os:=2; coin:=10;
      while (game <> 1) do
      begin
        dam:=0; a:=1; b:=0; hp:=pet[i,1]; hp2:=monster[i2,1]; full_xp:=0; fight:=0;
        
        writeln('������� "�����", ����� ������� �������� ��� "���", ����� ������ ��������');
        readln (f);
        if (f='�����') then 
        begin
          writeln ('������� ��� �������� ��� �� ������ ���������');
          writeln ('������ ����� �������: ',pet_name);
          readln (f);
          for i3:=1 to 10 do if (pet_name[i3]=f) then begin i:=i3; writeln ('�� �������: ',pet_name[i3]); end;
        end;
        if (f='���') then begin
        while (fight<>1) do
        begin
          if (dam=1) then begin 
                            if (a mod 2<>0) then begin damage:=pet[i,2]+random(10); monster[i2,1]:=monster[i2,1]-damage; end
                                            else begin damage:=monster[i2,2]+random(10); pet[i,1]:=pet[i,1]-damage; end; 
                            if (monster[i2,1]<=0) then begin b:=1; monster[i2,1]:=0;  end;
                            if (pet[i,1]<=0) then begin b:=2; pet[i,1]:=0;  end;
                          end; writeln;
          writeln ('||||||||',monster_name[i2],'||||||||||||||||');
          writeln ('||||||||�����: ',monster[i2,1],'||||||||����: ',monster[i2,2],'||||||||',' lvl:',monster[i2,3]);
          writeln;writeln;if (dam=0) then begin writeln('  ������� ENTER ����� ������� ����'); writeln ('  ��� �������� "���������" ����� ����������� ��������� ��������'); end;
                          if (dam=1) then begin if (b=0) then if (a mod 2<>0) then begin writeln('        �� ������� ',damage,' �����'); end
                                                                              else begin writeln('        ��� ������� ',damage,' �����'); end;
                                                if (b=1) then begin pet[i,1]:=hp; full_xp:=xp+random(10); pet[i,4]:=pet[i,4]+full_xp; i2:=i2+1; writeln ('        �� ��������'); writeln ('    � �������� +',full_xp,' � �����');
                                                if (pet[i,4]>=pet[i,5]) then begin pet[i,3]:=pet[i,3]+1; pet[i,4]:=0; pet[i,5]:=pet[i,5]+250; 
                                                           writeln ('        �� �������� ����� �������!'); writeln ('      ��� �������: ',pet[i,3]); writeln ('�� �������� +5 �����'); coin:=coin+5; writeln ('������ � ��� ',coin,' �����'); end
                                                else begin writeln ('�� ������: ',pet[i,3]+1,' ��� �������� ',pet[i,4],'/',pet[i,5]); fight:=1; end; end;
                                                if (b=2) then begin writeln ('        �� ���������'); writeln ('���� �������� ',pet_name[i],' ������� ������, �������!, ������ ������ ������ �������� � ��������� ���������');
                                                                    fight:=1; pet_name[i]:=pet_name[i]+'-�������'; pet[1,1]:=0; pet[1,2]:=0; end; end;
          writeln;writeln;writeln;
          writeln ('||||||||',pet_name[i],'||||||||||||||||');
          writeln ('||||||||�����: ',pet[i,1],'||||||||����: ',pet[i,2],'||||||||',' lvl:',pet[i,3]);
          readln (sl); a:=a+1; dam:=1;
          if (sl='���������') then begin if (coin>=10) then begin writeln ('������� ���������� ����� �������� ����� 10 �����'); writeln ('� ��� ���� ',coin,' �����'); writeln; writeln ('������� ENTER, ����� ����������� ���������');
                                                                  readln; coin:=coin-10; p:=random(3); if (p=2) then begin writeln ('�� ������� ��������� ��� ��������! �����������'); fight:=1; os:=os+1;
                                                                                                                           pet_name[os]:=monster_name[i2]; pet[os,1]:=hp2; pet[os,2]:=monster[i2,2]; pet[os,3]:=monster[i2,3]; pet[os,4]:=monster[i2,4]; pet[os,5]:=monster[i2,5]; i2:=i2+1; end
                                                                                                 else begin writeln ('��� �� ������� ��������� ��� ��������!'); readln; end; end
                                                       else begin writeln ('� ��� ������������ ����� ��� ����������, �������� ������ ����� ��� ��������� ������ ������ ����������!'); readln; end; end;
        end;
        end;
        if (i2>10) then game:=1;
      end;
      writeln ('�� ������ ����!'); readln;
    end
    else
    writeln ('����������');
end.