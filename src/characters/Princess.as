package characters 
{
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.text.TextField;
	import Math;
	import Game;
	
	import starling.textures.Texture;
	
	import Assets;
	
	/**
	 * ...
	 * @author Group7
	 */
	public class Princess extends Sprite 
	{
		public var queen:Quad;
		public var direction:int;
		public var positionX:int;
		public var positionY:int;
		public var kind:String;
		//public var chain: Quad;
		
		public var healthPoints:int;
		public var madnessPoints:int;
		public var damage:int;
		public var legend:TextField;
		public var item:String;
		public var speed:int;
		
		//Boleanos de direcciones:
		public var right:Boolean;
		public var left:Boolean;
		public var up:Boolean;
		public var down:Boolean;
		public var previousdir:int;
		public var previousstat:int;
		public var lastdir:int;
		
		
		
		//Art
		private var princessArt:MovieClip;
		
		public var onattack:int = 0;
		public var onmove:int = 0;
		
		private const multipler:int = 75;
		
		public function Princess(posX:int, posY:int) 
		{
			super();
			positionX = posX;
			positionY = posY;
			//queen = new Quad(multipler, multipler, 0x983b59);
			//queen.visible = false;
			direction = 0;
			healthPoints = 50;
			madnessPoints = 10;
			damage = 2;
			kind = new String("P")
			item = "";
			
			right = false;
			left = false;
			up = false;
			down = false;
			
			
			//chain = new Quad(multipler, multipler, 0xee22fa);
			//chain.visible = false;
			
			speed=3;
			
			legend = new TextField(multipler, 40, "(" + positionX + "," + positionY + ") HP" + healthPoints + "\n MP"
			+ madnessPoints, "Arial", 15, 0xffffff);
			legend.visible = false;
			
			this.x = multipler*positionX + multipler;
			this.y = positionY * multipler;
			
			//this.addChild(chain);
			//this.addChild(queen);
			this.addChild(legend);
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createPrincessArt();
		}
		
		public function refreshLegend():void {
			legend.text = "(" + positionX + "," + positionY + ") HP" + healthPoints  + "\n MP" + madnessPoints;
		}
		
		public function calculateDamage():int {
			var randint:Number = Math.random() * (150 - 0 + 1);
			if (randint < madnessPoints) {
				if(((randint - randint % 10) / 20)>1) healthPoints -= (randint - randint % 10) / 20;
				
				return damage + (randint - randint % 10) / 10;
				
			}
			else {
				return damage;
			}
		}
		
		private function createPrincessArt():void
		{
			princessArt = new MovieClip(Assets.getAtlas().getTextures("princess" + direction + onattack + "1"), 8);
			starling.core.Starling.juggler.add(princessArt);
			this.addChild(princessArt);
			
		}
		
		public function changePrincessArt():void {
			if (right || left || down || up) {
				previousstat = onmove;
				onmove = 0;
				
				if (previousdir != direction || previousstat != onmove || lastdir!=direction) {
					removeChild(princessArt);
					princessArt = new MovieClip(Assets.getAtlas().getTextures("princess" + direction + onattack), 8);
					starling.core.Starling.juggler.add(princessArt);
					this.addChild(princessArt);
					lastdir = direction;
				}
			}
			
			/*else if (healthPoints <= 0) {
					removeChild(princessArt);
					princessArt = new MovieClip(Assets.getAtlas().getTextures("princess400"), 6);
					princessArt.scaleX = 3;
					princessArt.scaleY= 3;
					starling.core.Starling.juggler.add(princessArt);
					this.addChild(princessArt);
			}*/
			
			else {
				
				previousstat = onmove;
				onmove = 1;
				removeChild(princessArt);
				if (onattack == 0) {
					princessArt = new MovieClip(Assets.getAtlas().getTextures("princess" + direction + onattack + "1"), 8);
				starling.core.Starling.juggler.add(princessArt);
				this.addChild(princessArt);
				}
				else {
					princessArt = new MovieClip(Assets.getAtlas().getTextures("princess" + direction + onattack), 8);
					starling.core.Starling.juggler.add(princessArt);
					this.addChild(princessArt);
				}
				
			}
			
			
		}
		
		
		/*DIRECTIONS
		 * 0 = right
		 * 1 = left
		 * 2 = up
		 * 3 = down
		 * */
	}
}