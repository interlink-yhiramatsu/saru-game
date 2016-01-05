package {

	import flash.display.MovieClip;
	import flash.events.Event;

	public class Saru extends MovieClip {
		
		private var _pre:Pre;
		private var _main:Main;
		private var _result:Result;
		private var _maku:MovieClip;
		
		
		private var _sceneStatus=0;
		
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
			stage.addChild(_pre.container);
			_pre.container.addEventListener(Const.PRE_START_BT_CLICK, _sceneChange);
			
			_main = new Main();
			stage.addChild(_main.container);
			_main.container.addEventListener(Const.MAIN_END, _sceneChange);

			_result = new Result();
			stage.addChild(_result.container);
			_result.container.addEventListener(Const.RESULT_REPLAY, _sceneChange);
			
			
			//演出用の幕
			_maku=new Maku();
			stage.addChild(_maku);
			
			_maku.addEventListener(Const.MAKU_CHANGE, _onMakuChangeHandler);
			
			_pre.start();
		}
		
		private function _sceneChange(e:Event):void
		{
			_maku.gotoAndPlay("lplay");
		}
		
		private function _onMakuChangeHandler(e:Event):void
		{
			if(_sceneStatus==0)
			{
				_pre.end();
				_main.start();
				_sceneStatus=1;
			}else if(_sceneStatus==1)
			{
				_main.end();
				_result.start();
				_result.showScore(_main.score);
				_sceneStatus=2;
			}else if(_sceneStatus==2)
			{
				_main.start();
				_result.end();
				_sceneStatus=1;
			}
		}

		
	}

}