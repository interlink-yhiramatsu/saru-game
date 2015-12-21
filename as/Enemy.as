package
{
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip implements IStepItem
	{
		
		//これがコンポジション
		private var visual:MovieClip;
		
		
		public function Enemy(myX:Number,myY:Number)
		{
			visual=new HitsujiVisual();
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
			this.addChild(visual);
			this.x=myX;
			this.y=myY;
		}
		
		public function step():void
		{
			this.x+=-5;
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
		
		public function checkStatus():void
		{
			
		}
		
		public function destroy():void
		{
			MovieClip(this.parent).removeChild(this);
		}
	}
}