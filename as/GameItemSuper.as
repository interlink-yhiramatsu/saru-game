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
		
		
		public function activate(myX:Number,myY:Number,type:String="",terminalX:Number=0,terminalY:Number=0):void
			//public function activate(myX:Number,myY:Number) :void
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
		}
		
		public function sleep() :void
		{
			this.x=-500;
			this.y=-500;
			_isActive=false;
			_isReady=true;
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
		
		public function reset():void
		{

		}
		
		public function destroy():void
		{
			//実装しなくてもいい
			//MovieClip(this.parent).removeChild(this);
		}
	}
}