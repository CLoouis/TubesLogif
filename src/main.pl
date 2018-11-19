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

weapon(shotgun).
weapon(pistol).

ammo(peluru10).
ammo(peluru5).

medicine(tolakangin).
medicine(madurasa).

armor(nametag).
armor(ponco).

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
ground(5,5,ponco).
ground(5,6,ponco).
ground(5,4,ponco).
ground(4,5,ponco).
ground(6,5,ponco).

look :- 