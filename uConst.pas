unit uConst;

interface

uses Generics.Collections;

type

  TScreenTypes = (sMenu, sMap);

const
  // классы объектов
  cls_nature  = 'nature';   // природный/дикий объект
  cls_war     = 'war';      // оборонительное/военное сооружение, юниты
  cls_economy = 'economy';  // экономическа€ сфера. источники ресурсов, добывающие здани€

  // типы местности. вли€ют на производство, количество слотов, скорость перемещени€
  grd_plain     = 'plain';
  grd_wasteland = 'wasteland';
  grd_foothills = 'foothills';
  grd_mountain  = 'mountain';
  grd_desert    = 'desert';
  grd_coast     = 'coast';
  grd_water     = 'water';

  // элементы главного меню
  menu_newgame = 'menu_newgame';
  menu_continue = 'menu_continue';
  menu_language = 'menu_language';
  menu_exit = 'menu_exit';

  // элементы экрана карты
  btn_turn = 'btn_turn';
  lbl_day = 'lbl_day';
  lbl_map = 'lbl_map';
  lbl_all = 'lbl_all';

  // синонимы объектов
  obj_volcano = 'obj_volcano'; // вулкан

  // синонимы эффектов
  eff_eruption = 'eff_eruption';  // порождени€ лавы в текущем или соседних секторах

var
  Lang : array[0..1] of string = ('eng','ru');


implementation

end.
