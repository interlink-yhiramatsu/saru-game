package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Hero
	{
		private const TICK:uint=4;
		
		//Canvas特有
		private var stats:GameItemStas;
		public var mc:MovieClip;
		
		public function Hero()
		{
			mc=new HeroVisual();
			stats=new GameItemStas(mc);
		}
		
		/*===========================================*/
		//ここから　　Hero特有
		/*===========================================*/
		//		override protected function _init():void
		//		{
		////			_radius=24;
		//			_radius=10;
		//			
		//			_visual=this["heroVisual"];
		//			_visual.x -= _visual.width/2;
		//			_visual.y -= _visual.height/2;
		//			_visual.addEventListener(Const.VISUAL_HIT_ANIM_END,_onHitEnd);
		//			
		//		}
		
		//		public function reset(myX:Number,myY:Number):void
		//		{
		//			_visual.gotoAndStop("ldef");
		//			this.activate(myX,myY);
		//		}
		//		
		//		private function _onHitEnd(e:Event):void
		//		{
		//			this.dispatchEvent(new Event(Const.HERO_HIT_ANIM_END));
		//		}
		
		public function reset(myX:Number,myY:Number):void
		{
			mc.gotoAndStop("ldef");
			activate(myX,myY);
		}
		
		public function step():void
		{
			mc.x+=(mc.parent.mouseX-mc.x)/TICK;
			mc.y+=(mc.parent.mouseY-mc.y)/TICK;
		}
		
		/*===========================================*/
		//ここまで　　Hero特有
		/*===========================================*/
		
		
		/*===========================================*/
		//ここからは共通
		/*===========================================*/
		
		public function activate(myX:Number,myY:Number,type:int=0) :void
		{
			stats.activate(myX,myY,type);
		}
		
		public function sleep() :void
		{
			stats.sleep();
		}
		
		public function get isActive():Boolean
		{
			return stats.isActive;
		}
		
		public function get isReady():Boolean
		{
			return stats.isReady;
		}
		public function hit() :void
		{
			stats.hit();
		}
		//		public function step():void
		//		{
		//			stats.step();
		//		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			return stats.outTest(w,h);
		}
		
		public function circleHitTest(x:Number,y:Number,radius:Number):Boolean
		{
			return stats.circleHitTest(x,y,radius);
		}
		
		/*===========================================*/
		//ここまでは共通
		/*===========================================*/
		
	}
}