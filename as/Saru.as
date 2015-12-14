package {

	import flash.display.MovieClip;
	import flash.events.Event;

	public class Saru extends MovieClip {
		
		private var pre:Pre;
		private var main:Main;
		private var rule:Rule;
		private var result:Result;
		
		/**
		 * コンストラクタ
		 */
		public function Saru()
		{
			
			
			pre = new Pre();
			stage.addChild(pre);
			pre.addEventListener(Const.PRE_START_BT_CLICK, onPreStartHandler);
			
			main = new Main();
			stage.addChild(main);
			main.addEventListener(Const.MAIN_END, onMainEndHandler);
			
			rule = new Rule();
			rule.addEventListener(Const.RULE_START, onRuleStartHandler);
			
			result = new Result();
			result.addEventListener(Const.RESULT_REPLAY, onResultReplayHandler);
			
			pre.start();
		}
		
		private function onPreStartHandler(e:Event):void
		{
			pre.end();
			main.start();
		}
		
		private function onMainEndHandler(e:Event):void
		{
			
		}
		
		private function onRuleStartHandler(e:Event):void
		{
		}
		
		private function onResultReplayHandler(e:Event):void
		{
		}
		
	}

}