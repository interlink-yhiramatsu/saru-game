package
{
	import flash.display.MovieClip;
	
	public class Enemy extends GameItemSuper
	{
		
		//これがコンポジション
		private var visual:MovieClip;
		
		
		public function Enemy()
		{
			super();
		
			visual=new HitsujiVisual();
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
			this.addChild(visual);
		
		}
		
		override protected function _step():void
		{
			this.x+=5;
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