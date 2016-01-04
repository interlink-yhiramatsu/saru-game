package
{
	public class Const
	{
		//Canvas用にするどー
		public static const DEBUG:Boolean=false;
		public static const VERSION:String="2016.01.04:1.1";
		public static const AUTHOR:String="higeguma";
		
		/*ゲームの基本設定*/
		
		//画面のサイズ
		public static const WIDTH:Number=700;
		public static const HEIGHT:Number=450;
		
		//１ゲームの時間
		public static const GAME_TIME:int=2000;
		
		//敵の数の上限
		public static const MAX_ENEMY:int=50;
		//敵の最初の出現頻度
		public static const ENEMY_PRODUCE_TIME:int=700;
		//自分の弾丸の上限
		public static const MAX_HERO_TAMA:int=15;
		//自分の弾丸のスピード
		public static const HERO_TAMA_SPEED:Number=15;
		
		/*共用の定数*/
		
		//イベント名を定義
		public static const PRE_START_BT_CLICK:String = "preStartBtClick";
		public static const MAIN_END:String = "mainEnd";
		public static const RESULT_REPLAY:String = "resultReplay";
		public static const MAKU_CHANGE:String = "makuChange";
		public static const MAKU_END:String = "makuEnd";
		public static const VISUAL_HIT_ANIM_END:String = "visualHitAnimEnd";
		public static const HERO_HIT_ANIM_END:String = "heroHitAnimEnd";
		
		
		
	}
}