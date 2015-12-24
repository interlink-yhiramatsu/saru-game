package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class Main extends MovieClip implements IScene
	{
		
		//上限
		private const MAX_ENEMY:int=30;
		private const MAX_HERO_TAMA:int=5;
		//未実装
		//private const MAX_ENEMY_TAMA:int=100;
		
		//スコア系
		private var _score:Number = 0;
		
		//敵が出るタイマー
		private var _enemyProduceTimer:Timer;
		
		//時間カウント
		private const TIME:int=300;
		private var time:int=TIME;
		
		
		//インスタンス系
		private var _hero:Hero;
		
		/*注意！！　配列は作り替えないよ*/
		//敵の配列
		private var _enemyList:Array=[];
		//自分の弾丸の配列
		private var _heroTamaList:Array=[];
		
		//敵の弾丸の配列　未実装
		//private var _enemyTamaList:Array=[];
		
		
		/**
		 * コンストラクタ
		 */
		public function Main() {
			
			init();
		}
		
		private function init():void
		{
			this.visible = false;
			
			//インスタンスを先に生成
			
			//自分の初期配置
			this._hero = new Hero();
			this._hero.x=Const.WIDTH/2;
			this._hero.y=Const.HEIGHT/2;
			this.addChildAt(_hero,1);
			
			
			for(var i:int=0;i<MAX_ENEMY;i++)
			{
				var enemy:Enemy=new Enemy();
				this.addChildAt(enemy,1);
				_enemyList.push(enemy);
			}
			
			
			for(var k:int=0;k<MAX_HERO_TAMA;k++)
			{
				var heroTama:HeroTama=new HeroTama();
				this.addChildAt(heroTama,1);
				_heroTamaList.push(heroTama);
			}
			
			
			//			for(var j:int=0;j<MAX_ENEMY_TAMA;j++)
			//			{
			//				var enemyTama:EnemyTama=new EnemyTama();
			//				this.addChild(enemyTama);
			//				_enemyTamaList.push(enemyTama);
			//			}
			
			
		}
		
		/**
		 * ゲーム開始
		 */
		public function start():void
		{
			//この画面を表示
			this.visible = true;
			
			
			
			//タイマー追加
			_enemyProduceTimer=new Timer(1000);
			_enemyProduceTimer.addEventListener(TimerEvent.TIMER,_timerHandler);
			_enemyProduceTimer.start();
			
			//時間制限
			time=TIME;
			this["time_bar"].scaleX=1;
			
			//イベント追加
			this.addEventListener(Event.ENTER_FRAME, _step);
			this.addEventListener(MouseEvent.MOUSE_DOWN,_mouseDownHandler);
			
		}
		
		private function _mouseDownHandler(e:MouseEvent):void
		{
			_heroShot(this._hero.x,this._hero.y);
		}
		
		private function _heroShot(myX:Number,myY:Number):void
		{
			for(var i:int=0;i<MAX_HERO_TAMA;i++)
			{
				var heroTama:HeroTama=_heroTamaList[i];
				if(heroTama.isActive==false)
				{
					heroTama.activate(myX,myY);
					break;
				}
				
			}
		}
		
		
		private function _produceEnemy():void
		{
			for(var i:int=0;i<MAX_ENEMY;i++)
			{
				var enemy:Enemy=_enemyList[i];
				if(enemy.isActive==false)
				{
					enemy.activate(Const.WIDTH,Utils.getRandom(Const.HEIGHT));
					
					if(Utils.getRandom(2)==0)
					{
						enemy.setEnemyType(Enemy.TYPE_DEF);
					}else
					{
						enemy.setEnemyType(Enemy.TYPE_KAMIKAZE,this._hero.x,this._hero.y);
					}
					
					
					break;
				}
				
			}
		}
		
		
		
		private function _timerHandler(e:TimerEvent):void
		{
			_produceEnemy();
		}
		
		
		private function _step(e:Event):void
		{
			
			//時間制限
			time--;
			
			if(time<=0)
			{			
				trace("タイムアップ");
			}else
			{
				this["time_bar"].scaleX=(time/TIME);
			}
			
			/*最初にまとめて移動*/
			
			//自分の移動
			this._hero.step();
			//自分の弾丸の移動
			_heroTamaList.forEach(__step);
			//羊の移動
			_enemyList.forEach(__step);
			
			/*まとめて画面外判定*/
			
			//弾丸の画面外判定
			_heroTamaList.forEach(__outTest);
			//敵の画面外判定
			_enemyList.forEach(__outTest);
			
			
			/*衝突判定*/
			
			//敵と自分の弾丸の判定&敵と自分の衝突判定
			
			var currentEnemy:Enemy;
			var currentHeroTama:HeroTama;
			
			for(var i:int=0;i<MAX_ENEMY;i++)
			{
				currentEnemy=_enemyList[i];
				
				if(_hitTest(currentEnemy,this._hero))
				{
					//trace("自分にあたった");
				}
				
				for(var j:int=0;j<MAX_HERO_TAMA;j++)
				{
					currentHeroTama=_heroTamaList[j];
					
					if(_hitTest(currentEnemy,currentHeroTama))
					{
						
						if(currentEnemy.isActive==true&&currentHeroTama.isActive==true)
						{
							//trace("敵に自分の弾丸があたった");
							currentEnemy.hit();
							currentHeroTama.hit();
						}
					}
				}
			}
		}
		
		private function __step(item:IStepItem,index:int, array:Array):void
		{
			item.step();
		}
		
		private function __outTest(item:GameItemSuper,index:int, array:Array):void
		{
			if(item.outTest(Const.WIDTH,Const.HEIGHT))
			{
				item.sleep();
			}
		}
		
		
		
		
		private function _hitTest(objA:MovieClip, objB:MovieClip):Boolean
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
