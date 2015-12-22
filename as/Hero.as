package
{
	import flash.display.MovieClip;
	
	public class Hero extends GameItemSuper
	{
		private const TICK:uint=4;
		
		
		
		public function Hero()
		{
			_isActive=true;
			
			visual=this["heroVisual"];
			
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
		}
		
		
		//		public function shot():void
		//		{
		//				trace("aaaa");
		//		}
		
		override protected function _step():void
		{
			this.x+=(stage.mouseX-this.x)/TICK;
			this.y+=(stage.mouseY-this.y)/TICK;
		}
		
		
		
	}
}