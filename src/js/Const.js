var saru = {};
saru.Const = {};


saru.Const.VERSION = "2016.01.05:1.0";
saru.Const.AUTHOR = "higeguma";

/*ゲームの基本設定*/

//画面のサイズ
saru.Const.WIDTH = 700;
saru.Const.HEIGHT = 450;

//１ゲームの時間
saru.Const.GAME_TIME = 2000;

//敵の数の上限
saru.Const.MAX_ENEMY = 50;
//敵の最初の出現頻度
saru.Const.ENEMY_PRODUCE_TIME = 700;
//自分の弾丸の上限
saru.Const.MAX_HERO_TAMA = 15;
//自分の弾丸のスピード
saru.Const.HERO_TAMA_SPEED = 15;

/*共用の定数*/

//イベント名を定義
saru.Const.PRE_START_BT_CLICK = "preStartBtClick";
saru.Const.MAIN_END = "mainEnd";
saru.Const.RESULT_REPLAY = "resultReplay";
saru.Const.MAKU_CHANGE = "makuChange";
saru.Const.MAKU_END = "makuEnd";
saru.Const.VISUAL_HIT_ANIM_END = "visualHitAnimEnd";
saru.Const.HERO_HIT_ANIM_END = "heroHitAnimEnd";


saru.Const.TYPE_DEF = "typeDef";
saru.Const.TYPE_KAMIKAZE = "typeKamikaze";
saru.Const.TYPE_SHOURYU = "typeShouryu";
saru.Const.TYPE_MISSILE = "typeMissile";
saru.Const.TYPE_FUWAFUWA_X = "typeFuwafuwaX";
saru.Const.TYPE_FUWAFUWA_Y = "typeFuwafuwaY";
