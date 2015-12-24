package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemy extends GameItemSuper
	{
		private var _speed:Number=10;
		private var _terminalX:Number;
		private var _terminalY:Number;
		private var _enemyType:String;
		
		public static const TYPE_DEF:String="typeDef";
		public static const TYPE_KAMIKAZE:String="typeKamikaze";
		
		public function Enemy()
		{
			super();
		
		}
		
		override protected function init():void
		{
			_radius=25;
			visual=new HitsujiVisual();
			this.addChild(visual);
			visual.addEventListener(Const.HIT_ANIM_END,onReset);
		}
		
		private function onReset(e:Event):void
		{
			visual.gotoAndStop("ldef");
			this.sleep();
		}
		
		override protected function _step():void
		{
			if(true)
//			if(_enemyType==TYPE_DEF)
			{
			
				this.x-=_speed;
				
				
			}else if(_enemyType==TYPE_KAMIKAZE)
			{
				this.x+=(_terminalX-this.x)/15;
				this.y+=(_terminalY-this.y)/15;
				
				if(Math.abs(this.x-_terminalX)<10&&Math.abs(this.y-_terminalY)<10)
				{
					_terminalX=Utils.getRandom(Const.WIDTH);
					_terminalY=Utils.getRandom(Const.HEIGHT);
				}
			}
			
		}
		
		override protected function _hit():void
		{
			visual.gotoAndPlay("lhit");
		}
		
		
		override public function activate(myX:Number,myY:Number):void
		{
			this.x=myX;
			this.y=myY;
			
			

			_isActive=true;
			
			//			if(Utils.getRandom(2)==0)
			//			{
			//				_speedX=_mySpeed;
			//			}else
			//			{
			//				_speedX=-_mySpeed;
			//			}
		}
		
		public function setEnemyType(enemyType:String,terminalX:Number=0,terminalY:Number=0):void
		{
			
			_enemyType=enemyType;
			_terminalX=terminalX;
			_terminalY=terminalY;
		}
		
		
		
	}
}