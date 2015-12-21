package
{
	import flash.display.MovieClip;
	
	public class Enemy extends GameItemSuper
	{
		
		//これがコンポジション
		private var visual:MovieClip;
		
		
		public function Enemy(myX:Number,myY:Number)
		{
			_isActive=true;
			
			visual=new HitsujiVisual();
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
			this.addChild(visual);
			this.x=myX;
			this.y=myY;
		}
		
		override protected function _step():void
		{
			this.x+=-5;
		}

		
		public function checkStatus():void
		{
			
		}
		
		
	}
}