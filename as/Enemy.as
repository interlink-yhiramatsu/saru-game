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
		
		private var _traceTarget:MovieClip;
		
		public static const TYPE_DEF:String="typeDef";
		public static const TYPE_KAMIKAZE:String="typeKamikaze";
		public static const TYPE_SHOURYU:String="typeShouryu";
		public static const TYPE_MISSILE:String="typeMissile";
		
		// テスト用
		public var _index:int;
		
		public function Enemy(traceTarget:MovieClip,index:int)
		{
			_traceTarget=traceTarget;
			_index=index;
			
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
			var oldX:Number=this.x;
			var oldY:Number=this.y;
			
			if(_enemyType==TYPE_DEF)
			{
				
				this.x+=_speed;
				
			}else if(_enemyType==TYPE_KAMIKAZE)
			{
				this.x+=(_terminalX-this.x)/15;
				this.y+=(_terminalY-this.y)/15;
				
				if(Math.abs(this.x-_terminalX)<10&&Math.abs(this.y-_terminalY)<10)
				{
					_terminalX=Utils.getRandom(Const.WIDTH);
					_terminalY=Utils.getRandom(Const.HEIGHT);
				}
				//回転
				this.rotation=((Math.atan2(this.y-oldY,this.x-oldX))* 180 / Math.PI)%360;
//				rot=rot%360;
//				this.rotation=rot;
//				if(this.x>=_traceTarget.x)
//				{
//					this.scaleX=-1;
//				}else
//				{
//					this.scaleX=1;
//				}
				
			}else if(_enemyType==TYPE_MISSILE)
			{
				this.x+=(this._traceTarget.x-this.x)/30;
				this.y+=(this._traceTarget.y-this.y)/30;
				//回転
				this.rotation=((Math.atan2(this.y-oldY,this.x-oldX))* 180 / Math.PI)%360;
				
				
			}else if(_enemyType==TYPE_SHOURYU)
			{
				this.x-=_speed/2;
				this.y-=_speed/2;
				
			}
			
			
		}
		
		override protected function _hit():void
		{
			visual.gotoAndPlay("lhit");
		}
		
		
//		override public function activate(myX:Number,myY:Number):void
//		{
//			this.x=myX-10;
//			this.y=myY;
//			_isActive=true;
//			_isReady=false;
//			
//		}
		
		override public function activate(myX:Number,myY:Number,type:String="",terminalX:Number=0,terminalY:Number=0):void
		{
			super.activate(myX,myY,type,terminalX,terminalY);
			_enemyType=type;
			_terminalX=terminalX;
			_terminalY=terminalY;

		}
		
//		public function setEnemyType(enemyType:String,terminalX:Number=0,terminalY:Number=0):void
//		{
//			_enemyType=enemyType;
//			_terminalX=terminalX;
//			_terminalY=terminalY;
//		}
//		
		
		
	}
}