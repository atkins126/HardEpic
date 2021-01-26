unit uConst;

interface

uses Generics.Collections;

type

  TScreenTypes = (sMenu, sMap);

const

  menu_newgame = 'menu_newgame';
  menu_continue = 'menu_continue';
  menu_language = 'menu_language';
  menu_exit = 'menu_exit';
  btn_turn = 'btn_turn';
  lbl_day = 'lbl_day';
  lbl_res = 'lbl_res';
  lbl_mp = 'lbl_mp';
  lbl_iq = 'lbl_iq';
  lbl_map = 'lbl_map';

var
  Lang : array[0..1] of string = ('eng','ru');


implementation

end.
