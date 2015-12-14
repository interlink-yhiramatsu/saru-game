package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Main extends MovieClip {
		
		//スコア系
		private var _score:Number = 0;
		
		//インスタンス系
		private var _hero:Hero;
		
		
		//敵の配列
		private var _enemyArray:Array=[];
		//弾丸の配列
		private var _tamaList:Array=[];
		
		
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
			//この画面を表示
			this.visible = true;
			
			//自分の初期配置
			this._hero = new Hero();
			this._hero.x=Const.WIDTH/2;
			this._hero.y=Const.HEIGHT/2;
			this.addChild(_hero);
			
			//敵の配置（仮）
			
			var enemy:Enemy=new Enemy();
			this.addChild(enemy);
			
			
			//イベント追加
			this.addEventListener(Event.ENTER_FRAME, _step);
			this.addEventListener(MouseEvent.MOUSE_DOWN,_mouseDownHandler);
	
		}
		
		private function _mouseDownHandler(e:MouseEvent):void
		{
			var tama:Tama=new Tama(this._hero.x,this._hero.y);
			this.addChild(tama);
			_tamaList.push(tama);
			
		}
		
		
		private function _step(e:Event):void
		{
			this._hero.step(stage.mouseX,stage.mouseY);

			var tama:Tama;
			for(var i:int=0;i<_tamaList.length;i++)
			{
				tama=_tamaList[i];
				tama.step();
			}
		}
		
		
		private function _arrayDelete(oldArray:Array):Array
		{
			var newArray:Array;
			
			//実装
			
			
			return newArray
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
