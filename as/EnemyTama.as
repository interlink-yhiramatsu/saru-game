package
{
	public class EnemyTama extends TamaSuper
	{
		

		public function EnemyTama(myX:Number, myY:Number)
		{
			_mySpeed=5;
			super(myX, myY);
		}
		
		
		override protected function init():void
		{
			visual=new TamaVisual();
			visual.x -= visual.width/2;
			visual.y -= visual.height/2;
			this.addChild(visual);
			
			if(Utils.getRandom(2)==0)
			{
				_speedX=_mySpeed;
			}else
			{
				_speedX=-_mySpeed;
			}
		}
	}
}