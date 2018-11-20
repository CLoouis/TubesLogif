start :- write('Welcome to the battlefield!\n'),
    write('You have been chosen as one of the lucky contestants.\n'),
    write('Be the last man standing and you will be remembered as one of the victors.'),
    write('\n\nAvailable commands :\n\n'),
    write('start. -- Memulai permainan\n'),
    write('help. -- Menampilkan daftar perintah yang dapat dijalankan\n'),
    write('quit. -- Keluar dari permainan\n'),
    write('look. -- Melihat keadaan petak sekitar\n'),
    write('n,s,e,w. -- Untuk berjalan kearah utara, selatan, timur, dan barat\n'),
    write('map. -- Menampilkan peta wilayah permainan\n'),
    write('take(Object). -- Mengambil sebuah object\n'),
    write('drop(Object). -- Menjatuhkan sebuah object\n'),
    write('use(Object). -- Menggunakan sebuah object\n'),
    write('attack. -- Menyerang musuh yang terdapat di petak yang sama\n'),
    write('status. -- Menampilkan status permainan\n'),
    write('save(Filename). -- Save permainan\n'),
    write('load(Filename). -- Load permainan sebelumnya\n'),
    write('\n\nLegends:\n\n'),
    write('W = weapon\n'),
    write('A = armor\n'),
    write('M = medicine\n'),
    write('O = ammo\n'),
    write('P = player\n'),
    write('E = enemy\n'),
    write('- = accessible\n'),
    write('X = inaccessible\n').

help :- write('\nquit. -- Keluar dari permainan\n'),
    write('look. -- Melihat keadaan petak sekitar\n'),
    write('n,s,e,w. -- Untuk berjalan kearah utara, selatan, timur, dan barat\n'),
    write('map. -- Menampilkan peta wilayah permainan\n'),
    write('take(Object). -- Mengambil sebuah object\n'),
    write('drop(Object). -- Menjatuhkan sebuah object\n'),
    write('use(Object). -- Menggunakan sebuah object\n'),
    write('attack. -- Menyerang musuh yang terdapat di petak yang sama\n'),
    write('status. -- Menampilkan status permainan\n'),
    write('save(Filename). -- Save permainan\n'),
    write('load(Filename). -- Load permainan sebelumnya\n').

weapon(['shotgun','pistol']).
ammo(['peluru5','peluru10']).
medicine(['tolakangin','madurasa']).
armor(['nametag','ponco']).

:- dynamic(player/7).
% player(Absis,Ordinat,health,armor,weapon,ammo,inventory)
player(5,5,100,0,'pistol',5,['nametag','madurasa','x','x','x','x','x','x','x']).

:- dynamic(peta/1).
peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],
['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],
['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],['X',-,-,-,-,-,-,-,-,-,-,'X'],
['X',-,-,-,-,-,-,-,-,-,-,'X'],
['X','X','X','X','X','X','X','X','X','X','X','X']]).

:- dynamic(count_move/1). %untuk menghitung banyak move yang telah dilakukan
count_move(0).

:- dynamic(ground/8). %untuk deskripsi peta.
%ground(absis,ordinat,nama,enemy,[medicine],[weapon],[armor],[ammo])
%enemy = 1 berarti ada enemy, 0 jika tidak ada
ground(2,2,'ITB',0,[],[],[],[]).
ground(2,3,'ITB',0,[],[],[],[]).
ground(2,4,'ITB',0,[],[],[],[]).
ground(2,5,'Unpad',0,[],[],[],[]).
ground(2,6,'Unpad',0,[],[],[],[]).
ground(2,7,'Unpad',0,[],[],[],[]).
ground(2,8,'IPB',0,[],[],[],[]).
ground(2,9,'IPB',0,[],[],[],[]).
ground(2,10,'Unikom',0,[],[],[],[]).
ground(2,11,'Unikom',0,[],[],[],[]).

ground(3,2,'ITB',0,[],[],[],[]).
ground(3,3,'ITB',0,[],[],[],[]).
ground(3,4,'ITB',0,[],[],[],[]).
ground(3,5,'Unpad',0,[],[],[],[]).
ground(3,6,'Unpad',0,[],[],[],[]).
ground(3,7,'Unpad',0,[],[],[],[]).
ground(3,8,'IPB',0,[],[],[],[]).
ground(3,9,'IPB',0,[],[],[],[]).
ground(3,10,'Unikom',0,[],[],[],[]).
ground(3,11,'Unikom',0,[],[],[],[]).

ground(4,2,'ITB',0,[],[],[],[]).
ground(4,3,'ITB',0,[],[],[],[]).
ground(4,4,'ITB',0,[],[],[],[]).
ground(4,5,'Unpad',0,[],[],[],[]).
ground(4,6,'Unpad',0,[],[],[],[]).
ground(4,7,'Unpad',0,[],[],[],[]).
ground(4,8,'IPB',0,[],[],[],[]).
ground(4,9,'IPB',0,[],[],[],[]).
ground(4,10,'Unikom',0,[],[],[],[]).
ground(4,11,'Unikom',0,[],[],[],[]).

ground(5,2,'ITB',0,[],[],[],[]).
ground(5,3,'ITB',0,[],[],[],[]).
ground(5,4,'ITB',0,[],[],[],[]).
ground(5,5,'Binus',0,['tolakangin'],['pistol'],[],[]).
ground(5,6,'Binus',0,[],[],[],[]).
ground(5,7,'Binus',0,[],[],[],[]).
ground(5,8,'ITS',0,[],[],[],[]).
ground(5,9,'ITS',0,[],[],[],[]).
ground(5,10,'ITHB',0,[],[],[],[]).
ground(5,11,'ITHB',0,[],[],[],[]).

ground(6,2,'ITB',0,[],[],[],[]).
ground(6,3,'ITB',0,[],[],[],[]).
ground(6,4,'ITB',0,[],[],[],[]).
ground(6,5,'Binus',0,[],[],[],[]).
ground(6,6,'Binus',0,[],[],[],[]).
ground(6,7,'Binus',0,[],[],[],[]).
ground(6,8,'ITS',0,[],[],[],[]).
ground(6,9,'ITS',0,[],[],[],[]).
ground(6,10,'ITHB',0,[],[],[],[]).
ground(6,11,'ITHB',0,[],[],[],[]).

ground(7,2,'ITB',0,[],[],[],[]).
ground(7,3,'ITB',0,[],[],[],[]).
ground(7,4,'ITB',0,[],[],[],[]).
ground(7,5,'Binus',0,[],[],[],[]).
ground(7,6,'Binus',0,[],[],[],[]).
ground(7,7,'Binus',0,[],[],[],[]).
ground(7,8,'ITS',0,[],[],[],[]).
ground(7,9,'ITS',0,[],[],[],[]).
ground(7,10,'ITHB',0,[],[],[],[]).
ground(7,11,'ITHB',0,[],[],[],[]).

ground(8,2,'UGM',0,[],[],[],[]).
ground(8,3,'UGM',0,[],[],[],[]).
ground(8,4,'UGM',0,[],[],[],[]).
ground(8,5,'UGM',0,[],[],[],[]).
ground(8,6,'Unpar',0,[],[],[],[]).
ground(8,7,'Unpar',0,[],[],[],[]).
ground(8,8,'Unpar',0,[],[],[],[]).
ground(8,9,'Unpar',0,[],[],[],[]).
ground(8,10,'UNS',0,[],[],[],[]).
ground(8,11,'UNS',0,[],[],[],[]).

ground(9,2,'UGM',0,[],[],[],[]).
ground(9,3,'UGM',0,[],[],[],[]).
ground(9,4,'UGM',0,[],[],[],[]).
ground(9,5,'UGM',0,[],[],[],[]).
ground(9,6,'Unpar',0,[],[],[],[]).
ground(9,7,'Unpar',0,[],[],[],[]).
ground(9,8,'Unpar',0,[],[],[],[]).
ground(9,9,'Unpar',0,[],[],[],[]).
ground(9,10,'UNS',0,[],[],[],[]).
ground(9,11,'UNS',0,[],[],[],[]).

ground(10,2,'UGM',0,[],[],[],[]).
ground(10,3,'UGM',0,[],[],[],[]).
ground(10,4,'UGM',0,[],[],[],[]).
ground(10,5,'UGM',0,[],[],[],[]).
ground(10,6,'Unpar',0,[],[],[],[]).
ground(10,7,'Unpar',0,[],[],[],[]).
ground(10,8,'Unpar',0,[],[],[],[]).
ground(10,9,'Unpar',0,[],[],[],[]).
ground(10,10,'UNS',0,[],[],[],[]).
ground(10,11,'UNS',0,[],[],[],[]).

ground(11,2,'UGM',0,[],[],[],[]).
ground(11,3,'UGM',0,[],[],[],[]).
ground(11,4,'UGM',0,[],[],[],[]).
ground(11,5,'UGM',0,[],[],[],[]).
ground(11,6,'Unpar',0,[],[],[],[]).
ground(11,7,'Unpar',0,[],[],[],[]).
ground(11,8,'Unpar',0,[],[],[],[]).
ground(11,9,'Unpar',0,[],[],[],[]).
ground(11,10,'UNS',0,[],[],[],[]).
ground(11,11,'UNS',0,[],[],[],[]).

status :- player(X,Y,A,B,C,D,E), nl,
            write('Health : '), write(A), nl,
            write('Armor : '), write(B), nl,
            write('Weapon : '), write(C), nl,
            write('Ammo : '), write(D), nl,
            write('Inventory : \n'),
            (E = [] ->
                write('Inventory Anda kosong')
            ; !,
                printlistnewline(E)
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

delete_by_value([H|T],H,T).
delete_by_value([H|T],X,Y) :- H \= X, delete_by_value(T,X,Ynew), gabung([H],Ynew,Y).

%mengganti element ke -n dari sebuah list dengan S
ganti(X,0,S,X).
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
                write('Anda sudah kalah\n'),
                fail
            ).

%mengecilkan peta karena daerah disekeliling jadi tidak accessible
kecilkanpeta :- count_move(R),
            (R = 10 -> !,
                retract(peta(M)),
                asserta(peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X',-,-,-,-,-,-,-,-,'X','X'],['X','X',-,-,-,-,-,-,-,-,'X','X'],
                ['X','X',-,-,-,-,-,-,-,-,'X','X'],['X','X',-,-,-,-,-,-,-,-,'X','X'],
                ['X','X',-,-,-,-,-,-,-,-,'X','X'],['X','X',-,-,-,-,-,-,-,-,'X','X'],
                ['X','X',-,-,-,-,-,-,-,-,'X','X'],['X','X',-,-,-,-,-,-,-,-,'X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X']]))
            ; R = 20 -> !,
                retract(peta(M)),
                asserta(peta([['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X',-,-,-,-,-,-,'X','X','X'],['X','X','X',-,-,-,-,-,-,'X','X','X'],
                ['X','X','X',-,-,-,-,-,-,'X','X','X'],['X','X','X',-,-,-,-,-,-,'X','X','X'],
                ['X','X','X',-,-,-,-,-,-,'X','X','X'],['X','X','X',-,-,-,-,-,-,'X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X'],
                ['X','X','X','X','X','X','X','X','X','X','X','X']]))
            ; R = 30 -> !,
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
                ['X','X','X','X','X','X','X','X','X','X','X','X']]))
            ; R = 40 -> !,
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
                ['X','X','X','X','X','X','X','X','X','X','X','X']]))
            ; R = 50 -> !,
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
                ['X','X','X','X','X','X','X','X','X','X','X','X']]))
            ;
                write('')
            ).

%untuk menampilkan peta
printpeta([]) :- write('').
printpeta([H|T]) :- printlist(H),nl, printpeta(T).
tampilpeta :- updatepeta, peta(X),printpeta(X).

%operasi untuk user bergerak

n :- player(X,Y,_,_,_,_,_),
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
        ) ,!
    ; !,
        write('Wilayah tersebut tidak dapat dikunjungi.\n')
    ).

e :- player(X,Y,_,_,_,_,_),
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
        ) ,!
    ; !,
        write('Wilayah tersebut tidak dapat dikunjungi.\n')
    ).

w :- player(X,Y,_,_,_,_,_),
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
        ) ,!
    ; !,
        write('Wilayah tersebut tidak dapat dikunjungi.\n')
    ).

s :- player(X,Y,_,_,_,_,_),
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
        ) ,!
    ; !,
        write('Wilayah tersebut tidak dapat dikunjungi.\n')
    ).

take(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
            ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground),
            (is_member(X,Medicine_ground) ->
                panjang(Inventory,N_Inventory),
                (N_Inventory < 10 ->
                    gabung(Inventory,[X],New_Inventory),
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                    delete_by_value(Medicine_ground,X,New_Medicine_ground),!,
                    retract(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground)),
                    asserta(ground(Absis,Ordinat,Nama,Enemy,New_Medicine_ground,Weapon_ground,Armor_ground,Ammo_ground))
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
                    asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,New_Weapon_ground,Armor_ground,Ammo_ground))
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
                    asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,New_Armor_ground,Ammo_ground))
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
                    asserta(ground(Absis,Ordinat,Nama,Enemy,Medicine_ground,Weapon_ground,Armor_ground,New_Ammo_ground))
                ; !,
                    write('Inventory Anda sudah penuh\n')
                )
            ; !,
                write(X), write(' tidak terdapat pada ground\n')
            ).

drop(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
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
                ; !,
                    write('Barangnya aneh...')
                )
            ; !,
                write(X), write(' tidak ada di inventory\n')
            ).

ganti_health(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                    New_Health is (Health + X),
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,New_Health,Armor_player,Weapon_player,Ammo_player,Inventory)).

ganti_armor(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,Health,X,Weapon_player,Ammo_player,Inventory)).

ganti_weapon(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,Health,Armor_player,X,Ammo_player,Inventory)).

ganti_ammo(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
                    New_Ammo is (Ammo_player + X),
                    retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                    asserta(player(Absis,Ordinat,New_Health,Armor_player,Weapon_player,New_Ammo,Inventory)).

use(X) :- player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory),
            (is_member(X,Inventory)->
                delete_by_value(Inventory,X,New_Inventory),
                retract(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,Inventory)),
                asserta(player(Absis,Ordinat,Health,Armor_player,Weapon_player,Ammo_player,New_Inventory)),
                weapon(Weapon),
                ammo(Ammo),
                medicine(Medicine),
                armor(Armor),
                (is_member(X,Weapon) -> !,
                    ganti_weapon(X)
                ; is_member(X,Ammo) -> !,
                    (X = 'peluru5' -> !,
                        ganti_ammo(5)
                    ; X = 'peluru10' -> !,
                        ganti_ammo(10)
                    )
                ; is_member(X,Medicine) -> !,
                    (X = 'tolakangin' -> !,
                        ganti_health(10)
                    ; X = 'madurasa' -> !,
                        ganti_health(5)
                    )
                ; is_member(X,Armor) -> !,
                    (X = 'ponco' -> !,
                        ganti_armor(10)
                    ; X = 'nametag' -> !,
                        ganti_armor(5)
                    )
                )
            ; !,
                write(X), write(' tidak ada di inventori\n')
            ).
