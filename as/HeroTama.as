package
{
	import flash.events.Event;

	public class HeroTama extends TamaSuper
	{
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
			
			this.x=myX;
			this.y=myY;
			_isActive=true;
			_isReady=false;
			
			if(Utils.getRandom(2)==0)
			{
				_speedX=_mySpeed;
			}else
			{
				_speedX=_mySpeed;
			}
		}
		
		
	}
}