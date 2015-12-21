package
{
	import flash.display.MovieClip;
	
	public class Tama extends MovieClip implements IGameItem
	{
		
		private const SPEED:Number=10;
		
		private var _speedX:Number=0;
		private var _speedY:Number=0;
		
		private var visual:MovieClip;
		
		public function Tama(myX:Number,myY:Number)
		{
			visual=new TamaVisual();
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
			this.addChild(visual);
			this.x=myX;
			this.y=myY;
			
			if(Utils.getRandom(2)==0)
			{
				_speedX=SPEED;
			}else
			{
				_speedX=-SPEED;
			}
		}
		
		
		public function step():void
		{
			this.x+=_speedX;
			this.y+=_speedY;	
		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			//はみ出ている場合はtrue
			var bool:Boolean=false;
			
			if(this.x<0||this.x>w||this.y<0||this.y>h)
			{
				bool=true;
			}
			
			//実装
			
			return bool;
		}
		
		public function destroy():void
		{
			MovieClip(this.parent).removeChild(this);
		}
	}
}