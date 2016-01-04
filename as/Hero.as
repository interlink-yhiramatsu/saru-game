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
//			_radius=24;
			_radius=10;
			
			_visual=this["heroVisual"];
			_visual.x -= _visual.width/2;
			_visual.y -= _visual.height/2;
			_visual.addEventListener(Const.VISUAL_HIT_ANIM_END,_onHitEnd);
			
		}
		
		public function reset(myX:Number,myY:Number):void
		{
			_visual.gotoAndStop("ldef");
			this.activate(myX,myY);
		}
		
		private function _onHitEnd(e:Event):void
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