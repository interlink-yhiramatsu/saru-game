package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import a24.tween.Tween24;
	
	public class Result
	{
		
		public var container:MovieClip=new ResultVisual();
		private var _btReplay:MovieClip;
		private var _currentScore=0;
		
		public function Result()
		{
			container.visible=false;
			_btReplay=container["replay_bt"];
			_btReplay.buttonMode=true;
			_btReplay.addEventListener(MouseEvent.CLICK, _clickHandler);
			_btReplay.addEventListener(MouseEvent.ROLL_OVER, _overHandler);
			_btReplay.addEventListener(MouseEvent.ROLL_OUT, _outHandler);
		}
		
		public function start():void
		{
			container.visible=true;
		}
		public function showScore(score):void
		{
			_currentScore=score;
			
			//けた揃えして、MCを動かす
			if(_currentScore>999)_currentScore=999;
			var _scoreStr=("00"+_currentScore).slice(-3);
			
			//trace(_scoreStr);
			container["suji_0"].gotoAndStop(Number(_scoreStr.charAt(0))+1);
			container["suji_1"].gotoAndStop(Number(_scoreStr.charAt(1))+1);
			container["suji_2"].gotoAndStop(Number(_scoreStr.charAt(2))+1);
			
			container.visible=true;
			
		}
		
		private function _overHandler(e:MouseEvent):void
		{
			Tween24.tween(_btReplay,0.2).bright(1.5).play();
		}
		private function _outHandler(e:MouseEvent):void
		{
			Tween24.tween(_btReplay,0.1).bright(0).play();
		}
		
		
		private function _clickHandler(e:MouseEvent):void
		{
			container.dispatchEvent(new Event(Const.RESULT_REPLAY)); //イベントを発信
		}
		
		public function end():void
		{
			container.visible=false;
		}
	}
}