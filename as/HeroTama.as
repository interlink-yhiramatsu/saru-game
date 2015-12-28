package
{
	import flash.events.Event;

	public class HeroTama extends GameItemSuper
	{
		
		protected var _mySpeed:Number=15;
		protected var _speedX:Number=0;
		protected var _speedY:Number=0;
		
		
		public function HeroTama()
		{
			super();
		}
		
		override protected function init():void
		{
			visual=new TamaVisual();
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
			this.addChild(visual);
			visual.addEventListener(Const.HIT_ANIM_END,onReset);
			
		}
		
		private function onReset(e:Event):void
		{
			visual.gotoAndStop("ldef");
			this.sleep();
		}
		
		override protected function _hit():void
		{
			visual.gotoAndPlay("lhit");
		}
		
		
		
		override public function activate(myX:Number,myY:Number) :void
		{
			
			super.activate(myX,myY);
			
			if(Utils.getRandom(2)==0)
			{
				_speedX=_mySpeed;
			}else
			{
				_speedX=-_mySpeed;
			}
		}
		
		override protected function _step():void
		{
			this.x+=_speedX;
			this.y+=_speedY;	
			
		}
		
		
	}
}