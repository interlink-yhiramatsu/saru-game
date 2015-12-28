package
{
	import flash.display.MovieClip;
	
	public class Score extends MovieClip
	{
		
		private var _score:Number = 0;
		private var _hitNum:Number = 0;
		
		/**
		 * コンストラクタ
		 */
		public function Score()
		{
		}
		
		/**
		 * スコアのゲッター
		 */
		public function get score():Number
		{
			return _score;
		}

		/**
		 * スコアのセッター
		 */
		public function set score(value:Number):void
		{
			_score = value;
		}
		
		
		/**
		 * 
		 */
//		public function get hitNum():Number
//		{
//			return _hitNum;
//		}
//		
//				
//		public function set hitNum(value:Number):void
//		{
//			_hitNum = value;
//		}
//		
		
	}
}