package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Main extends MovieClip {
		
		//スコア系
		private var _score:Number = 0;
		
		//インスタンス系
		private var _hero:Hero;
		
		//
		private var tamaList:Array=[];
		
		
		/**
		 * コンストラクタ
		 */
		public function Main() {

			init();
		}
		
		private function init():void
		{
			this.visible = false;
		}

		/**
		 * ゲーム開始
		 */
		public function start():void
		{
			this.visible = true;
			this._hero = new Hero();
			this._hero.x=Const.WIDTH/2;
			this._hero.y=Const.HEIGHT/2;
			
			this.addChild(_hero);

			
			//ターゲットはここ
			this.addEventListener(Event.ENTER_FRAME, _step);
			this.addEventListener(MouseEvent.CLICK,onClick);
			
	
		}
		
		private function onClick(e:MouseEvent):void
		{
			var tama:Tama=new Tama(this._hero.x,this._hero.y);
			this.addChild(tama);
			tamaList.push(tama);
			
		}
		
//		private function onMouseMoveHandler(e:MouseEvent):void
//		{
//			this._hero.x = stage.mouseX;
//			this._hero.y = stage.mouseY;
//		}
		
		private function _step(e:Event):void
		{
			this._hero.step(stage.mouseX,stage.mouseY);

			var tama:Tama;
			for(var i:int=0;i<tamaList.length;i++)
			{
				tama=tamaList[i];
				tama.step();
			}
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
