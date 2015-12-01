package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Main extends MovieClip {
		
		//スコア系
		private var _score:Number = 0;
		
		//インスタンス系
		private var _hero:Hero;
		
		
		/**
		 * コンストラクタ
		 */
		public function Main() {
//			if(stage)
//			{
//				onStage();
//			}else
//			{
//				this.addEventListener(Event.ADDED_TO_STAGE,onStage);
//			}
			
			init();
		}
		
		private function init():void
		{
			this.visible = false;
		}
		
		private function onStage(e:Event=null):void
		{
//			this.removeEventListener(Event.ADDED_TO_STAGE,onStage);
//			var btStart:MovieClip = this["bt_start"]; //ボタンのインスタンス
//			btStart.x = 0;
//			btStart.y = 0;
		}
		
		
		/**
		 * ゲーム開始
		 */
		public function start():void
		{
			this.visible = true;
			this._hero = new Hero();
			this.addChild(_hero);
			
//			this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			this.stage.addEventListener(Event.ENTER_FRAME, _step);
		}
		
		private function onMouseMoveHandler(e:MouseEvent):void
		{
			this._hero.x = stage.mouseX;
			this._hero.y = stage.mouseY;
		}
		
		private function _step(e:Event):void
		{
			this._hero.x = stage.mouseX;
			this._hero.y = stage.mouseY;
		}
		
		/**
		 * ゲーム終了
		 */
		public function end():void
		{
		
		}
		
		/**
		 * スコアを返す
		 */
		public function get score():Number
		{
			return _score;
		}
		
	}
	
}
