package
{
	import flash.events.Event;

	public class HeroTama extends GameItemSuper
	{
		
		private var _heroTamaSpeed:Number=Const.HERO_TAMA_SPEED;
		private const TAMA_DIFF_A_X:Number=42;
		private const TAMA_DIFF_A_Y:Number=-11;
		private const TAMA_DIFF_B_X:Number=-8;
		private const TAMA_DIFF_B_Y:Number=8;
		
		public function HeroTama()
		{
			super();
		}
		
		override protected function _init():void
		{
			_visual=new TamaVisual();
			_visual.x -= _visual.width/2;
			_visual.y -= _visual.height/2;
			this.addChild(_visual);
			_visual.addEventListener(Const.VISUAL_HIT_ANIM_END,_onReset);
			
		}

		override public function activate(myX:Number,myY:Number,type:int=0) :void
		{
			
			if(type==0)
			{
				super.activate(myX+TAMA_DIFF_A_X,myY+TAMA_DIFF_A_Y);
				_speedX=_heroTamaSpeed;
			}else if(type==1)
			{
				super.activate(myX+TAMA_DIFF_B_X,myY+TAMA_DIFF_B_Y);
				_speedX=-_heroTamaSpeed;
			}
		}

	}
}