package
{
	import flash.display.MovieClip;
	
	public class GameItemSuper extends MovieClip implements IStepItem
	{
		protected var visual:MovieClip;
		//待機状態かどうか
		protected var _isActive:Boolean=false;
		protected var _isReady:Boolean=true;
		
		protected var _radius:Number=10;
		
		public function GameItemSuper()
		{
			init();
			this.sleep();
		}
		
		public function get isActive():Boolean
		{
			return _isActive;
		}
		
		public function get isReady():Boolean
		{
			return _isReady;
		}

		protected function init():void{}
		
		public function get radius():Number
		{
			return _radius;
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
			//サブクラスで、実際の挙動は実装
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
			visual.gotoAndPlay("lhit");
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
		
		
		
		public function destroy():void
		{
			//実装しなくてもいい
			//MovieClip(this.parent).removeChild(this);
		}
	}
}