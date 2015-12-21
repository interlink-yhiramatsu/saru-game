package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class Main extends MovieClip {
		
		//スコア系
		private var _score:Number = 0;
		
		//敵が出るタイマー
		private var _timer:Timer;
		
		//インスタンス系
		private var _hero:Hero;
		
		
		//敵の配列
		private var _enemyList:Array=[];
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
			
			
			//タイマー追加
			_timer=new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER,_timerHandler);
			_timer.start();
			
			
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
		
		private function _timerHandler(e:TimerEvent):void
		{
			_produceEnemy();
		}
		
		
		private function _step(e:Event):void
		{
			
			//猿の移動
			this._hero.step(stage.mouseX,stage.mouseY);
			
			//弾丸の移動
			var tama:Tama;
			for(var i:int=0;i<_tamaList.length;i++)
			{
				tama=_tamaList[i];
				tama.step();
			}
			
			//羊の移動
			var enemy:Enemy;
			for(var j:int=0;j<_enemyList.length;j++)
			{
				enemy=_enemyList[j];
				enemy.step();
				
				//羊と弾丸の衝突判定
				for(var l:int=0;l<_tamaList.length;l++)
				{
					tama=_tamaList[i];
					tama.step();
				}
			}
			
			
			//弾丸の画面外判定
			_tamaList=_destroyIGameItems(_tamaList);
			
			//羊の画面外判定
			_enemyList=_destroyIGameItems(_enemyList);
			
			
			
		}
		
		
		private function _produceEnemy():void
		{
			var enemy:Enemy=new Enemy(Utils.getRandom(Const.WIDTH),Utils.getRandom(Const.HEIGHT));
			this.addChild(enemy);
			_enemyList.push(enemy);
		}
		
		
		private function _destroyIGameItems(oldArray:Array,type:String):Array
		{
			var newArray:Array=[];
			var iGameItem:IGameItem;
			
			for(var i:int=0;i<oldArray.length;i++)
			{
				iGameItem=oldArray[i];
				
				if(type=="out")
				{
					if(iGameItem.outTest(Const.WIDTH,Const.HEIGHT))
					{
						//はみ出ている場合はtrue
						iGameItem.destroy();
					}else
					{
						newArray.push(iGameItem);
					}
				}else if(type=="hit")
				{
					if(iGameItem.outTest(Const.WIDTH,Const.HEIGHT))
					{
						//はみ出ている場合はtrue
						iGameItem.destroy();
					}else
					{
						newArray.push(iGameItem);
					}
				}
			}
			
			return newArray
		}
		
		private function _hitTest(objA:MovieClip, objB:MovieClip)
		{
			var bool:Boolean;
			var val1:Number = (objA.x - objB.x) * (objA.x - objB.x) + (objA.y - objB.y) * (objA.y - objB.y);
			var val2:Number = (objA.radius + objB.radius) * (objA.radius + objB.radius);
			
			
			if (val1 <= val2)
			{
				bool=true;
			}
			else
			{
				bool=false;
			}
			
			return bool;
			
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
