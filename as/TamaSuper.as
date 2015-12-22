package
{
	import flash.display.MovieClip;
	
	public class TamaSuper extends GameItemSuper
	{
		
		protected var _mySpeed:Number=15;
		protected var _speedX:Number=0;
		protected var _speedY:Number=0;
		
		
		
		public function TamaSuper()
		{
			super();
		}
		
		
		
		override protected function _step():void
		{
				this.x+=_speedX;
				this.y+=_speedY;	
		
		}
		
		
	}
}