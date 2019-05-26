package characters 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.text.TextField;
	
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Group7
	 */
	public class Mage extends Sprite 
	{
		public var kind:String = "M";
		public var positionX:int;
		public var positionY:int;
		public var healthPoints:int;
		public var mage:MovieClip;
		public var legend:TextField;
		public var damage:int;
		public var way:int;
		public var enableMov:Boolean;
		
		
		private const multipler:int = 75;
		
		public function Mage(hp:int, Y:int, dmg:int) 
		{
			super();
			
			mage = new MovieClip(Assets.getAtlas().getTextures("Wizard00"), 4);
			starling.core.Starling.juggler.add(mage);
			
			healthPoints = hp;
			positionY = Y;
			positionX = 3;
			damage = dmg;
			way = 1;
			legend = new TextField(multipler, 20, "(" + positionX + "," + positionY + ") HP " + healthPoints, "Arial", 15, 0xffffff);
			legend.visible = false;
			enableMov = true;
			
			this.addChild(mage);
			this.addChild(legend);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		public function refreshLegend():void {
			legend.text = "(" + positionX + "," + positionY + ") HP " + healthPoints;
		}
		
	}

}