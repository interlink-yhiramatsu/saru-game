package
{
	import flash.display.MovieClip;
	
	public class Hero extends GameItemSuper
	{
		private const TICK:uint=4;
		
		
		public function Hero()
		{
			_radius=45;
			
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
			this.x+=(this.parent.mouseX-this.x)/TICK;
			this.y+=(this.parent.mouseY-this.y)/TICK;
		}
		
		
		
	}
}