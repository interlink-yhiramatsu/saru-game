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
		public static const TYPE_FUWAFUWA_X:String="typeFuwafuwaX";
		public static const TYPE_FUWAFUWA_Y:String="typeFuwafuwaY";
		
		// テスト用
		public var _index:int;
		
		public function Enemy(traceTarget:MovieClip,index:int)
		{
			_traceTarget=traceTarget;
			_index=index;
			
			super();
		
		}
		
		override protected function _init():void
		{
			_radius=25;
			_visual=new HitsujiVisual();
			this.addChild(_visual);
			_visual.addEventListener(Const.VISUAL_HIT_ANIM_END,_onReset);
			
		}
		
		
		override protected function _step():void
		{
			var _oldX:Number=this.x;
			var _oldY:Number=this.y;
			
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
				this.rotation=_getRot(this.x-_oldX,this.y-_oldY);

				
			}else if(_enemyType==TYPE_MISSILE)
			{
				this.x+=(this._traceTarget.x-this.x)/30;
				this.y+=(this._traceTarget.y-this.y)/30;
				//回転
				this.rotation=_getRot(this.x-_oldX,this.y-_oldY);
				
				
			}else if(_enemyType==TYPE_SHOURYU)
			{
				this.x+=5;
				this.y+=-5;
				
				//回転
				this.rotation=_getRot(this.x-_oldX,this.y-_oldY);
				
			}else if(_enemyType==TYPE_FUWAFUWA_X)
			{
				this.x+=(this._traceTarget.x-this.x)/(Utils.getRandom(20)+20);
				this.y+=(this._terminalY-this.y)/30;
				//回転
				this.rotation=_getRot(this.x-_oldX,this.y-_oldY);
				
			}else if(_enemyType==TYPE_FUWAFUWA_Y)
			{
				this.x+=(this._terminalX-this.x)/30;
				this.y+=(this._traceTarget.y-this.y)/(Utils.getRandom(20)+20);
				
				//回転
				this.rotation=_getRot(this.x-_oldX,this.y-_oldY);
				
			}
			
		}
		
		private function _getRot(diffX:Number,diffY:Number):Number
		{
			return ((Math.atan2(diffY,diffX))* 180 / Math.PI)%360;
		}
		
		public function spawn(myX:Number,myY:Number,type:String,terminalX:Number=0,terminalY:Number=0):void
		{
			super.activate(myX,myY);
			_enemyType=type;
			_terminalX=terminalX;
			_terminalY=terminalY;

		}
	}
}