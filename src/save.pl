:- dynamic(player/7).
:- dynamic(peta/1).
:- dynamic(count_enemy/1).
:- dynamic(count_move/1).
:- dynamic(status_permainan/1).
:- dynamic(enemy/5).
:- dynamic(ground/8).

% file: /Users/kevin/Box Sync/ITB/2018-2019/IF2121_LogikaInformatika/TubesLogif/src/game.pl

player(10, 11, 100, 0, none, 0, []).

peta([['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', -, -, -, -, -, -, -, -, -, -, 'X'], ['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']]).

count_move(0).

status_permainan(on).

count_enemy(10).

enemy(1, 11, 11, pistol, 1).
enemy(2, 8, 9, pistol, 1).
enemy(3, 6, 10, pistol, 1).
enemy(4, 11, 8, pistol, 1).
enemy(5, 9, 6, pistol, 1).
enemy(6, 8, 10, shotgun, 1).
enemy(7, 6, 7, shotgun, 1).
enemy(8, 4, 10, shotgun, 1).
enemy(9, 8, 11, shotgun, 1).
enemy(10, 8, 4, shotgun, 1).

ground(11, 11, 'Binus', [pistol], [], [], [], [pelurushotgun]).
ground(8, 9, 'Unpar', [pistol], [madurasa, madurasa], [], [], []).
ground(6, 10, 'Unpar', [pistol], [tolakangin], [shotgun], [], []).
ground(11, 8, 'Binus', [pistol], [], [], [], []).
ground(9, 6, 'ITHB', [pistol], [], [shotgun], [], []).
ground(8, 10, 'Unpar', [shotgun], [], [], [], []).
ground(6, 7, 'Binus', [shotgun], [], [], [], []).
ground(4, 10, 'UGM', [shotgun], [madurasa], [], [], [pelurupistol]).
ground(8, 11, 'Unpar', [shotgun], [], [], [], []).
ground(8, 4, 'Unikom', [shotgun], [], [], [], [pelurushotgun]).
ground(4, 8, 'UGM', [], [madurasa], [], [ponco], []).
ground(10, 2, 'Unikom', [], [], [], [ponco], []).
ground(7, 7, 'Binus', [], [tolakangin], [pistol], [ponco], []).
ground(8, 5, 'ITHB', [], [], [], [ponco], []).
ground(11, 3, 'Unikom', [], [], [], [ponco], [pelurupistol]).
ground(6, 8, 'Unpar', [], [], [], [ponco], []).
ground(7, 8, 'Unpar', [], [], [], [ponco], []).
ground(5, 6, 'Binus', [], [], [], [nametag, ponco], [pelurupistol]).
ground(6, 11, 'Unpar', [], [], [shotgun], [ponco], []).
ground(9, 11, 'Unpar', [], [], [], [ponco], []).
ground(7, 9, 'Unpar', [], [], [], [nametag], []).
ground(8, 8, 'Unpar', [], [madurasa], [shotgun], [nametag], [pelurupistol, pelurupistol]).
ground(5, 4, 'Unpad', [], [], [], [nametag], [pelurupistol, pelurushotgun]).
ground(4, 2, 'ITB', [], [], [], [nametag], []).
ground(6, 5, 'Binus', [], [], [], [nametag], []).
ground(4, 5, 'UI', [], [tolakangin], [], [nametag], []).
ground(7, 6, 'Binus', [], [], [], [nametag], []).
ground(5, 7, 'Binus', [], [], [shotgun], [nametag], []).
ground(3, 7, 'UI', [], [], [], [nametag], []).
ground(9, 5, 'ITHB', [], [tolakangin], [], [], []).
ground(10, 7, 'ITHB', [], [tolakangin], [pistol], [], []).
ground(3, 3, 'ITB', [], [tolakangin], [], [], []).
ground(5, 9, 'UGM', [], [tolakangin], [], [], []).
ground(9, 7, 'ITHB', [], [tolakangin], [], [], []).
ground(8, 3, 'Unikom', [], [madurasa, tolakangin], [], [], []).
ground(2, 7, 'UI', [], [tolakangin], [], [], []).
ground(4, 3, 'ITB', [], [madurasa], [], [], []).
ground(11, 4, 'Unikom', [], [madurasa], [], [], []).
ground(10, 3, 'Unikom', [], [madurasa], [], [], []).
ground(3, 5, 'UI', [], [madurasa], [], [], []).
ground(3, 11, 'UGM', [], [], [shotgun], [], [pelurushotgun]).
ground(3, 2, 'ITB', [], [], [], [], [pelurushotgun]).
ground(6, 4, 'Unpad', [], [], [], [], [pelurushotgun]).
ground(9, 9, 'Unpar', [], [], [], [], [pelurupistol, pelurushotgun]).
ground(2, 5, 'UI', [], [], [], [], [pelurushotgun]).
ground(4, 4, 'ITB', [], [], [], [], [pelurushotgun]).
ground(9, 8, 'Unpar', [], [], [], [], [pelurushotgun]).
ground(2, 2, 'ITB', [], [], [], [], [pelurupistol, pelurupistol]).
ground(9, 10, 'Unpar', [], [], [], [], [pelurupistol]).
ground(10, 6, 'ITHB', [], [], [shotgun], [], []).
ground(4, 6, 'UI', [], [], [shotgun], [], []).
ground(7, 3, 'Unpad', [], [], [shotgun], [], []).
ground(10, 10, 'Binus', [], [], [shotgun], [], []).
ground(6, 2, 'Unpad', [], [], [pistol], [], []).
ground(9, 2, 'Unikom', [], [], [pistol], [], []).
ground(10, 9, 'Binus', [], [], [pistol, pistol], [], []).
ground(6, 9, 'Unpar', [], [], [pistol], [], []).
ground(7, 10, 'Unpar', [], [], [pistol], [], []).
ground(3, 6, 'UI', [], [], [pistol], [], []).
ground(10, 4, 'Unikom', [], [], [pistol], [], []).
ground(2, 3, 'ITB', [], [], [], [], []).
ground(2, 4, 'ITB', [], [], [], [], []).
ground(2, 6, 'UI', [], [], [], [], []).
ground(2, 8, 'UGM', [], [], [], [], []).
ground(2, 9, 'UGM', [], [], [], [], []).
ground(2, 10, 'UGM', [], [], [], [], []).
ground(2, 11, 'UGM', [], [], [], [], []).
ground(3, 4, 'ITB', [], [], [], [], []).
ground(3, 8, 'UGM', [], [], [], [], []).
ground(3, 9, 'UGM', [], [], [], [], []).
ground(3, 10, 'UGM', [], [], [], [], []).
ground(4, 7, 'UI', [], [], [], [], []).
ground(4, 9, 'UGM', [], [], [], [], []).
ground(4, 11, 'UGM', [], [], [], [], []).
ground(5, 2, 'Unpad', [], [], [], [], []).
ground(5, 3, 'Unpad', [], [], [], [], []).
ground(5, 5, 'Binus', [], [], [], [], []).
ground(5, 8, 'UGM', [], [], [], [], []).
ground(5, 10, 'UGM', [], [], [], [], []).
ground(5, 11, 'UGM', [], [], [], [], []).
ground(6, 3, 'Unpad', [], [], [], [], []).
ground(6, 6, 'Binus', [], [], [], [], []).
ground(7, 2, 'Unpad', [], [], [], [], []).
ground(7, 4, 'Unpad', [], [], [], [], []).
ground(7, 5, 'Binus', [], [], [], [], []).
ground(7, 11, 'Unpar', [], [], [], [], []).
ground(8, 2, 'Unikom', [], [], [], [], []).
ground(8, 6, 'ITHB', [], [], [], [], []).
ground(8, 7, 'ITHB', [], [], [], [], []).
ground(9, 3, 'Unikom', [], [], [], [], []).
ground(9, 4, 'Unikom', [], [], [], [], []).
ground(10, 5, 'ITHB', [], [], [], [], []).
ground(10, 8, 'Binus', [], [], [], [], []).
ground(10, 11, 'Binus', [], [], [], [], []).
ground(11, 2, 'Unikom', [], [], [], [], []).
ground(11, 5, 'ITHB', [], [], [], [], []).
ground(11, 6, 'ITHB', [], [], [], [], []).
ground(11, 7, 'ITHB', [], [], [], [], []).
ground(11, 9, 'Binus', [], [], [], [], []).
ground(11, 10, 'Binus', [], [], [], [], []).
ground(6, 8, 'Unpar', [pistol], [], [], [], []).
ground(5, 2, 'Unpad', [pistol], [], [], [], []).
ground(8, 2, 'Unikom', [pistol], [], [shotgun], [], []).
ground(2, 7, 'UI', [pistol], [], [], [], []).
ground(10, 2, 'Unikom', [pistol], [madurasa], [], [], []).
ground(5, 7, 'Binus', [shotgun], [], [], [], [pelurushotgun]).
ground(8, 11, 'Unpar', [shotgun], [], [], [], []).
ground(2, 8, 'UGM', [shotgun], [], [pistol], [], [pelurushotgun]).
ground(7, 4, 'Unpad', [shotgun], [], [], [], []).
ground(9, 6, 'ITHB', [shotgun], [], [shotgun], [ponco], []).
ground(5, 6, 'Binus', [], [], [], [ponco], []).
ground(4, 3, 'ITB', [], [madurasa], [], [ponco], []).
ground(2, 5, 'UI', [], [], [], [ponco], []).
ground(2, 3, 'ITB', [], [], [], [ponco], []).
ground(3, 10, 'UGM', [], [], [], [ponco], []).
ground(11, 6, 'ITHB', [], [], [], [nametag, ponco], [pelurupistol]).
ground(6, 3, 'Unpad', [], [tolakangin], [], [ponco], []).
ground(2, 11, 'UGM', [], [], [], [ponco], []).
ground(5, 4, 'Unpad', [], [], [], [ponco], []).
ground(4, 6, 'UI', [], [], [shotgun], [nametag, nametag], [pelurushotgun]).
ground(8, 10, 'Unpar', [], [madurasa], [shotgun], [nametag], []).
ground(3, 8, 'UGM', [], [tolakangin], [], [nametag], []).
ground(5, 8, 'UGM', [], [], [], [nametag], []).
ground(3, 3, 'ITB', [], [], [], [nametag], []).
ground(6, 11, 'Unpar', [], [], [], [nametag], []).
ground(3, 7, 'UI', [], [madurasa], [], [nametag], []).
ground(7, 3, 'Unpad', [], [], [], [nametag], []).
ground(7, 11, 'Unpar', [], [tolakangin], [pistol], [], []).
ground(7, 10, 'Unpar', [], [madurasa, tolakangin], [], [], [pelurushotgun]).
ground(5, 5, 'Binus', [], [tolakangin], [], [], []).
ground(10, 8, 'Binus', [], [tolakangin], [], [], [pelurushotgun]).
ground(3, 5, 'UI', [], [tolakangin], [], [], []).
ground(11, 4, 'Unikom', [], [tolakangin], [], [], []).
ground(2, 9, 'UGM', [], [tolakangin], [], [], []).
ground(2, 6, 'UI', [], [tolakangin], [], [], []).
ground(2, 4, 'ITB', [], [madurasa], [], [], []).
ground(9, 3, 'Unikom', [], [madurasa], [], [], []).
ground(3, 4, 'ITB', [], [madurasa], [], [], []).
ground(11, 9, 'Binus', [], [madurasa], [pistol], [], []).
ground(7, 6, 'Binus', [], [madurasa], [], [], [pelurupistol, pelurushotgun]).
ground(6, 10, 'Unpar', [], [], [shotgun], [], [pelurushotgun]).
ground(4, 5, 'UI', [], [], [], [], [pelurushotgun]).
ground(11, 10, 'Binus', [], [], [], [], [pelurushotgun]).
ground(9, 9, 'Unpar', [], [], [shotgun], [], [pelurupistol, pelurushotgun]).
ground(10, 3, 'Unikom', [], [], [], [], [pelurupistol]).
ground(11, 2, 'Unikom', [], [], [shotgun], [], [pelurupistol, pelurupistol]).
ground(4, 11, 'UGM', [], [], [pistol], [], [pelurupistol]).
ground(7, 5, 'Binus', [], [], [], [], [pelurupistol, pelurupistol]).
ground(4, 2, 'ITB', [], [], [pistol], [], [pelurupistol]).
ground(11, 7, 'ITHB', [], [], [shotgun], [], []).
ground(5, 3, 'Unpad', [], [], [shotgun], [], []).
ground(4, 4, 'ITB', [], [], [shotgun], [], []).
ground(11, 5, 'ITHB', [], [], [pistol], [], []).
ground(8, 9, 'Unpar', [], [], [pistol], [], []).
ground(9, 5, 'ITHB', [], [], [pistol], [], []).
ground(6, 9, 'Unpar', [], [], [pistol], [], []).
ground(10, 7, 'ITHB', [], [], [pistol], [], []).
ground(2, 2, 'ITB', [], [], [], [], []).
ground(2, 10, 'UGM', [], [], [], [], []).
ground(3, 2, 'ITB', [], [], [], [], []).
ground(3, 6, 'UI', [], [], [], [], []).
ground(3, 9, 'UGM', [], [], [], [], []).
ground(3, 11, 'UGM', [], [], [], [], []).
ground(4, 7, 'UI', [], [], [], [], []).
ground(4, 8, 'UGM', [], [], [], [], []).
ground(4, 9, 'UGM', [], [], [], [], []).
ground(4, 10, 'UGM', [], [], [], [], []).
ground(5, 9, 'UGM', [], [], [], [], []).
ground(5, 10, 'UGM', [], [], [], [], []).
ground(5, 11, 'UGM', [], [], [], [], []).
ground(6, 2, 'Unpad', [], [], [], [], []).
ground(6, 4, 'Unpad', [], [], [], [], []).
ground(6, 5, 'Binus', [], [], [], [], []).
ground(6, 6, 'Binus', [], [], [], [], []).
ground(6, 7, 'Binus', [], [], [], [], []).
ground(7, 2, 'Unpad', [], [], [], [], []).
ground(7, 7, 'Binus', [], [], [], [], []).
ground(7, 8, 'Unpar', [], [], [], [], []).
ground(7, 9, 'Unpar', [], [], [], [], []).
ground(8, 3, 'Unikom', [], [], [], [], []).
ground(8, 4, 'Unikom', [], [], [], [], []).
ground(8, 5, 'ITHB', [], [], [], [], []).
ground(8, 6, 'ITHB', [], [], [], [], []).
ground(8, 7, 'ITHB', [], [], [], [], []).
ground(8, 8, 'Unpar', [], [], [], [], []).
ground(9, 2, 'Unikom', [], [], [], [], []).
ground(9, 4, 'Unikom', [], [], [], [], []).
ground(9, 7, 'ITHB', [], [], [], [], []).
ground(9, 8, 'Unpar', [], [], [], [], []).
ground(9, 10, 'Unpar', [], [], [], [], []).
ground(9, 11, 'Unpar', [], [], [], [], []).
ground(10, 4, 'Unikom', [], [], [], [], []).
ground(10, 5, 'ITHB', [], [], [], [], []).
ground(10, 6, 'ITHB', [], [], [], [], []).
ground(10, 9, 'Binus', [], [], [], [], []).
ground(10, 10, 'Binus', [], [], [], [], []).
ground(10, 11, 'Binus', [], [], [], [], []).
ground(11, 3, 'Unikom', [], [], [], [], []).
ground(11, 8, 'Binus', [], [], [], [], []).
ground(11, 11, 'Binus', [], [], [], [], []).
