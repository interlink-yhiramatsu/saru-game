package
{
	import flash.display.MovieClip;

	public class Hero extends MovieClip
	{
		private const TICK:uint=4;
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
		
		public function step(myX:Number,myY:Number):void
		{
			this.x+=(myX-this.x)/TICK;
			this.y+=(myY-this.y)/TICK;
		}
		
		
	}
}