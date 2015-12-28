package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Result extends MovieClip implements IScene
	{
		
		private var _btReplay:MovieClip;
		private var _currentScore:int=0;
		
		public function Result()
		{
			this.visible=false;
			_btReplay=this["replay_bt"]
			_btReplay.addEventListener(MouseEvent.CLICK, _clickHandler);
		}
		
		public function start():void
		{
			this.visible=true;
		}
		public function showScore(score:int):void
		{
			_currentScore=score;
			this.visible=true;
			
			trace(_currentScore);
		}

	
		private function _clickHandler(e:MouseEvent):void
		{

			this.dispatchEvent(new Event(Const.RESULT_REPLAY)); //イベントを発信
		}
		
		public function end():void
		{
			this.visible=false;
		}
	}
}