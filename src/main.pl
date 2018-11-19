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

peta([[-,-,-,-,-,-,-,-,-,-],[-,-,-,'P',-,-,-,-,-,-],[-,-,-,-,-,-,-,-,-,-],[-,-,-,-,-,-,-,-,-,-],
[-,-,-,-,-,-,-,-,-,-],[-,-,-,-,-,-,-,-,-,-],[-,-,-,-,-,-,-,-,-,-],[-,-,-,-,-,-,-,-,-,-],
[-,-,-,-,-,-,-,-,-,-],[-,-,-,-,-,-,-,-,-,-]]).

printlist([]) :- write('').
printlist([H|T]) :- write(H), printlist(T).

printpeta([]) :- write('').
printpeta([H|T]) :- printlist(H),nl, printpeta(T).

tampilpeta :- peta(X),printpeta(X).

% W = weapon
% A = armor
% M = medicine
% O = ammo
% P = player
% E = enemy
% - = accessible
% X = inaccessible
% Enemy > Medicine > Weapon > Armor > Ammo > pemain
% Tes ada apa di lantai
ground(5,5,enemy).
ground(5,5,ponco).
ground(5,5,madurasa).
ground(5,5,pistol).
ground(5,6,pistol).
ground(5,4,ponco).
ground(4,5,ponco).
ground(6,5,ponco).

inaccesiblekiriatas(0,0).
inaccesiblekananbawah(11,11).

koordinatpemain(5,5).

look :- koordinatpemain(X,Y),
        lookpemainenemy(X,Y),
        lookpemaintolakangin(X,Y),
        lookpemainmadurasa(X,Y),
        lookpemainpistol(X,Y),
        lookpemainshotgun(X,Y),
        lookpemainnametag(X,Y),
        lookpemainponco(X,Y),
        lookpemainpeluru5(X,Y),
        lookpemainpeluru10(X,Y),
        nl,
        A is X-1,
        B is X+1,
        C is Y-1,
        D is Y+1,
        lookkor(A,C),
        write(' '),
        lookkor(X,C),
        write(' '),
        lookkor(B,C),
        nl,
        lookkor(A,Y),
        write(' '),
        lookkor(X,Y),
        write(' '),
        lookkor(B,Y),
        nl,
        lookkor(A,D),
        write(' '),
        lookkor(X,D),
        write(' '),
        lookkor(B,D),
        nl.

lookpemainenemy(X,Y) :- ground(X,Y,enemy),
                write('You see an enemy. '), ! .

lookpemainenemy(A,B).

lookpemaintolakangin(X,Y) :- ground(X,Y,tolakangin),
                write('You see Tolak Angin on the ground.'), ! .

lookpemaintolakangin(A,B).

lookpemainmadurasa(X,Y) :- ground(X,Y,madurasa),
                write('You see Madurasa on the ground. '), ! .

lookpemainmadurasa(A,B).

lookpemainpistol(X,Y) :- ground(X,Y,pistol),
                write('You see an empty pistol on the ground. '), ! .

lookpemainpistol(A,B).

lookpemainshotgun(X,Y) :- ground(X,Y,shotgun),
                write('You see an empty shotgun on the ground. '), ! .

lookpemainshotgun(A,B).

lookpemainnametag(X,Y) :- ground(X,Y,nametag),
                write('You see a nametag on the ground. '), ! .

lookpemainnametag(A,B).

lookpemainponco(X,Y) :- ground(X,Y,ponco),
                write('You see a ponco on the ground. '), ! .

lookpemainponco(A,B).

lookpemainpeluru5(X,Y) :- ground(X,Y,peluru5),
                write('You see 5 peluru on the ground. '), ! .

lookpemainpeluru5(A,B).

lookpemainpeluru10(X,Y) :- ground(X,Y,peluru10),
                write('You see 10 peluru on the ground. '), ! .

lookpemainpeluru10(A,B).

% Enemy > Medicine > Weapon > Armor > Ammo > pemain
% W = weapon
% A = armor
% M = medicine
% O = ammo
% P = player
% E = enemy
% - = accessible
% X = inaccessible

weapon(shotgun).
weapon(pistol).

ammo(peluru10).
ammo(peluru5).

medicine(tolakangin).
medicine(madurasa).

armor(nametag).
armor(ponco).

lookkor(X,Y) :- inaccesiblekiriatas(A,B),
                A == X,
                write('X'), ! .

lookkor(X,Y) :- inaccesiblekiriatas(A,B),
                B == Y,
                write('X'), ! .

lookkor(X,Y) :- inaccesiblekananbawah(A,B),
                A == X,
                write('X'), ! .

lookkor(X,Y) :- inaccesiblekananbawah(A,B),
                B == Y,
                write('X'), ! .       

lookkor(X,Y) :- ground(X,Y,enemy),
                write('E'), ! .
            
lookkor(X,Y) :- ground(X,Y,tolakangin),
                write('M'), ! .
                
lookkor(X,Y) :- ground(X,Y,madurasa),
                write('M'), ! .

lookkor(X,Y) :- ground(X,Y,pistol),
                write('W'), ! .

lookkor(X,Y) :- ground(X,Y,shotgun),
                write('W'), ! .

lookkor(X,Y) :- ground(X,Y,nametag),
                write('A'), ! .

lookkor(X,Y) :- ground(X,Y,ponco),
                write('A'), ! .

lookkor(X,Y) :- ground(X,Y,peluru5),
                write('O'), ! .

lookkor(X,Y) :- ground(X,Y,peluru10),
                write('O'), ! .

lookkor(X,Y) :- koordinatpemain(X,Y),
                write('P'), ! .

lookkor(X,Y) :- write('-'), ! .