package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import a24.tween.Tween24;
	
	public class Result extends MovieClip implements IScene
	{
		
		private var _btReplay:MovieClip;
		private var _currentScore:int=0;
		
		public function Result()
		{
			this.visible=false;
			_btReplay=this["replay_bt"];
			_btReplay.buttonMode=true;
			_btReplay.addEventListener(MouseEvent.CLICK, _clickHandler);
			_btReplay.addEventListener(MouseEvent.ROLL_OVER, _overHandler);
			_btReplay.addEventListener(MouseEvent.ROLL_OUT, _outHandler);
		}
		
		public function start():void
		{
			this.visible=true;
		}
		public function showScore(score:int):void
		{
			_currentScore=score;
			
			//けた揃えして、MCを動かす
			if(_currentScore>999)_currentScore=999;
			var _scoreStr:String=("00"+_currentScore).slice(-3);
			
			//trace(_scoreStr);
			this["suji_0"].gotoAndStop(Number(_scoreStr.charAt(0))+1);
			this["suji_1"].gotoAndStop(Number(_scoreStr.charAt(1))+1);
			this["suji_2"].gotoAndStop(Number(_scoreStr.charAt(2))+1);
			
			
			this.visible=true;
			
			//trace(_currentScore);
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
			
			this.dispatchEvent(new Event(Const.RESULT_REPLAY)); //イベントを発信
		}
		
		public function end():void
		{
			this.visible=false;
		}
	}
}