package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemy extends GameItemSuper
	{
		
		
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
			this.x+=-5;
		}
		
		override protected function _hit():void
		{
			visual.gotoAndPlay("lhit");
		}
		
		override public function activate(myX:Number,myY:Number) :void
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
		
		
		
		
		
	}
}