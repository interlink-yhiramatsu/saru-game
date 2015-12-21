package
{
	import flash.display.MovieClip;
	
	public class Hero extends MovieClip
	{
		private const TICK:uint=4;
		
		//これがコンポジション
		private var visual:MovieClip;
		
		public function Hero()
		{
			
			visual=this["heroVisual"];
			
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
		}
		
		
		//		public function shot():void
		//		{
		//				trace("aaaa");
		//		}
		
		public function step():void
		{
			this.x+=(stage.mouseX-this.x)/TICK;
			this.y+=(stage.mouseY-this.y)/TICK;
		}
		
		public function destroy():void
		{
			
		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			return false;
		}
		
		
		
	}
}