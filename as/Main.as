package  {
	
	import flash.display.MorphShape;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class Main extends MovieClip implements IScene
	{
		private const MAX_ENEMY:int=Const.MAX_ENEMY;
		private const MAX_HERO_TAMA:int=Const.MAX_HERO_TAMA;
		
		//弾を撃つかどうか？
		private var _isShot:Boolean=false;
		
		//スコア系
		private var _score:Number = 0;
		
		//敵が出るタイマー
		private var _enemyProduceTimer:Timer;
		
		//時間カウント
		private const GAME_TIME:int=Const.GAME_TIME;
		private var _currentTime:int=GAME_TIME;
		
		
		//インスタンス系
		private var _hero:Hero;
		
		private var _container:Sprite;
		private var _timeBar:MovieClip;
		
		//敵の配列
		private var _enemyList:Array=[];
		//自分の弾丸の配列
		private var _heroTamaList:Array=[];
		
		/**
		 * コンストラクタ
		 */
		public function Main() {
			
			_init();
		}
		
		private function _init():void
		{
			//最初の一回だけでの処理を記載
			
			
			this.visible = false;
			
			//自分
			this._hero = new Hero();
			this._hero.addEventListener(Const.HERO_HIT_ANIM_END,_onHeroHitAnimEnd);
			
			//インスタンスを先に生成
			var _bg:MovieClip=new BG();
			this.addChild(_bg);
			
			_container=new Sprite();
			this.addChild(_container);
			
			for(var i:int=0;i<MAX_ENEMY;i++)
			{
				var _currentEnemy:Enemy=new Enemy(this._hero,i);
				_container.addChild(_currentEnemy);
				_enemyList.push(_currentEnemy);
			}
			
			
			for(var k:int=0;k<MAX_HERO_TAMA;k++)
			{
				var _currentHeroTama:HeroTama=new HeroTama();
				_container.addChild(_currentHeroTama);
				_heroTamaList.push(_currentHeroTama);
			}
			
			//自分
			_container.addChild(_hero);
			
			_timeBar=new TimeBar();
			_container.addChild(_timeBar);
			
			
			
		}
		
		/**
		 * ゲーム開始
		 */
		public function start():void
		{
			//===================================================//
			//最初にリセット
			//===================================================//
			
			//ショット
			_isShot=false;
			
			//スコア
			_score=0;
			
			//タイマーをリスタート
			_enemyProduceTimer=new Timer(Const.ENEMY_PRODUCE_TIME);
			_enemyProduceTimer.addEventListener(TimerEvent.TIMER,_timerHandler);
			_enemyProduceTimer.start();
			
			//時間制限
			_currentTime=GAME_TIME;
			_timeBar["time_bar"].scaleX=1;
			
			//インスタンスの状態を初期化

//			this._hero.reset(Const.WIDTH/2,Const.HEIGHT/2);
			this._hero.reset(0,Const.HEIGHT/2);
			
			for(var i:int=0;i<MAX_ENEMY;i++)
			{
				var _currentEnemy:Enemy=_enemyList[i];
				_currentEnemy.sleep();
			}
			for(var k:int=0;k<MAX_HERO_TAMA;k++)
			{
				var _currentHeroTama:HeroTama=_heroTamaList[k];
				_currentHeroTama.sleep();
			}
			
			
			
			//イベント追加
			this.addEventListener(Event.ENTER_FRAME, _step);
			this.addEventListener(MouseEvent.MOUSE_DOWN,_mouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP,_mouseUpHandler);
			
			//この画面を表示
			this.visible = true;
			
		}
		
		private function _mouseDownHandler(e:MouseEvent):void
		{
			_heroShot(this._hero.x,this._hero.y);
			_isShot=true;
		}
		
		private function _mouseUpHandler(e:MouseEvent):void
		{
			_isShot=false;
		}
		
		
		
		private function _heroShot(myX:Number,myY:Number):void
		{
			for(var i:int=0;i<MAX_HERO_TAMA;i++)
			{
				var _currentHeroTama:HeroTama=_heroTamaList[i];
				if(_currentHeroTama.isReady==true)
				{
					
					if(Utils.getRandom(2)==0)
					{
						_currentHeroTama.activate(myX,myY,0);
					}else
					{
						_currentHeroTama.activate(myX,myY,1);
					}
					
					break;
				}
				
			}
		}
		
		
		private function _produceEnemy():void
		{
			for(var i:int=0;i<MAX_ENEMY;i++)
			{
				var _currentEnemy:Enemy=_enemyList[i];
				if(_currentEnemy.isReady==true)
				{
					
					var ran:int=Utils.getRandom(6);
					
					
					if(ran==0)
					{
						
						_currentEnemy.spawn(-10,Utils.getRandom(Const.HEIGHT),Enemy.TYPE_DEF);
						
					}else if(ran==1)
					{
						_currentEnemy.spawn(Const.WIDTH+10,Utils.getRandom(Const.HEIGHT),Enemy.TYPE_KAMIKAZE,this._hero.x,this._hero.y);
						
						
					}else if(ran==2)
					{
						_currentEnemy.spawn(-10,Utils.getRandom(Const.HEIGHT),Enemy.TYPE_MISSILE);
						
						
					}else if(ran==3)
					{
						_currentEnemy.spawn(Utils.getRandom(Const.WIDTH),Const.HEIGHT+10,Enemy.TYPE_SHOURYU);
						
					}else if(ran==4)
					{
						_currentEnemy.spawn(Utils.getRandom(Const.WIDTH),-10,Enemy.TYPE_FUWAFUWA_X,this._hero.x,this._hero.y);
						
					}else if(ran==5)
					{
						_currentEnemy.spawn(Const.WIDTH+10,Utils.getRandom(Const.HEIGHT),Enemy.TYPE_FUWAFUWA_X,this._hero.x,this._hero.y);
						
					}
					
					break;
				}
			}
		}
		
		
		
		private function _timerHandler(e:TimerEvent):void
		{
			//後半は増える
			if(this._currentTime>GAME_TIME*0.8)
			{
				
				_produceEnemy();
				
			}else　if(this._currentTime>GAME_TIME*0.6)
			{
				
				_produceEnemy();
				_produceEnemy();
				
			}else　if(this._currentTime>GAME_TIME*0.4)
			{
				
				_produceEnemy();
				_produceEnemy();
				_produceEnemy();
			}else　if(this._currentTime>GAME_TIME*0.2)
			{
				
				_produceEnemy();
				_produceEnemy();
				_produceEnemy();
				_produceEnemy();
			}else
			{
				
				_produceEnemy();
				_produceEnemy();
				_produceEnemy();
				_produceEnemy();
				_produceEnemy();
			}
			
		}
		
		
		private function _step(e:Event):void
		{
			
			//打ちっ放し判定
			if(_isShot==true&&(_currentTime%3==0))
			{
				_heroShot(this._hero.x,this._hero.y);
			}
			
			
			//時間制限
			_currentTime--;
			
			if(_currentTime<=0)
			{			
				//trace("タイムアップ");
				_onTimeupEnd();
			}else
			{
				_timeBar["time_bar"].scaleX=(_currentTime/GAME_TIME);
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
			
			var _currentEnemy:Enemy;
			var _currentHeroTama:HeroTama;
			
			for(var i:int=0;i<MAX_ENEMY;i++)
			{
				_currentEnemy=_enemyList[i];
				
				if(_hitTest(_currentEnemy,this._hero))
				{
					trace("自分にあたった");
					if(!Const.DEBUG)_onLoseEnd();
					
				}
				
				for(var j:int=0;j<MAX_HERO_TAMA;j++)
				{
					_currentHeroTama=_heroTamaList[j];
					
					if(_hitTest(_currentEnemy,_currentHeroTama))
					{
						
						if(_currentEnemy.isActive==true&&_currentHeroTama.isActive==true)
						{
							//trace("敵に自分の弾丸があたった");
							_score++;
							//trace(this+"スコア： "+_score);
							_currentEnemy.hit();
							_currentHeroTama.hit();
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
			var _bool:Boolean;
			var _val1:Number = (objA.x - objB.x) * (objA.x - objB.x) + (objA.y - objB.y) * (objA.y - objB.y);
			var _val2:Number = (objA.radius + objB.radius) * (objA.radius + objB.radius);
			
			
			if (_val1 <= _val2)
			{
				_bool=true;
			}
			else
			{
				_bool=false;
			}
			
			return _bool;
			
		}
		
		private function _onTimeupEnd():void
		{
			_onEnd();
			this.dispatchEvent(new Event(Const.MAIN_END));
		}
		private function _onLoseEnd():void
		{
			_hero.hit();
			_onEnd();
		}
		
		
		/*終了の件は、演出に合わせて　要リファクタリング*/
		private function _onEnd():void
		{
			//タイマーをストップ
			_enemyProduceTimer.stop();
			_enemyProduceTimer.removeEventListener(TimerEvent.TIMER,_timerHandler);
			
			//イベント削除
			this.removeEventListener(Event.ENTER_FRAME, _step);
			this.removeEventListener(MouseEvent.MOUSE_DOWN,_mouseDownHandler);
			this.removeEventListener(MouseEvent.MOUSE_UP,_mouseUpHandler);
			
			
		}
		
		private function _onHeroHitAnimEnd(e:Event):void
		{
			//終了を通知
			this.dispatchEvent(new Event(Const.MAIN_END));
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
