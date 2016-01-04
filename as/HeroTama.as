package
{
	import flash.events.Event;

	public class HeroTama extends GameItemSuper
	{
		
		private var _heroTamaSpeed:Number=Const.HERO_TAMA_SPEED;
		
		
		public function HeroTama()
		{
			super();
		}
		
		override protected function _init():void
		{
			visual=new TamaVisual();
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
			this.addChild(visual);
			visual.addEventListener(Const.HIT_ANIM_END,_onReset);
			
		}

		override public function activate(myX:Number,myY:Number,type:int=0) :void
		{
			
			super.activate(myX,myY);
			
			if(type==0)
			{
				_speedX=_heroTamaSpeed;
			}else if(type==1)
			{
				_speedX=-_heroTamaSpeed;
			}
		}

	}
}