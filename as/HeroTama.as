package
{
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
			
			
		}
		
		override public function activate(myX:Number,myY:Number) :void
		{
			this.x=myX;
			this.y=myY;
			_isActive=true;
			
			if(Utils.getRandom(2)==0)
			{
				_speedX=_mySpeed;
			}else
			{
				_speedX=-_mySpeed;
			}
		}
	}
}