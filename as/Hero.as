package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Hero extends GameItemSuper
	{
		private const TICK:uint=4;
		
		
		public function Hero()
		{
			super();
		}
		
		override protected function _init():void
		{
			_radius=24;
			visual=this["heroVisual"];
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
			
			visual.addEventListener(Const.HIT_ANIM_END,onHitEnd);
			
			
		}
		
		public function reset(myX:Number,myY:Number):void
		{
			visual.gotoAndStop("ldef");
			this.activate(myX,myY);
		}
		
		private function onHitEnd(e:Event):void
		{
			this.dispatchEvent(new Event(Const.HERO_HIT_ANIM_END));
		}

		
		override protected function _step():void
		{
			this.x+=(this.parent.mouseX-this.x)/TICK;
			this.y+=(this.parent.mouseY-this.y)/TICK;
		}
		
	}
}