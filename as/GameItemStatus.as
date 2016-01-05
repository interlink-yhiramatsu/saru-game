package
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class GameItemStatus
	{
		
		public var mc:MovieClip;
		
		public var isActive:Boolean=false;
		public var isReady:Boolean=true;

		public var radius:Number=10;
		
		
		public function GameItemStatus(mc:MovieClip)
		{
			this.mc=mc;
			mc.radius=radius;
			mc.addEventListener(Const.VISUAL_HIT_ANIM_END,_onReset);
		}
		
		/*===========================================*/
		//ここから　　super
		/*===========================================*/
		

		private function _onReset(e:Event):void
		{
			mc.gotoAndStop("ldef");
			sleep();
		}
		
//		public function step():void
//		{
//			if(isActive)
//			{
//				mc.x+=speedX;
//				mc.y+=speedY;	
//			}
//		}

		
		public function activate(myX:Number,myY:Number,type:int=0) :void
		{
			mc.x=myX;
			mc.y=myY;
			isActive=true;
			isReady=false;
			
		}
		
		public function hit() :void
		{
			isActive=false;
			isReady=false;
			mc.gotoAndPlay("lhit");
		}
		
		
		public function sleep() :void
		{
			mc.x=-500;
			mc.y=-500;
			isActive=false;
			isReady=true;
			mc.rotation=0;
		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			
			//はみ出ている場合はtrue
			var bool:Boolean=false;
			if(mc.x<0-radius||mc.x>w+radius||mc.y<0-radius||mc.y>h+radius)
			{
				bool=true;
			}
			//実装
			return bool;
		}
		
		//追加
		
//		public function circleHitTest(targetX:Number,targetY:Number,targetRadius:Number):Boolean
//		{
//			
//			//引数
//			var _bool:Boolean;
//			var _val1:Number = (targetX - mc.x) * (targetX - mc.x) + (targetY -mc.y) * (targetY - mc.y);
//			var _val2:Number = (targetRadius + radius) * (targetRadius + radius);
//			
//			
//			if (_val1 <= _val2)
//			{
//				_bool=true;
//			}
//			else
//			{
//				_bool=false;
//			}
//			
//			return _bool;
//			
//			
//		}
		
		public function circleHitTest(stats:GameItemStatus):Boolean
		{
			
			var targetX:Number=stats.mc.x;
			var targetY:Number=stats.mc.y;
			var targetRadius:Number=stats.radius;
			
			
			//引数
			var _bool:Boolean;
			var _val1:Number = (targetX - mc.x) * (targetX - mc.x) + (targetY -mc.y) * (targetY - mc.y);
			var _val2:Number = (targetRadius + radius) * (targetRadius + radius);
			
			
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
		
		/*===========================================*/
		//ここまで　　super
		/*===========================================*/
	}
}