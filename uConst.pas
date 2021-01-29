unit uConst;

interface

uses Generics.Collections;

type

  TScreenTypes = (sMenu, sMap);

const
  // ������ ��������
  cls_nature  = 'nature';   // ���������/����� ������
  cls_war     = 'war';      // ��������������/������� ����������, �����
  cls_economy = 'economy';  // ������������� �����. ��������� ��������, ���������� ������

  // ���� ���������. ������ �� ������������, ���������� ������, �������� �����������
  grd_plain     = 'plain';
  grd_wasteland = 'wasteland';
  grd_foothills = 'foothills';
  grd_mountain  = 'mountain';
  grd_desert    = 'desert';
  grd_coast     = 'coast';
  grd_water     = 'water';

  // �������� �������� ����
  menu_newgame = 'menu_newgame';
  menu_continue = 'menu_continue';
  menu_language = 'menu_language';
  menu_exit = 'menu_exit';

  // �������� ������ �����
  btn_turn = 'btn_turn';
  lbl_day = 'lbl_day';
  lbl_map = 'lbl_map';
  lbl_all = 'lbl_all';

  // �������� ��������
  obj_volcano = 'obj_volcano'; // ������

  // �������� ��������
  eff_eruption = 'eff_eruption';  // ���������� ���� � ������� ��� �������� ��������

var
  Lang : array[0..1] of string = ('eng','ru');


implementation

end.
