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
		
		override protected function init():void
		{
			_radius=45;
			visual=this["heroVisual"];
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
			visual.addEventListener(Const.HIT_ANIM_END,onReset);
			
			
		}
		
		private function onReset(e:Event):void
		{
			visual.gotoAndStop("ldef");
			this.sleep();
			this.dispatchEvent(new Event(Const.HIT_ANIM_END));
		}

		
		override protected function _step():void
		{
			this.x+=(this.parent.mouseX-this.x)/TICK;
			this.y+=(this.parent.mouseY-this.y)/TICK;
		}
		

		
	}
}