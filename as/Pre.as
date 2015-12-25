package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Pre extends MovieClip
	{	
		
		private var btStart:MovieClip;
		
		
		/**
		 * コンストラクタ
		 */
		public function Pre()
		{
			_init();

		}
		
		private function _init() :void
		{
			btStart=this["start_bt"]
			btStart.addEventListener(MouseEvent.CLICK, clickHandler);
		}
	
		private function clickHandler(e:MouseEvent):void
		{
			var bt:MovieClip = MovieClip(e.currentTarget);
			bt.removeEventListener(MouseEvent.CLICK, clickHandler);
//			bt.visible = false; //インスタンスの非表示
			this.dispatchEvent(new Event(Const.PRE_START_BT_CLICK)); //イベントを発信
		}

		/**
		 * 初期化
		 */
		private function init():void
		{
			this.visible = false;
		}
		
		/**
		 * 画面を表示する
		 */
		public function start():void
		{
			this.visible = true;
			//this.dispatchEvent(new Event(Const.PRE_START_BT_CLICK)); //スタートボタンを押したことを発信する
		}
		
		/**
		 * 画面を非表示する
		 */
		public function end():void
		{
			this.visible = false;
		}
		
	}
}