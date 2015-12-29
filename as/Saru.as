package {

	import flash.display.MovieClip;
	import flash.events.Event;

	public class Saru extends MovieClip {
		
		private var _pre:Pre;
		private var _main:Main;
		//private var rule:Rule;
		private var _result:Result;
		private var _maku:MovieClip;
		
		
		private var _status:int=0;
		
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
			_pre.addEventListener(Const.PRE_START_BT_CLICK, _sceneChange);
			
			_main = new Main();
			stage.addChild(_main);
			_main.addEventListener(Const.MAIN_END, _sceneChange);
			
			//			rule = new Rule();
			//			rule.addEventListener(Const.RULE_START, onRuleStartHandler);
			
			_result = new Result();
			stage.addChild(_result);
			_result.addEventListener(Const.RESULT_REPLAY, _sceneChange);
			
			
			//演出用の幕
			_maku=new Maku();
			stage.addChild(_maku);
			
			
			_maku.addEventListener(Const.MAKU_CHANGE, _onMakuChangeHandler);
			//_maku.addEventListener(Const.MAIN_END, _onMakuEndHandler);
			
			_pre.start();
		}
		
		private function _sceneChange(e:Event):void
		{
			_maku.gotoAndPlay("lplay");
		}
		
		private function _onMakuChangeHandler(e:Event):void
		{
			if(_status==0)
			{
				_pre.end();
				_main.start();
				_status=1;
			}else if(_status==1)
			{
				_main.end();
				_result.start();
				_result.showScore(_main.score);
				_status=2;
			}else if(_status==2)
			{
				_main.start();
				_result.end();
				_status=1;
			}
		}
		
//		private function _onPreStartHandler(e:Event):void
//		{
//			_pre.end();
//			_main.start();
//		}
//		
//		private function _onMainEndHandler(e:Event):void
//		{
//			_main.end();
//			_result.start();
//			_result.showScore(_main.score);
//		}
		
//		private function onRuleStartHandler(e:Event):void
//		{
//			
//		}
		
//		private function _onResultReplayHandler(e:Event):void
//		{
//			_main.start();
//			_result.end();
//		}
		

		
	}

}