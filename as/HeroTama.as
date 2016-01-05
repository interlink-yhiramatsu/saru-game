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
		
		private var _speedX:Number=0;
		private var _speedY:Number=0;
		
		//Canvas特有
		public var gameItemStatus:GameItemStatus;
		public var mc:MovieClip;
		/*===========================================*/
		//ここまで　　HeroTama特有
		/*===========================================*/
		
		public function HeroTama()
		{
			mc=new TamaVisual();
			gameItemStatus=new GameItemStatus(mc,5);
		
		}
		
		/*===========================================*/
		//ここから　　override
		/*===========================================*/

		public function activate(myX:Number,myY:Number,type:int=0) :void
		{
			if(type==0)
			{
				gameItemStatus.activate(myX+TAMA_DIFF_A_X,myY+TAMA_DIFF_A_Y);
				_speedX=HERO_TAMA_SPEED;
			}else if(type==1)
			{
				gameItemStatus.activate(myX+TAMA_DIFF_B_X,myY+TAMA_DIFF_B_Y);
				_speedX=-HERO_TAMA_SPEED;
			}
		}
		
		private function _step():void
		{
			mc.x+=_speedX;
			mc.y+=_speedY;	
		}
		
		/*===========================================*/
		//ここまで　　override
		/*===========================================*/
		
		/*===========================================*/
		//ここからは共通
		/*===========================================*/
		
//		public function activate(myX:Number,myY:Number,type:int=0) :void
//		{
//			gameItemStatus.activate(myX,myY,type);
//		}
		
		public function sleep() :void
		{
			gameItemStatus.sleep();
		}
		
		public function getIsActive():Boolean
		{
			return gameItemStatus.getIsActive();
		}
		
		public function getIsReady():Boolean
		{
			return gameItemStatus.getIsReady();
		}
		public function hit() :void
		{
			gameItemStatus.hit();
		}
		
		public function step():void
		{
			if(gameItemStatus.getIsActive())
			{
				_step();
			}
		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			return gameItemStatus.outTest(w,h);
		}
		
		public function circleHitTest(targetStatus:GameItemStatus):Boolean
		{
			return gameItemStatus.circleHitTest(targetStatus);
		}
		
		/*===========================================*/
		//ここまでは共通
		/*===========================================*/
		
	}
}