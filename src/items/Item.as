package items 
{
	import screens.maps.TemplateMap;
	import starling.display.Quad;
	import starling.display.Sprite;
	
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.core.Starling;

	
	/**
	 * ...
	 * @author Group7
	 */
	public class Item extends Sprite 
	{
		public var map:TemplateMap;
		public var positionX: int;
		public var positionY: int;
		public var kind: String;
		public var staticItem: Boolean;
		public var torch:MovieClip;
		public var meat:Image;
		public var lever:Image;
		
		private const multipler:int = 75;
		
		//Arte
		
		
		public function Item(posX:int, posY:int, id:String ) 
		{
			super();
			positionX = posX;
			positionY = posY;
			kind = id;
			//staticItem = stat;
			
			if (kind == "torch") {
				torch = new MovieClip(Assets.getAtlas().getTextures("Torch"), 6);
				starling.core.Starling.juggler.add(torch);
				staticItem = true;
				torch.x = positionX * multipler + 85;
				torch.y = positionY * multipler;
				this.addChild(torch);
			}
			
			if (kind == "meat") {
				meat = new Image(Assets.getAtlas().getTexture("Meat"));
				staticItem = false;
				meat.x = positionX * multipler+ 85;
				meat.y = positionY * multipler;
				this.addChild(meat);
			}
			
			if (kind == "lever") {
				lever = new Image(Assets.getAtlas().getTexture("Lever000"));
				staticItem = true;
				lever.x = positionX * multipler + 85;
				lever.y = positionY * multipler;
				this.addChild(lever);
			}
			
		}
		
	}

}