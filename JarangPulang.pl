/*Narasi*/
/*Timothy_13517087*/
% Johanes Boas Badia 13517009
%Louis Cahyadi 135171226
%Kevin Nathaniel Wijaya 13517072

row(M, N, Row) :-
    nth1(N, M, Row).

column(M, N, Col) :-
    transpose(M, MT),
    row(MT, N, Col).

symmetrical(M) :-
    transpose(M, M).

transpose([[]|_], []) :- !.
transpose([[I|Is]|Rs], [Col|MT]) :-
    first_column([[I|Is]|Rs], Col, [Is|NRs]),
    transpose([Is|NRs], MT).

first_column([], [], []).
first_column([[]|_], [], []).
first_column([[I|Is]|Rs], [I|Col], [Is|Rest]) :-
    first_column(Rs, Col, Rest).

array([1,2,3]).
matrix([[a,b,c],[d,e,f],[g,h,i]]).
replace([_|X],Y,[Y|X]).

weapon(shotgun).
weapon(pistol).

ammo(peluru10).
ammo(peluru5).

medicine(tolakangin).
medicine(madurasa).

armor(nametag).
armor(ponco).

menuawal() :- write('Selamat datang di permainan ini').

%fieldrule([medicine,weapon,armor,ammo]).
%field11([tolakangin,weapon,armor,ammo]).
%peta([[-,-,-],[-,p,-],[-,-,-]]).
