package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Hero
	{
		private const TICK:uint=4;
		
		//Canvas特有
		public var gameItemStatus:GameItemStatus;
		public var mc:MovieClip;
		
		public function Hero()
		{
			mc=new HeroVisual();
			gameItemStatus=new GameItemStatus(mc,20);
			
		}

		/*===========================================*/
		//ここから　　override
		/*===========================================*/
		
		public function reset(myX:Number,myY:Number):void
		{
			mc.gotoAndStop("ldef");
			activate(myX,myY);
		}
		
		private function _step():void
		{
			mc.x+=(mc.parent.mouseX-mc.x)/TICK;
			mc.y+=(mc.parent.mouseY-mc.y)/TICK;
		}
		
		/*===========================================*/
		//ここまで　　override
		/*===========================================*/
		
		
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
		
		public function circleHitTest(targetStats:GameItemStatus):Boolean
		{
			return gameItemStatus.circleHitTest(targetStats);
		}
		
		/*===========================================*/
		//ここまでは共通
		/*===========================================*/
		
	}
}