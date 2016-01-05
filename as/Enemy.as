package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemy
	{
		
		/*===========================================*/
		//ここから　　Enemy特有
		/*===========================================*/
		private var _speed:Number=10;
		private var _terminalX:Number;
		private var _terminalY:Number;
		private var _enemyType:String;
		private var _traceTarget:MovieClip;
		public static const TYPE_DEF:String="typeDef";
		public static const TYPE_KAMIKAZE:String="typeKamikaze";
		public static const TYPE_SHOURYU:String="typeShouryu";
		public static const TYPE_MISSILE:String="typeMissile";
		public static const TYPE_FUWAFUWA_X:String="typeFuwafuwaX";
		public static const TYPE_FUWAFUWA_Y:String="typeFuwafuwaY";
		/*===========================================*/
		//ここまで　　Enemy特有
		/*===========================================*/
		
		//Canvas特有
		public var gameItemStatus:GameItemStatus;
		public var mc:MovieClip;
		
		public function Enemy(traceTarget:MovieClip)
		{
			_traceTarget=traceTarget;
			mc=new HitsujiVisual();
			gameItemStatus=new GameItemStatus(mc,25);
			
			
		}
		
		//override 
		private function _step():void
		{
			var _oldX:Number=mc.x;
			var _oldY:Number=mc.y;
			
			if(_enemyType==TYPE_DEF)
			{
				mc.x+=_speed;
				
			}else if(_enemyType==TYPE_KAMIKAZE)
			{
				mc.x+=(_terminalX-mc.x)/15;
				mc.y+=(_terminalY-mc.y)/15;
				
				if(Math.abs(mc.x-_terminalX)<10&&Math.abs(mc.y-_terminalY)<10)
				{
					_terminalX=Utils.getRandom(Const.WIDTH);
					_terminalY=Utils.getRandom(Const.HEIGHT);
				}
				//回転
				mc.rotation=_getRot(mc.x-_oldX,mc.y-_oldY);
				
				
			}else if(_enemyType==TYPE_MISSILE)
			{
				mc.x+=(_traceTarget.x-mc.x)/30;
				mc.y+=(_traceTarget.y-mc.y)/30;
				//回転
				mc.rotation=_getRot(mc.x-_oldX,mc.y-_oldY);
				
				
			}else if(_enemyType==TYPE_SHOURYU)
			{
				mc.x+=5;
				mc.y+=-5;
				
				//回転
				mc.rotation=_getRot(mc.x-_oldX,mc.y-_oldY);
				
			}else if(_enemyType==TYPE_FUWAFUWA_X)
			{
				mc.x+=(_traceTarget.x-mc.x)/(Utils.getRandom(20)+20);
				mc.y+=(_terminalY-mc.y)/30;
				//回転
				mc.rotation=_getRot(mc.x-_oldX,mc.y-_oldY);
				
			}else if(_enemyType==TYPE_FUWAFUWA_Y)
			{
				mc.x+=(_terminalX-mc.x)/30;
				mc.y+=(_traceTarget.y-mc.y)/(Utils.getRandom(20)+20);
				
				//回転
				mc.rotation=_getRot(mc.x-_oldX,mc.y-_oldY);
				
			}
		}
		
		private function _getRot(diffX:Number,diffY:Number):Number
		{
			return ((Math.atan2(diffY,diffX))* 180 / Math.PI)%360;
		}
		
		public function spawn(myX:Number,myY:Number,type:String,terminalX:Number=0,terminalY:Number=0):void
		{
			activate(myX,myY);
			_enemyType=type;
			_terminalX=terminalX;
			_terminalY=terminalY;
			
		}
		
		
		
		
		/*===========================================*/
		//ここからは共通
		/*===========================================*/
		
		public function activate(myX:Number,myY:Number,type:int=0) :void
		{
			gameItemStatus.activate(myX,myY,type);
		}
		
		public function sleep() :void
		{
			gameItemStatus.sleep();
		}
		
		public function getIsActive():Boolean
		{
			return gameItemStatus.getIsActive();
		}
		
		public function getIsReady():Boolean
		{
			return gameItemStatus.getIsReady();
		}
		public function hit() :void
		{
			gameItemStatus.hit();
		}
		
		public function step():void
		{
			if(gameItemStatus.getIsActive())
			{
				_step();
			}
		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			return gameItemStatus.outTest(w,h);
		}
		
		public function circleHitTest(targetStatus:GameItemStatus):Boolean
		{
			return gameItemStatus.circleHitTest(targetStatus);
		}
		
		/*===========================================*/
		//ここまでは共通
		/*===========================================*/
	}
}