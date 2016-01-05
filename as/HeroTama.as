package
{
	import flash.display.MovieClip;
	
	//継承を外す
	
	public class HeroTama
	{

		/*===========================================*/
		//ここから　　HeroTama特有
		/*===========================================*/
		private const HERO_TAMA_SPEED:Number=Const.HERO_TAMA_SPEED;
		private const TAMA_DIFF_A_X:Number=42;
		private const TAMA_DIFF_A_Y:Number=-11;
		private const TAMA_DIFF_B_X:Number=-8;
		private const TAMA_DIFF_B_Y:Number=8;
		
		//Canvas特有
		private var stats:GameItemStas;
		public var mc:MovieClip;
		/*===========================================*/
		//ここまで　　HeroTama特有
		/*===========================================*/
		
		public function HeroTama()
		{
			mc=new TamaVisual();
			stats=new GameItemStas(mc);
			
		}
		
		/*===========================================*/
		//ここから　　override
		/*===========================================*/

		public function activate(myX:Number,myY:Number,type:int=0) :void
		{
			if(type==0)
			{
				stats.activate(myX+TAMA_DIFF_A_X,myY+TAMA_DIFF_A_Y);
				stats.speedX=HERO_TAMA_SPEED;
			}else if(type==1)
			{
				stats.activate(myX+TAMA_DIFF_B_X,myY+TAMA_DIFF_B_Y);
				stats.speedX=-HERO_TAMA_SPEED;
			}
		}
		
		/*===========================================*/
		//ここまで　　override
		/*===========================================*/
		
		/*===========================================*/
		//ここからは共通
		/*===========================================*/
		
//		public function activate(myX:Number,myY:Number,type:int=0) :void
//		{
//			stats.activate(myX,myY,type);
//		}
		
		public function sleep() :void
		{
			stats.sleep();
		}
		
		public function get isActive():Boolean
		{
			return stats.isActive;
		}

		public function get isReady():Boolean
		{
			return stats.isReady;
		}
		public function hit() :void
		{
			stats.hit();
		}
		public function step():void
		{
			stats.step();
		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			return stats.outTest(w,h);
		}
		
		public function circleHitTest(x:Number,y:Number,radius:Number):Boolean
		{
			return stats.circleHitTest(x,y,radius);
		}
		
		/*===========================================*/
		//ここまでは共通
		/*===========================================*/
		
	}
}