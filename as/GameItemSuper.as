package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class GameItemSuper extends MovieClip implements IStepItem
	{
		
		/*===========================================*/
		//ここから　　super
		/*===========================================*/
		
		
		protected var _visual:MovieClip;
		protected var _isActive:Boolean=false;
		protected var _isReady:Boolean=true;
		protected var _speedX:Number=0;
		protected var _speedY:Number=0;
		protected var _radius:Number=10;
		
		/*===========================================*/
		//ここまで　　super
		/*===========================================*/
		
		public function GameItemSuper()
		{
			_init();
			this.sleep();
		}
		
		/*===========================================*/
		//ここから　　super
		/*===========================================*/
		
		public function get isActive():Boolean
		{
			return _isActive;
		}
		
		public function get isReady():Boolean
		{
			return _isReady;
		}

		protected function _init():void{}
		
		public function get radius():Number
		{
			return _radius;
		}
		
		protected function _onReset(e:Event):void
		{
			_visual.gotoAndStop("ldef");
			this.sleep();
		}
		
		public function step():void
		{
			if(_isActive)
			{
				_step();
			}
		}
		
		protected function _step():void
		{
			this.x+=_speedX;
			this.y+=_speedY;	
		}
		
		
		public function activate(myX:Number,myY:Number,type:int=0) :void
		{
			this.x=myX;
			this.y=myY;
			_isActive=true;
			_isReady=false;
			
		}
		
		public function hit() :void
		{
			_isActive=false;
			_isReady=false;
			_hit();
		}
		
		protected function _hit():void
		{
			//サブクラスで、実際の挙動は実装
			_visual.gotoAndPlay("lhit");
		}
		
		public function sleep() :void
		{
			this.x=-500;
			this.y=-500;
			_isActive=false;
			_isReady=true;
			this.rotation=0;
		}
		
		public function outTest(w:Number,h:Number):Boolean
		{
			
			//はみ出ている場合はtrue
			var bool:Boolean=false;
			if(this.x<0-this.radius||this.x>w+this.radius||this.y<0-this.radius||this.y>h+this.radius)
			{
				bool=true;
			}
			//実装
			return bool;
		}
		/*===========================================*/
		//ここまで　　super
		/*===========================================*/

	}
}