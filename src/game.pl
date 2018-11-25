weapon(['shotgun','pistol']).
ammo(['pelurushotgun','pelurupistol']).
medicine(['tolakangin','madurasa']).
armor(['nametag','ponco']).

:- dynamic(player/7).
% player(Absis,Ordinat,health,armor,weapon,ammo,inventory)
player(5,5,100,0,'pistol',3,['nametag','madurasa']).

:- dynamic(peta/1).
peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],
['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],
['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],
['X',-,-,-,-,-,-,-,-,-,-,'X'],
['X','X','X','X','X','X','X','X','X','X','X','X']]).

:- dynamic(count_move/1). %untuk menghitung banyak move yang telah dilakukan
count_move(0).

:- dynamic(status_permainan/1).
status_permainan(on).

:- dynamic(count_enemy/1).
count_enemy(10).

:- dynamic(enemy/5).
enemy(1,2,2,pistol,1).
enemy(2,3,3,pistol,1).
enemy(3,4,4,pistol,1).
enemy(4,5,5,pistol,1).
enemy(5,6,6,pistol,1).
enemy(6,7,7,shotgun,1).
enemy(7,8,8,shotgun,1).
enemy(8,9,9,shotgun,1).
enemy(9,10,10,shotgun,1).
enemy(10,11,11,shotgun,1).

:- dynamic(ground/8). %untuk deskripsi peta.

%Update ketika health <0 atau musuh sudah mati semua, atau petak pemain sudah menjadi deadzone
update_status_permainan :- player(Absis,Ordinat,Health,_,_,_,_),
                        count_enemy(Enemy),
                        peta(Map), element_matriks(Map,Absis,Ordinat,Petak_Pemain),
                        (Health =< 0 ->
                            retract(status_permainan(X)),
                            asserta(status_permainan(off))
                        ; Enemy = 0 ->
                            retract(status_permainan(X)),
                            asserta(status_permainan(off))
                        ; Petak_Pemain = 'X' ->
                            retract(status_permainan(X)),
                            asserta(status_permainan(off))
                        ; !
                        ).
% print_all_ground :- ground(Absis,Ordinat,Nama,Enemy,Medicine,Weapon,Armor,Ammo),
%                     write(Absis),write(' '),write(Ordinat).

%Mengupdate ground berdasarkan data dari enemy
update_enemy_ground(0) :- write('').
update_enemy_ground(N) :- enemy(N,Absis,Ordinat,Enemy_Weapon,Status_Enemy),
                ground(Absis,Ordinat,Nama,Enemy,Medicine,Weapon,Armor,Ammo),
                gabung(Enemy,[Enemy_Weapon],New_Enemy),
                retract(ground(Absis,Ordinat,Nama,Enemy,Medicine,Weapon,Armor,Ammo)),
                asserta(ground(Absis,Ordinat,Nama,New_Enemy,Medicine,Weapon,Armor,Ammo)),
                NNew is N - 1, update_enemy_ground(NNew),!.

create_player :- random(2,12,Absis), random(2,12,Ordinat),
                retract(player(_,_,_,_,_,_,_)),
                asserta(player(Absis,Ordinat,100,0,none,0,[])).

create_peta :- retract(peta(_)),
                asserta(peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],
                ['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],
                ['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],
                ['X',-,-,-,-,-,-,-,-,-,-,'X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X']])),!.

place_enemy(N) :- random(2,12,Absis), random(2,12,Ordinat),
                (N < 6 ->
                    retract(enemy(N,_,_,_,_)),
                    asserta(enemy(N,Absis,Ordinat,pistol,1))
                ;
                    retract(enemy(N,_,_,_,_)),
                    asserta(enemy(N,Absis,Ordinat,shotgun,1))
                ),!.

create_enemy(0) :- write(''),!.
create_enemy(N) :- place_enemy(N), Nnew is N - 1, create_enemy(Nnew),!.

update_enemy_position(0) :- write('').
update_enemy_position(N) :- enemy(N,Absis,Ordinat,Enemy_Weapon,Status_Enemy), random(1,5,Random), peta(M), element_matriks(M,Absis,Ordinat,CEnemy),
                            (CEnemy \= 'X' ->
                                (Random = 1 -> %musuh keatas
                                    Absis1 is Absis - 1,
                                    element_matriks(M,Absis1,Ordinat,C),
                                    (C \= 'X' ->
                                        %hilangkan enemy di petak absis,ordinat
                                        ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
                                        delete_by_value(Enemy,Enemy_Weapon,New_Enemy),
                                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                                        asserta(ground(Absis,Ordinat,Nama,New_Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                                        %tambahkan enemy di petak tempat dia pindah
                                        ground(Absis1,Ordinat,Nama9,Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9),
                                        gabung(Enemy9,[Enemy_Weapon],New_Enemy9),
                                        retract(ground(Absis1,Ordinat,Nama9,Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9)),
                                        asserta(ground(Absis1,Ordinat,Nama9,New_Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9)),
                                        %updaete enemy
                                        retract(enemy(N,Absis,Ordinat,Enemy_Weapon,Status_Enemy)),
                                        asserta(enemy(N,Absis1,Ordinat,Enemy_Weapon,Status_Enemy))
                                    ;
                                        write('')
                                    )
                                ; Random = 2 -> %musuh ke bawah
                                    Absis1 is Absis + 1,
                                    element_matriks(M,Absis1,Ordinat,C),
                                    (C \= 'X' ->
                                        %hilangkan enemy di petak absis,ordinat
                                        ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
                                        delete_by_value(Enemy,Enemy_Weapon,New_Enemy),
                                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                                        asserta(ground(Absis,Ordinat,Nama,New_Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                                        %tambahkan enemy di petak tempat dia pindah
                                        ground(Absis1,Ordinat,Nama9,Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9),
                                        gabung(Enemy9,[Enemy_Weapon],New_Enemy9),
                                        retract(ground(Absis1,Ordinat,Nama9,Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9)),
                                        asserta(ground(Absis1,Ordinat,Nama9,New_Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9)),
                                        %update enemy
                                        retract(enemy(N,Absis,Ordinat,Enemy_Weapon,Status_Enemy)),
                                        asserta(enemy(N,Absis1,Ordinat,Enemy_Weapon,Status_Enemy))
                                    ;
                                        write('')
                                    )
                                ; Random = 3 -> %musuh ke kiri
                                    Ordinat1 is Ordinat - 1,
                                    element_matriks(M,Absis,Ordinat1,C),
                                    (C \= 'X' ->
                                        %hilangkan enemy di petak absis,ordinat
                                        ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
                                        delete_by_value(Enemy,Enemy_Weapon,New_Enemy),
                                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                                        asserta(ground(Absis,Ordinat,Nama,New_Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                                        %tambahkan enemy di petak tempat dia pindah
                                        ground(Absis,Ordinat1,Nama9,Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9),
                                        gabung(Enemy9,[Enemy_Weapon],New_Enemy9),
                                        retract(ground(Absis,Ordinat1,Nama9,Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9)),
                                        asserta(ground(Absis,Ordinat1,Nama9,New_Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9)),
                                        %update enemy
                                        retract(enemy(N,Absis,Ordinat,Enemy_Weapon,Status_Enemy)),
                                        asserta(enemy(N,Absis,Ordinat1,Enemy_Weapon,Status_Enemy))
                                    ;
                                        write('')
                                    )
                                ; Random = 4 ->
                                    Ordinat1 is Ordinat + 1,
                                    element_matriks(M,Absis,Ordinat1,C),
                                    (C \= 'X' ->
                                        %hilangkan enemy di petak absis,ordinat
                                        ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
                                        delete_by_value(Enemy,Enemy_Weapon,New_Enemy),
                                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                                        asserta(ground(Absis,Ordinat,Nama,New_Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                                        %tambahkan enemy di petak tempat dia pindah
                                        ground(Absis,Ordinat1,Nama9,Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9),
                                        gabung(Enemy9,[Enemy_Weapon],New_Enemy9),
                                        retract(ground(Absis,Ordinat1,Nama9,Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9)),
                                        asserta(ground(Absis,Ordinat1,Nama9,New_Enemy9,Medicine_ground9,Weapon_ground9,Armor_ground9,Ammo_ground9)),
                                        %update enemy
                                        retract(enemy(N,Absis,Ordinat,Enemy_Weapon,Status_Enemy)),
                                        asserta(enemy(N,Absis,Ordinat1,Enemy_Weapon,Status_Enemy))
                                    ;
                                        write('')
                                    )
                                )
                            ;
                                write('')
                            ), Nnew is N - 1, update_enemy_position(Nnew),!.

create_item(_,0) :- write('').
create_item(X,N) :- random(2,12,Absis), random(2,12,Ordinat), ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
                        weapon(Weapon), ammo(Ammo), medicine(Medicine), armor(Armor),
                        (is_member(X,Weapon) ->
                            gabung(Weapon_ground,[X],New_Weapon_ground),
                            retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                            asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,New_Weapon_ground,Armor_ground,Ammo_ground))
                        ; is_member(X,Ammo) ->
                            gabung(Ammo_ground,[X],New_Ammo_ground),
                            retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                            asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,New_Ammo_ground))
                        ; is_member(X,Medicine) ->
                            gabung(Medicine_ground,[X],New_Medicine_ground),
                            retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                            asserta(ground(Absis,Ordinat,Nama,Enemy,New_Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground))
                        ; is_member(X,Armor) ->
                            gabung(Armor_ground,[X],New_Armor_ground),
                            retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                            asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,New_Armor_ground,Ammo_ground))
                        ), Nnew is N - 1, create_item(X,Nnew),!.

delete_prev_ground_sebaris(_,1) :- write('').
delete_prev_ground_sebaris(M,N) :- retract(ground(M,N,_,_,_,_,_,_)), Nnew is N - 1, delete_prev_ground_sebaris(M,Nnew).

delete_prev_ground(1,_) :- write('').
delete_prev_ground(M,N) :- delete_prev_ground_sebaris(M,N), Mnew is M - 1, delete_prev_ground(Mnew,N).

create_ground(Absis,Ordinat) :-
                        (Absis < 5, Ordinat < 5 -> %Distrik1
                            Nama = 'ITB'
                        ; Absis < 5, Ordinat > 4, Ordinat < 8 -> %Distrik2
                            Nama = 'UI'
                        ; Absis < 6, Ordinat > 7, Ordinat < 12 -> %Distrik3
                            Nama = 'UGM'
                        ; Absis > 4, Absis < 8, Ordinat < 5 -> %Distrik4
                            Nama = 'Unpad'
                        ; Absis > 4, Absis < 8, Ordinat > 4, Ordinat < 8 -> %Distrik5
                            Nama = 'Binus'
                        ; Absis > 5, Absis < 10, Ordinat > 7, Ordinat < 12 -> %Distrik6
                            Nama = 'Unpar'
                        ; Absis > 7, Absis < 12, Ordinat < 5 -> %Distrik7
                            Nama = 'Unikom'
                        ; Absis > 7, Absis < 12, Ordinat > 4, Ordinat < 8 -> %Distrik 8
                            Nama = 'ITHB'
                        ; Absis  > 9, Absis < 12, Ordinat > 7, Ordinat < 12 -> %Distrik 9
                            Nama = 'Binus'
                        ),
                        asserta(ground(Absis,Ordinat,Nama,[],[],[],[],[])).

create_ground_baris(_,1) :- write('').
create_ground_baris(M,N) :- create_ground(M,N), Nnew is N - 1, create_ground_baris(M,Nnew).

create_new_ground(1,_) :- write('').
create_new_ground(M,N) :- create_ground_baris(M,N), Mnew is M -1, create_new_ground(Mnew,N),!.

create_game_ground :- delete_prev_ground(11,11), create_new_ground(11,11),!.

update_count_enemy(0) :- write('').
update_count_enemy(N) :- enemy(N,Absis,Ordinat,Enemy_Weapon,Status_Enemy), peta(M), element_matriks(M,Absis,Ordinat,C), count_enemy(N_enemy),
                        (Status_Enemy = 1, C = 'X' ->
                            New_N_enemy is N_enemy - 1,
                            retract(count_enemy(N_enemy)), asserta(count_enemy(New_N_enemy)),
                            retract(enemy(N,Absis,Ordinat,Enemy_Weapon,Status_Enemy)), asserta(enemy(N,Absis,Ordinat,Enemy_Weapon,0))
                        ;
                            write('')
                        ), Nnew is N - 1, update_count_enemy(Nnew),!.

%Memulai permainan dan akan menerima fakta-fakta fresh yang tidak bergantung pada permainan sebelumnya
start :- write('Welcome to the battlefield!\n'),
    write('You have been chosen as one of the lucky contestants.\n'),
    write('Be the last man standing and you will be remembered as one of the victors.'),
    write('\n\nAvailable commands :\n\n'),
    write('start. -- Memulai permainan'),
    help,
    write('\n\nLegends:\n\n'),
    write('W = weapon\n'),
    write('A = armor\n'),
    write('M = medicine\n'),
    write('O = ammo\n'),
    write('P = player\n'),
    write('E = enemy\n'),
    write('- = accessible\n'),
    write('X = inaccessible\n'),
    retract(status_permainan(_)),
    asserta(status_permainan(on)),
    create_new_ground(11,11),
    create_peta,
    create_game_ground,
    create_player,
    create_enemy(10),
    create_item(pistol,10),
    create_item(shotgun,10),
    create_item(pelurupistol,10),
    create_item(pelurushotgun,10),
    create_item(madurasa,10),
    create_item(tolakangin,10),
    create_item(nametag,10),
    create_item(ponco,10),
    retract(count_move(_)),
    asserta(count_move(0)),
    retract(count_enemy(_)),
    asserta(count_enemy(10)),
    update_enemy_ground(10).

%Menampilkan daftar perintah yang dapat ditampilkan, jika status permainan off maka
%yang ditampilkan hanya menu yang bisa dijalankan saat sudah keluar permainan
help :-     write('\nquit. -- Keluar dari permainan\n'),
            write('look. -- Melihat keadaan petak sekitar\n'),
            write('n,s,e,w. -- Untuk berjalan kearah utara, selatan, timur, dan barat\n'),
            write('tampilpeta. -- Menampilkan peta wilayah permainan\n'),
            write('take(Object). -- Mengambil sebuah object\n'),
            write('drop(Object). -- Menjatuhkan sebuah object\n'),
            write('use(Object). -- Menggunakan sebuah object\n'),
            write('attack. -- Menyerang musuh yang terdapat di petak yang sama\n'),
            write('status. -- Menampilkan status permainan\n'),
            write('save(Filename). -- Save permainan\n'),
            write('load(Filename). -- Load permainan sebelumnya\n').

%Ketika quit maka status permainan menjadi off, sehingga tidak dapat menjalankan beberapa command penting
quit :- update_status_permainan, status_permainan(Status),
        (Status = on ->
            retract(status_permainan(_)),
            asserta(status_permainan(off))
        ; !,
            write("Anda sudah keluar dari permainan")
        ).

%Menampilkan status pemain
status :- player(_,_,Health,Armor,Weapon,Ammo,Inventory), nl,
            write('Health : '), write(Health), nl,
            write('Armor : '), write(Armor), nl,
            write('Weapon : '), write(Weapon), nl,
            write('Ammo : '), write(Ammo), nl,
            write('Inventory : \n'),
            (Inventory = [] ->
                write('Inventory Anda kosong')
            ; !,
                printlistnewline(Inventory)
            ).

%Daftar operasi pada list

% menampilkan list dalam satu baris
printlist([]) :- write('').
printlist([H|T]) :- write(H), write(' '), printlist(T).

%menampilkan list dengan newline (untuk menampilkan inventory)
printlistnewline([]) :- write('').
printlistnewline([H|T]) :- tab(4),write(H),nl,printlistnewline(T).

%mengecek apakah nilai A berada pada sebuah list
is_member(A,[A|_]).
is_member(A,[B|T]) :- A \== B, is_member(A,T).

% menghitung banyaknya anggota list
panjang([],0).
panjang([_|T],X) :- panjang(T,X1), X is X1 + 1.

%menggabung dua buah list jadi satu
gabung([],X,X) :- !.
gabung([A|B],C,[A|D]) :- gabung(B,C,D).

%mengakses anggota ke n dari sebuah list
nthelement([H|_],1,H).
nthelement([_|T],N,X) :- Nnew is N - 1, nthelement(T,Nnew,X).

first_element([H|_],H).

delete_first([_|T],T).

delete_by_value([H|T],H,T).
delete_by_value([H|T],X,Y) :- H \= X, delete_by_value(T,X,Ynew), gabung([H],Ynew,Y).

%mengganti element ke -n dari sebuah list dengan S
ganti(X,0,_,X).
ganti([_|T],1,S,Y) :- gabung([S],Ynew,Y), ganti(T,0,S,Ynew).
ganti([H|T],N,S,Y) :-  Nnew is N - 1, gabung([H],Ynew,Y), ganti(T,Nnew,S,Ynew).

%mengakses element matriks pada indeks (M,N)
element_matriks(X,M,N,Y) :- nthelement(X,M,X1), nthelement(X1,N,Y).

%mengganti element matriks pada indeks (M,N)
gantiListofList(X,M,N,S,Y) :- nthelement(X,M,X1), ganti(X1,N,S,X2), ganti(X,M,X2,Y).

%mengupdate peta sesuai dengan koordinat dari pemain saat ini
updatepeta :- kecilkanpeta, peta(X),player(Absis,Ordinat,_,_,_,_,_),
            element_matriks(X,Absis,Ordinat,C),
            (C \= 'X' ->
                gantiListofList(X,Absis,Ordinat,'P',Y),!,
                retract(peta(X)),
                asserta(peta(Y))
            ; !,
                update_status_permainan
            ).

%mengecilkan peta karena daerah disekeliling jadi tidak accessible
kecilkanpeta :- count_move(R),
            (R > 9, R < 20 -> !,
                retract(peta(M)),
                asserta(peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X',-,-,-,-,-,-,-,-,'X','X'],['X','X',-,-,-,-,-,-,-,-,'X','X'],
                ['X','X',-,-,-,-,-,-,-,-,'X','X'],['X','X',-,-,-,-,-,-,-,-,'X','X'],
                ['X','X',-,-,-,-,-,-,-,-,'X','X'],['X','X',-,-,-,-,-,-,-,-,'X','X'],
                ['X','X',-,-,-,-,-,-,-,-,'X','X'],['X','X',-,-,-,-,-,-,-,-,'X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X']])),
                update_count_enemy(10), count_enemy(N_enemy),
                (N_enemy = 0 ->
                        write('SELAMAT ANDA MENANG'),
                        update_status_permainan
                ;
                    write('')
                )

            ; R > 19, R < 30 -> !,
                retract(peta(M)),
                asserta(peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X',-,-,-,-,-,-,'X','X','X'],['X','X','X',-,-,-,-,-,-,'X','X','X'],
                ['X','X','X',-,-,-,-,-,-,'X','X','X'],['X','X','X',-,-,-,-,-,-,'X','X','X'],
                ['X','X','X',-,-,-,-,-,-,'X','X','X'],['X','X','X',-,-,-,-,-,-,'X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X']])),
                update_count_enemy(10),count_enemy(N_enemy),
                (N_enemy = 0 ->
                        write('SELAMAT ANDA MENANG'),
                        update_status_permainan
                ;
                    write('')
                )
            ; R > 29, R < 40 -> !,
                retract(peta(M)),
                asserta(peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X',-,-,-,-,'X','X','X','X'],['X','X','X','X',-,-,-,-,'X','X','X','X'],
                ['X','X','X','X',-,-,-,-,'X','X','X','X'],['X','X','X','X',-,-,-,-,'X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X']])),
                update_count_enemy(10),count_enemy(N_enemy),
                (N_enemy = 0 ->
                        write('SELAMAT ANDA MENANG'),
                        update_status_permainan
                ;
                    write('')
                )
            ; R > 39, R < 50 -> !,
                retract(peta(M)),
                asserta(peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X',-,-,'X','X','X','X','X'],
                ['X','X','X','X','X',-,-,'X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X']])),
                update_count_enemy(10),count_enemy(N_enemy),
                (N_enemy = 0 ->
                        write('SELAMAT ANDA MENANG'),
                        update_status_permainan
                ;
                    write('')
                )
            ; R > 49 -> !,
                retract(peta(M)),
                asserta(peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X']])),
                update_count_enemy(10),count_enemy(N_enemy),
                (N_enemy = 0 ->
                        write('SELAMAT ANDA MENANG'),
                        update_status_permainan
                ;
                    write('')
                )
            ;
                write('')
            ).

%untuk menampilkan peta
printpeta([]) :- write('').
printpeta([H|T]) :- printlist(H),nl, printpeta(T).

tampilpeta :- updatepeta, peta(X),printpeta(X),!.

%Melihat apa yang ada pada peta pada absis dan koordinat tertentu dengan prioritas
%Enemy > Medicine > Weapon > Armor > Ammo > Absis > Player
look_koordinat(Absis,Ordinat,Char) :-
    peta(M), element_matriks(M,Absis,Ordinat,C),
    (C = 'X' ->
        Char = 'X'
    ;
        ground(Absis,Ordinat,_,Enemy,Medicine,Weapon,Armor,Ammo),
        player(AbsisP,OrdinatP,_,_,_,_,_),
        (Enemy \= [] ->
            Char = 'E'
        ; Medicine \= [] ->
            Char = 'M'
        ; Weapon \= [] ->
            Char = 'W'
        ; Armor \= [] ->
            Char = 'A'
        ; Ammo \= [] ->
            Char = 'T'
        ; Absis = AbsisP, Ordinat = OrdinatP ->
            Char = 'P'
        ;
            Char = '_'
        )
    ).

look :- update_status_permainan, status_permainan(Status),
        (Status = on ->
            player(Absis,Ordinat,_,_,_,_,_),
            ground(Absis,Ordinat,Nama,Enemy,Medicine,Weapon,Armor,Ammo),
            Absis1 is Absis - 1, Absis2 is Absis + 1, Ordinat1 is Ordinat - 1, Ordinat2 is Ordinat + 1,
            look_koordinat(Absis1,Ordinat1,C1),look_koordinat(Absis1,Ordinat,C2),look_koordinat(Absis1,Ordinat2,C3),!,
            look_koordinat(Absis,Ordinat1,C4),look_koordinat(Absis,Ordinat,C5),look_koordinat(Absis,Ordinat2,C6),!,
            look_koordinat(Absis2,Ordinat1,C7),look_koordinat(Absis2,Ordinat,C8),look_koordinat(Absis2,Ordinat2,C9),!,
            write('Anda berada di'),write(Nama),nl, write('Di petak Anda sekarang :\n'),
            (Enemy \= [] ->
                panjang(Enemy,NBelmt_Enemy),
                write('\tAda '), write(NBelmt_Enemy), write(' musuh'),nl
            ; !,
                write('')
            ),
            (Medicine \= [] ->
                write('\tAda '), printlist(Medicine),nl
            ; !,
                write('')
            ),
            (Weapon \= [] ->
                write('\tAda '), printlist(Weapon),nl
            ; !,
                write('')
            ),
            (Armor \= [] ->
                write('\tAda '), printlist(Armor),nl
            ; !,
                write('')
            ),
            (Ammo \= [] ->
                write('\tAda '), printlist(Ammo),nl
            ; !,
                write('')
            ), nl, write('Berikut ini kondisi lingkungan di sekitar Anda\n'),
            write(C1),write(' '),write(C2),write(' '),write(C3),nl,
            write(C4),write(' '),write(C5),write(' '),write(C6),nl,
            write(C7),write(' '),write(C8),write(' '),write(C9)
        ; !,
            write('Anda telah keluar permainan atau telah kalah')
        ).


%operasi untuk user bergerak
n :- update_status_permainan, status_permainan(Status),
    (Status = on ->
        player(X,Y,_,_,_,_,_),
        X1 is X - 1,
        peta(M),
        element_matriks(M,X1,Y,N),
        (N \= 'X' -> !,
            gantiListofList(M,X,Y,-,Mnew),!,
            retract(peta(M)),
            asserta(peta(Mnew)),
            retract(player(X,Y,A,B,C,D,E)),
            asserta(player(X1,Y,A,B,C,D,E)),
            retract(count_move(Z)),
            Znew is Z + 1,
            asserta(count_move(Znew)),
            player(Xnew,Ynew,_,_,_,_,_),
            ground(Xnew,Ynew,Nama_tempat,_,_,_,_,_),
            Xnew1 is Xnew -1, Xnew2 is Xnew + 1,
            Ynew1 is Ynew -1, Ynew2 is Ynew + 1,
            peta(Mnew), element_matriks(Mnew,Xnew1,Ynew,Utara),
            element_matriks(Mnew,Xnew2,Ynew,Selatan),
            element_matriks(Mnew,Xnew,Ynew1,Barat),
            element_matriks(Mnew,Xnew,Ynew2,Timur),
            write('Anda berada di'),write(Nama_tempat),nl,
            (Utara = 'X' ->
                write('Di utara adalah tempat mati.\n')
            ; !,
                ground(Xnew1,Ynew,Nama_tempat_utara,_,_,_,_,_),
                write('Di utara adalah '),
                write(Nama_tempat_utara),nl
            ),
            (Barat = 'X' ->
                write('Di barat adalah tempat mati.\n')
            ; !,
                ground(Xnew,Ynew1,Nama_tempat_barat,_,_,_,_,_),
                write('Di barat adalah '),
                write(Nama_tempat_barat),nl
            ),
            (Timur = 'X' ->
                write('Di timur adalah tempat mati.\n')
            ;!,
                ground(Xnew,Ynew2,Nama_tempat_timur,_,_,_,_,_),
                write('Di timur adalah '),
                write(Nama_tempat_timur),nl
            ),
            (Selatan = 'X' ->
                write('Di selatan adalah tempat mati.\n')
            ;!,
                ground(Xnew2,Ynew,Nama_tempat_selatan,_,_,_,_,_),
                write('Di selatan adalah '),
                write(Nama_tempat_selatan),nl
            ) , update_enemy_position(10),updatepeta,!
        ; !,
            write('Wilayah tersebut tidak dapat dikunjungi.\n'),
            update_enemy_position(10),!
        )
    ; !,
        write('Anda sudah kalah atau sudah keluar dari permainan\n'),
        fail
    ).

e :- update_status_permainan, status_permainan(Status),
    (Status = on ->
        player(X,Y,_,_,_,_,_),
        Y1 is Y + 1,
        peta(M),
        element_matriks(M,X,Y1,N),
        (N \= 'X' -> !,
            gantiListofList(M,X,Y,-,Mnew),!,
            retract(peta(M)),
            asserta(peta(Mnew)),
            retract(player(X,Y,A,B,C,D,E)),
            asserta(player(X,Y1,A,B,C,D,E)),
            retract(count_move(Z)),
            Znew is Z + 1,
            asserta(count_move(Znew)),
            player(Xnew,Ynew,_,_,_,_,_),
            ground(Xnew,Ynew,Nama_tempat,_,_,_,_,_),
            Xnew1 is Xnew -1, Xnew2 is Xnew + 1,
            Ynew1 is Ynew -1, Ynew2 is Ynew + 1,
            peta(Mnew), element_matriks(Mnew,Xnew1,Ynew,Utara),
            element_matriks(Mnew,Xnew2,Ynew,Selatan),
            element_matriks(Mnew,Xnew,Ynew1,Barat),
            element_matriks(Mnew,Xnew,Ynew2,Timur),
            write('Anda berada di'),write(Nama_tempat),nl,
            (Utara = 'X' ->
                write('Di utara adalah tempat mati.\n')
            ; !,
                ground(Xnew1,Ynew,Nama_tempat_utara,_,_,_,_,_),
                write('Di utara adalah '),
                write(Nama_tempat_utara),nl
            ),
            (Barat = 'X' ->
                write('Di barat adalah tempat mati.\n')
            ; !,
                ground(Xnew,Ynew1,Nama_tempat_barat,_,_,_,_,_),
                write('Di barat adalah '),
                write(Nama_tempat_barat),nl
            ),
            (Timur = 'X' ->
                write('Di timur adalah tempat mati.\n')
            ;!,
                ground(Xnew,Ynew2,Nama_tempat_timur,_,_,_,_,_),
                write('Di timur adalah '),
                write(Nama_tempat_timur),nl
            ),
            (Selatan = 'X' ->
                write('Di selatan adalah tempat mati.\n')
            ;!,
                ground(Xnew2,Ynew,Nama_tempat_selatan,_,_,_,_,_),
                write('Di selatan adalah '),
                write(Nama_tempat_selatan),nl
            ), update_enemy_position(10),updatepeta,!
        ; !,
            write('Wilayah tersebut tidak dapat dikunjungi.\n'),
            update_enemy_position(10),!
        )
    ; !,
        write('Anda sudah kalah atau sudah keluar dari permainan\n'),
        fail
    ).

w :- update_status_permainan, status_permainan(Status),
    (Status = on ->
        player(X,Y,_,_,_,_,_),
        Y1 is Y - 1,
        peta(M),
        element_matriks(M,X,Y1,N),
        (N \= 'X' -> !,
            gantiListofList(M,X,Y,-,Mnew),!,
            retract(peta(M)),
            asserta(peta(Mnew)),
            retract(player(X,Y,A,B,C,D,E)),
            asserta(player(X,Y1,A,B,C,D,E)),
            retract(count_move(Z)),
            Znew is Z + 1,
            asserta(count_move(Znew)),
            player(Xnew,Ynew,_,_,_,_,_),
            ground(Xnew,Ynew,Nama_tempat,_,_,_,_,_),
            Xnew1 is Xnew -1, Xnew2 is Xnew + 1,
            Ynew1 is Ynew -1, Ynew2 is Ynew + 1,
            peta(Mnew), element_matriks(Mnew,Xnew1,Ynew,Utara),
            element_matriks(Mnew,Xnew2,Ynew,Selatan),
            element_matriks(Mnew,Xnew,Ynew1,Barat),
            element_matriks(Mnew,Xnew,Ynew2,Timur),
            write('Anda berada di'),write(Nama_tempat),nl,
            (Utara = 'X' ->
                write('Di utara adalah tempat mati.\n')
            ; !,
                ground(Xnew1,Ynew,Nama_tempat_utara,_,_,_,_,_),
                write('Di utara adalah '),
                write(Nama_tempat_utara),nl
            ),
            (Barat = 'X' ->
                write('Di barat adalah tempat mati.\n')
            ; !,
                ground(Xnew,Ynew1,Nama_tempat_barat,_,_,_,_,_),
                write('Di barat adalah '),
                write(Nama_tempat_barat),nl
            ),
            (Timur = 'X' ->
                write('Di timur adalah tempat mati.\n')
            ;!,
                ground(Xnew,Ynew2,Nama_tempat_timur,_,_,_,_,_),
                write('Di timur adalah '),
                write(Nama_tempat_timur),nl
            ),
            (Selatan = 'X' ->
                write('Di selatan adalah tempat mati.\n')
            ;!,
                ground(Xnew2,Ynew,Nama_tempat_selatan,_,_,_,_,_),
                write('Di selatan adalah '),
                write(Nama_tempat_selatan),nl
            ) , update_enemy_position(10),updatepeta,!
        ; !,
            write('Wilayah tersebut tidak dapat dikunjungi.\n'),
            update_enemy_position(10),!
        )
    ; !,
        write('Anda sudah kalah atau sudah keluar dari permainan\n'),
        fail
    ).

s :- update_status_permainan, status_permainan(Status),
    (Status = on ->
        player(X,Y,_,_,_,_,_),
        X1 is X + 1,
        peta(M),
        element_matriks(M,X1,Y,N),
        (N \= 'X' -> !,
            gantiListofList(M,X,Y,-,Mnew),!,
            retract(peta(M)),
            asserta(peta(Mnew)),
            retract(player(X,Y,A,B,C,D,E)),
            asserta(player(X1,Y,A,B,C,D,E)),
            retract(count_move(Z)),
            Znew is Z + 1,
            asserta(count_move(Znew)),
            player(Xnew,Ynew,_,_,_,_,_),
            ground(Xnew,Ynew,Nama_tempat,_,_,_,_,_),
            Xnew1 is Xnew -1, Xnew2 is Xnew + 1,
            Ynew1 is Ynew -1, Ynew2 is Ynew + 1,
            peta(Mnew), element_matriks(Mnew,Xnew1,Ynew,Utara),
            element_matriks(Mnew,Xnew2,Ynew,Selatan),
            element_matriks(Mnew,Xnew,Ynew1,Barat),
            element_matriks(Mnew,Xnew,Ynew2,Timur),
            write('Anda berada di'),write(Nama_tempat),nl,
            (Utara = 'X' ->
                write('Di utara adalah tempat mati.\n')
            ; !,
                ground(Xnew1,Ynew,Nama_tempat_utara,_,_,_,_,_),
                write('Di utara adalah '),
                write(Nama_tempat_utara),nl
            ),
            (Barat = 'X' ->
                write('Di barat adalah tempat mati.\n')
            ; !,
                ground(Xnew,Ynew1,Nama_tempat_barat,_,_,_,_,_),
                write('Di barat adalah '),
                write(Nama_tempat_barat),nl
            ),
            (Timur = 'X' ->
                write('Di timur adalah tempat mati.\n')
            ;!,
                ground(Xnew,Ynew2,Nama_tempat_timur,_,_,_,_,_),
                write('Di timur adalah '),
                write(Nama_tempat_timur),nl
            ),
            (Selatan = 'X' ->
                write('Di selatan adalah tempat mati.\n')
            ;!,
                ground(Xnew2,Ynew,Nama_tempat_selatan,_,_,_,_,_),
                write('Di selatan adalah '),
                write(Nama_tempat_selatan),nl
            ) , update_enemy_position(10), updatepeta,!
        ; !,
            write('Wilayah tersebut tidak dapat dikunjungi.\n'),
            update_enemy_position(10),!
        )
    ; !,
        write('Anda sudah kalah atau sudah keluar dari permainan\n'),
        fail
    ).

take(X) :- update_status_permainan, status_permainan(Status),
            (Status = on ->
                player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
                (is_member(X,Medicine_ground) ->
                    panjang(Inventory,N_Inventory),
                    (N_Inventory < 10 ->
                        gabung(Inventory,[X],New_Inventory),
                        retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                        asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                        delete_by_value(Medicine_ground,X,New_Medicine_ground),!,
                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                        asserta(ground(Absis,Ordinat,Nama,Enemy,New_Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                        write('You take the '), write(X)
                    ; !,
                        write('Inventory Anda sudah penuh\n')
                    )
                ; is_member(X,Weapon_ground) ->
                    panjang(Inventory,N_Inventory),
                    (N_Inventory < 10 ->
                    gabung(Inventory,[X],New_Inventory),
                        retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                        asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                        delete_by_value(Weapon_ground,X,New_Weapon_ground),!,
                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                        asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,New_Weapon_ground,Armor_ground,Ammo_ground)),
                        write('You take the '), write(X)
                    ; !,
                        write('Inventory Anda sudah penuh\n')
                    )
                ; is_member(X,Armor_ground)->
                    panjang(Inventory,N_Inventory),
                    (N_Inventory < 10 ->
                        gabung(Inventory,[X],New_Inventory),
                        retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                        asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                        delete_by_value(Armor_ground,X,New_Armor_ground),!,
                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                        asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,New_Armor_ground,Ammo_ground)),
                        write('You take the '), write(X)
                    ; !,
                        write('Inventory Anda sudah penuh\n')
                    )
                ; is_member(X,Ammo_ground)->
                    panjang(Inventory,N_Inventory),
                    (N_Inventory < 10 ->
                        gabung(Inventory,[X],New_Inventory),
                        retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                        asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                        delete_by_value(Ammo_ground,X,New_Ammo_ground),!,
                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                        asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,New_Ammo_ground)),
                        write('You take the '),write(X)
                    ; !,
                        write('Inventory Anda sudah penuh\n')
                    )
                ; !,
                    write(X), write(' tidak terdapat pada ground\n')
                )
            ; !,
                write('Anda sudah kalah atau keluar dari permainan\n'),
                fail
            ).

%fungsi rekursif untuk drop ammo ke ground
drop_ammo(1,X,Absis,Ordinat) :-
    ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
    gabung(Ammo_ground,[X],New_Ammo_ground),
    retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
    asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,New_Ammo_ground)).
drop_ammo(N,X,Absis,Ordinat) :-
    ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
    gabung(Ammo_ground,[X],New_Ammo_ground),
    retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
    asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,New_Ammo_ground)),
    NNew is N - 1, drop_ammo(NNew,X,Absis,Ordinat).

drop(X) :- update_status_permainan, status_permainan(Status),
            (Status = on ->
                player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
                (is_member(X,Inventory)->!,
                    delete_by_value(Inventory,X,New_Inventory),
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                    weapon(Weapon),
                    ammo(Ammo),
                    medicine(Medicine),
                    armor(Armor),
                    (is_member(X,Weapon) ->!,
                        gabung(Weapon_ground,[X],New_Weapon_ground),
                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                        asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,New_Weapon_ground,Armor_ground,Ammo_ground))
                    ; is_member(X,Ammo) ->!,
                        gabung(Ammo_ground,[X],New_Ammo_ground),
                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                        asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,New_Ammo_ground))
                    ; is_member(X,Medicine) ->!,
                        gabung(Medicine_ground,[X],New_Medicine_ground),
                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                        asserta(ground(Absis,Ordinat,Nama,Enemy,New_Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground))
                    ; is_member(X,Armor) ->!,
                        gabung(Armor_ground,[X],New_Armor_ground),
                        retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                        asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,New_Armor_ground,Ammo_ground))
                    )
                ; X = Weapon_player ->
                    %Weapon di ground bertambah
                    player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                    gabung(Weapon_ground,[X],New_Weapon_ground),
                    retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                    asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,New_Weapon_ground,Armor_ground,Ammo_ground)),
                    (Weapon_player = shotgun ->
                            drop_ammo(Ammo_player,pelurushotgun,Absis,Ordinat),
                            retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                            asserta(player(Absis,Ordinat,Health,Armor_player,none,0,Inventory))
                    ; !, Weapon_player = pistol ->
                            drop_ammo(Ammo_player,pelurupistol,Absis,Ordinat),
                            retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                            asserta(player(Absis,Ordinat,Health,Armor_player,none,0,Inventory))
                    )
                ; !, X = ammo ->
                    (Weapon_player = shotgun ->
                            drop_ammo(Ammo_player,pelurushotgun,Absis,Ordinat),
                            retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                            asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,0,Inventory))
                    ; !, Weapon_player = pistol ->
                            drop_ammo(Ammo_player,pelurupistol,Absis,Ordinat),
                            retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                            asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,0,Inventory))
                    )
                ; !,
                    write('Perintah gagal dilakasanakan')
                )
            ; !,
                write('Anda sudah kalah atau sudah keluar dari permainan\n'),
                fail
            ).

%Ganti parameter health pada player
ganti_health(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                    New_Health is (Health + X),
                    (New_Health > 100 ->
                        write('')
                    ;
                        retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                        asserta(player(Absis,Ordinat,New_Health,Armor_player,Weapon_player,Ammo_player,Inventory))
                    ).
%Ganti paramater armor pada player
ganti_armor(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,Health,X,Weapon_player,Ammo_player,Inventory)).
%Ganti weapon player
ganti_weapon(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,Health,Armor_player,X,Ammo_player,Inventory)).
%Ganti ammo player
ganti_ammo(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                    New_Ammo is (Ammo_player + X),
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,New_Ammo,Inventory)).

use(X) :- update_status_permainan, status_permainan(Status),
            (Status = on ->
                player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                (is_member(X,Inventory)->
                    weapon(Weapon),
                    ammo(Ammo),
                    medicine(Medicine),
                    armor(Armor),
                    (is_member(X,Weapon) -> !,
                        (Weapon_player = none ->
                            delete_by_value(Inventory,X,New_Inventory),
                            retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                            asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                            ganti_weapon(X)
                        ; !,
                            write('Drop senjata yang sedang Anda gunakan')
                        )
                    ; is_member(X,Ammo) -> !,
                        (X = 'pelurushotgun' -> !,
                            (Weapon_player = shotgun ->
                                delete_by_value(Inventory,X,New_Inventory),
                                retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                                asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                                ganti_ammo(1)
                            ; !,
                                write('Senjata Anda tidak sesuai')
                            )
                        ; X = 'pelurupistol' -> !,
                            (Weapon_player = pistol ->
                                delete_by_value(Inventory,X,New_Inventory),
                                retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                                asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                                ganti_ammo(1)
                            ; !,
                                write('Senjata Anda tidak sesuai')
                            )
                        )
                    ; is_member(X,Medicine) -> !,
                        (X = 'tolakangin' -> !,
                            delete_by_value(Inventory,X,New_Inventory),
                            retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                            asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                            ganti_health(10)
                        ; X = 'madurasa' -> !,
                            delete_by_value(Inventory,X,New_Inventory),
                            retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                            asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                            ganti_health(5)
                        )
                    ; is_member(X,Armor) -> !,
                        (X = 'ponco' -> !,
                            delete_by_value(Inventory,X,New_Inventory),
                            retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                            asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                            ganti_armor(20)
                        ; X = 'nametag' -> !,
                            delete_by_value(Inventory,X,New_Inventory),
                            retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                            asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                            ganti_armor(10)
                        )
                    )
                ; !,
                    write(X), write(' tidak ada di inventori\n')
                )
            ; !,
                write('Anda sudah kalah atau sudah keluar dari permainan\n'),
                fail
            ).

%Menghitung total damage yang akan diterima dari Enemy pada suatu petak
hitung_damage([],0).
hitung_damage([H|T],Damage) :- (H = shotgun ->
                                    hitung_damage(T,OldDamage),Damage is OldDamage + 30
                                ; H = pistol ->
                                    hitung_damage(T,OldDamage),Damage is OldDamage + 20
                                ; !,
                                    write('')
                                ).

attack :- update_status_permainan, status_permainan(Status),
        (Status = on ->
                player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                ground(Absis,Ordinat,Nama_Ground,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
                (Enemy \= [] ->
                    %Cek damage ke User
                    hitung_damage(Enemy,Damage),
                    True_Damage is (-1)*Damage + Armor_player,
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,Health,0,Weapon_player,Ammo_player,Inventory)),
                    ganti_health(True_Damage),
                    (Weapon_player \= none ->
                        (Ammo_player \= 0 ->
                            %Drop senjata yang digunakan enemy
                            first_element(Enemy,First_Enemy),
                            delete_first(Enemy,New_Enemy),
                            gabung(Weapon_ground,[First_Enemy],New_Weapon_ground),
                            retract(ground(Absis,Ordinat,Nama_Ground,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                            asserta(ground(Absis,Ordinat,Nama_Ground,New_Enemy,Medicine_ground,New_Weapon_ground,Armor_ground,Ammo_ground)),
                            %Mengurangi jumlah enemy
                            retract(count_enemy(Total_Enemy)),
                            New_Total_Enemy is Total_Enemy - 1,
                            (New_Total_Enemy = 0 ->
                                    write('SELAMAT ANDA TELAH MENANG')
                            ;
                                write('')
                            ),
                            asserta(count_enemy(New_Total_Enemy)),
                            retract(enemy(N,Absis,Ordinat,Enemy_Weapon,Status_Enemy)),
                            asserta(enemy(N,Absis,Ordinat,Enemy_Weapon,0))
                        ; !,
                            write('Anda tidak memiliki peluru saat ini')
                        )
                    ; !,
                        write('Anda tidak memiliki senjata saat ini')
                    )
                ; !,
                    write('Tidak ada musuh di petak Anda sekarang')
                )
        ; !,
            write('Anda telah keluar dari permainan\n Perintah gagal dieksekusi')
        ).
