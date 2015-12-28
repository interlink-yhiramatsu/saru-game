package {

	import flash.display.MovieClip;
	import flash.events.Event;

	public class Saru extends MovieClip {
		
		private var _pre:Pre;
		private var _main:Main;
		//private var rule:Rule;
		private var _result:Result;
		
		/**
		 * コンストラクタ
		 */
		public function Saru()
		{
			_init();
		}
		
		private function _init():void
		{
			_pre = new Pre();
			stage.addChild(_pre);
			_pre.addEventListener(Const.PRE_START_BT_CLICK, _onPreStartHandler);
			
			_main = new Main();
			stage.addChild(_main);
			_main.addEventListener(Const.MAIN_END, _onMainEndHandler);
			
			//			rule = new Rule();
			//			rule.addEventListener(Const.RULE_START, onRuleStartHandler);
			
			_result = new Result();
			stage.addChild(_result);
			_result.addEventListener(Const.RESULT_REPLAY, _onResultReplayHandler);
			
			_pre.start();
		}
		
		private function _onPreStartHandler(e:Event):void
		{
			_pre.end();
			_main.start();
		}
		
		private function _onMainEndHandler(e:Event):void
		{
			_main.end();
			_result.start();
			_result.showScore(_main.score);
		}
		
//		private function onRuleStartHandler(e:Event):void
//		{
//			
//		}
		
		private function _onResultReplayHandler(e:Event):void
		{
			_main.start();
			_result.end();
		}
		
	}

}