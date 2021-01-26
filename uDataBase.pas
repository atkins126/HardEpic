unit uDataBase;

interface

uses uConst;

const
    DBjson = '{'+
        // текущее состояние игры. будет сохраняться/загружаться из отдельного файла
        'state:{'+
            'lang: 0,'+      // текущий язык интерфейса (индекс языка из массива uConst.Lang)
            'day: 0,'+       // текущий игровой день
            'res: 0,'+       // текущее количество ресурсов
            'mp: 0,'+        // текущее количестов маны
            'iq: 0,'+        // текущее количество очков науки
            'res_inc: 0,'+   // прирост ресурса на следующий день
            'mp_inc: 10,'+    // прирост ресурса на следующий день
            'iq_inc: 3,'+    // прирост ресурса на следующий день
        '},'+
        'text:{'+
          'eng:{'+
             // кнопки на экране главного меню
             menu_newgame + ':"NEW BIRTH",'+
             menu_continue + ':"CONTINUE",'+
             menu_language + ':"ENGLISH",'+
             menu_exit + ':"EXIT",'+
             // кнопки
             lbl_map + ':"... MAP ...",'+
             btn_turn + ':"DAY",'+
             lbl_day + ':"Day",'+
             lbl_res + ':"Res.",'+
             lbl_mp + ':"Mana",'+
             lbl_iq + ':"IQ",'+
          '},'+
          'ru:{'+
             // кнопки на экране главного меню
             menu_newgame + ':"НОВОЕ РОЖДЕНИЕ",'+
             menu_continue + ':"ПРОДОЛЖИТЬ",'+
             menu_language + ':"РУССКИЙ",'+
             menu_exit + ':"ВЫХОД",'+

             lbl_map + ':"... КАРТА ...",'+
             btn_turn + ':"ДЕНЬ",'+
             lbl_day + ':"День",'+
             lbl_res + ':"Рес.",'+
             lbl_mp + ':"Мана",'+
             lbl_iq + ':"Ум",'+
          '},'+
        '},'+
    '}';

implementation

end.
