package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import a24.tween.Tween24;
	
	public class Pre
	{	
		
		public var container:MovieClip=new PreVisual();
		private var _btStart:MovieClip;

		public function Pre()
		{
			_init();
			
		}
		
		private function _init() :void
		{
			_btStart=container["start_bt"];
			_btStart.buttonMode=true;
			_btStart.addEventListener(MouseEvent.CLICK, _clickHandler);
			_btStart.addEventListener(MouseEvent.ROLL_OVER, _overHandler);
			_btStart.addEventListener(MouseEvent.ROLL_OUT, _outHandler);
		}
		
		private function _clickHandler(e:MouseEvent):void
		{
			container.dispatchEvent(new Event(Const.PRE_START_BT_CLICK)); //イベントを発信
		}
		
		private function _overHandler(e:MouseEvent):void
		{
			Tween24.tween(_btStart,0.2).bright(1.5).play();
		}
		private function _outHandler(e:MouseEvent):void
		{
			Tween24.tween(_btStart,0.1).bright(0).play();
		}
		
		
		/**
		 * 画面を表示する
		 */
		public function start():void
		{
			container.visible = true;
		}
		
		/**
		 * 画面を非表示する
		 */
		public function end():void
		{
			container.visible = false;
		}
		
	}
}