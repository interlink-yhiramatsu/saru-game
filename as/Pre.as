package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Pre extends MovieClip
	{	
		
		private var _btStart:MovieClip;
		
		
		/**
		 * コンストラクタ
		 */
		public function Pre()
		{
			_init();

		}
		
		private function _init() :void
		{
			_btStart=this["start_bt"]
			_btStart.addEventListener(MouseEvent.CLICK, _clickHandler);
		}
	
		private function _clickHandler(e:MouseEvent):void
		{
			this.dispatchEvent(new Event(Const.PRE_START_BT_CLICK)); //イベントを発信
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