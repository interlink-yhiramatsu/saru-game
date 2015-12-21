package
{
	import flash.display.MovieClip;
	
	public class GameItemSuper extends MovieClip implements IStepItem
	{
		//待機状態かどうか
		protected var _isActive:Boolean=false;
		protected var _radius:Number=10;
		
		public function GameItemSuper()
		{
			super();
		}
		
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
		
		public function activate() :void
		{
			_isActive=true;
		}
		
		public function sleep() :void
		{
			_isActive=false;
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
			//MovieClip(this.parent).removeChild(this);
			this.x=-500;
			this.y=-500;
			this._isActive=false;
		}
	}
}