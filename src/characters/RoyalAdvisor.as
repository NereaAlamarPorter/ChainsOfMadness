package characters 
{
	import starling.display.Sprite;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.core.Starling;

	
	public class RoyalAdvisor extends Sprite 
	{
		public var positionX: int;
		public var positionY: int;
		public var healthPoints: int;
		public var royalAd: Quad;
		public var royalAdArt:Image;
		public var bubbleArt:Image;
		public var text:TextField;
		public var talkcode:int;
		
		private const multipler:int = 75;
		
		public function RoyalAdvisor(posX:int, posY: int, hp:int) 
		{
			super();
			
			positionX = posX;
			positionY = posY;
			healthPoints = hp;
			talkcode = 0;
			
			royalAd = new Quad(multipler, multipler, 0x00ff00);
			this.addChild(royalAd);
			royalAd.visible = false;
			
			royalAdArt = new Image(Assets.getAtlas().getTexture("RoyalAdvisor00"));
			this.addChild(royalAdArt);
			royalAdArt.y = royalAd.y - 16;
			royalAdArt.x = royalAd.x - 8;
			
			bubbleArt = new Image(Assets.getAtlas().getTexture("Bubbles"));
			this.addChild(bubbleArt);
			bubbleArt.y = 2;
			bubbleArt.x = multipler;
			bubbleArt.visible = false;
			
			text = new TextField(200, 80, "", "Gill Sans MT", 12, 0x000000);
			this.addChild(text);
			text.visible = false;
			text.x = multipler+6;
			text.y = 2;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		public function talk():void {
			if (!Sounds.muteSounds) {
					Sounds.sndRoyalAdTalk.play();
			}
			
			bubbleArt.visible = true;
			text.visible = true;
			
			switch (talkcode) {
				case 0:
					text.text = "PRINCESS, PRINCESS!\nARE YOU ALL RIGHT?"; //¿Estás bien? 
					break;
			
				case 1:
					text.text = "BLOODY HELL! YOUR... YOUR HAND\nYOU ARE BLEEDING OUT."; //Joder, tu mano 
					break;
				case 2:
					text.text = "STAY CALM, STAY CALM, STAY CALM\nWE HAVE TO HEAL YOUR WOUND. WITH...WITH SOME FIRE, YES IT MIGHT WORK."; //Busca fuego, liberanos
					break;
				default:
					text.text = "RIGHT NOW I CAN'T HELP YOU, YOUR HIGHNESS. IF YOU FIND THE WAY TO FREE ME, I WILL HELP YOU.";
					break; 
			}
			talkcode++;
				
					
		}
		
	}

}