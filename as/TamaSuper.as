package
{
	import flash.display.MovieClip;
	
	public class TamaSuper extends MovieClip implements IStepItem
	{
		
		protected var _mySpeed:Number=10;
		protected var _speedX:Number=0;
		protected var _speedY:Number=0;
		
		protected var visual:MovieClip;
		
		public function TamaSuper(myX:Number,myY:Number)
		{
			this.x=myX;
			this.y=myY;
			init();
		}
		
		protected function init():void
		{
//			visual=new TamaVisual();
//			visual.x -= visual.width/2;
//			visual.y -= visual.height/2;
//			this.addChild(visual);
//			
//			if(Utils.getRandom(2)==0)
//			{
//				_speedX=SPEED;
//			}else
//			{
//				_speedX=-SPEED;
//			}
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