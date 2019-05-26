package items 
{
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.core.Starling;
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Group7
	 */
	public class MagicBall extends Sprite 
	{
		public var damage:int;
		public var move:int;
		public var ball:MovieClip;
		
		public function MagicBall(dmg:int,mv:int,Y:int, X:int) 
		{
			super();
			
			damage = dmg;
			move = mv;
			ball = new MovieClip(Assets.getAtlas().getTextures("magicBall00"), 4);
			starling.core.Starling.juggler.add(ball);
			ball.y = Y;
			ball.x = X;
			
			this.addChild(ball);
		}
		
	}

}