package
{
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip implements IGameItem
	{
		public function Enemy()
		{
			this.addChild(new HitsujiVisual());
		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			return false;
		}
		
		public function destroy():void
		{
			
		}
	}
}