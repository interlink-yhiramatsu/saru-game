package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class GameItemStatus
	{
		private var _isActive:Boolean=false;
		private var _isReady:Boolean=true;
		private var _radius:Number=0;
		
		public var mc:MovieClip;
		
		public function GameItemStatus(targetMC:MovieClip,radius:Number)
		{
			mc=targetMC;
			_radius=radius;
			mc.addEventListener(Const.VISUAL_HIT_ANIM_END,_onReset);
		}
		private function _onReset(e:Event):void
		{
			mc.gotoAndStop("ldef");
			sleep();
		}
		
		public function getIsActive():Boolean
		{
			return _isActive;
		}
		
		public function getIsReady():Boolean
		{
			return _isReady;
		}
		
		public function getRadius():Number
		{
			return _radius;
		}
		
		
		
		public function activate(myX:Number,myY:Number,type:int=0) :void
		{
			mc.x=myX;
			mc.y=myY;
			_isActive=true;
			_isReady=false;
			
		}
		
		public function hit() :void
		{
			_isActive=false;
			_isReady=false;
			mc.gotoAndPlay("lhit");
		}
		
		
		public function sleep() :void
		{
			mc.x=-500;
			mc.y=-500;
			_isActive=false;
			_isReady=true;
			mc.rotation=0;
			mc.scaleX=1;
			mc.scaleY=1;
		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			
			//はみ出ている場合はtrue
			var bool:Boolean=false;
			if(mc.x<0-_radius||mc.x>w+_radius||mc.y<0-_radius||mc.y>h+_radius)
			{
				bool=true;
			}
			//実装
			return bool;
		}
		
		public function circleHitTest(currentStatus:GameItemStatus):Boolean
		{
			
			var targetX:Number=currentStatus.mc.x;
			var targetY:Number=currentStatus.mc.y;
			var targetRadius:Number=currentStatus._radius;
			
			
			//引数
			var _bool:Boolean;
			var _val1:Number = (targetX - mc.x) * (targetX - mc.x) + (targetY -mc.y) * (targetY - mc.y);
			var _val2:Number = (targetRadius + _radius) * (targetRadius + _radius);
			
			
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
		
	}
}