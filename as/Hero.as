package
{
	import flash.display.MovieClip;

	public class Hero extends MovieClip
	{
		public function Hero()
		{
			this["heroVisual"].x -= this["heroVisual"].width/2;
			this["heroVisual"].y -= this["heroVisual"].height/2;
		}
	}
}