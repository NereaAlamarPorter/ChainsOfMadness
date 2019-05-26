package characters 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class Prisioner1 extends Sprite 
	{
		public var positionX: int;
		public var positionY: int;
		public var healthPoints: int;
		public var prisioner: Image;
		public var bubble:Image;
		public var text:TextField;
		public var talkcode:int;
		
		private const multipler:int = 75;
		
		public function Prisioner1 (posX:int, posY: int, hp:int) 
		{
			super();
			
			positionX = posX;
			positionY = posY;
			healthPoints = hp;
			talkcode = 0;
			
			
			prisioner = new Image(Assets.getAtlas().getTexture("Maiden00"));
			this.addChild(prisioner);
			prisioner.x = -4;
			prisioner.y = +16;
			
			this.x = multipler+positionX * 100;
			this.y = positionY * multipler;
			
			
			bubble = new Image(Assets.getAtlas().getTexture("Bubbles"));
			this.addChild(bubble);
			bubble.y = 2;
			bubble.x = multipler -7;
			bubble.visible = false;
			
			text = new TextField(200, multipler+5, "", "Gill Sans MT", 12, 0x000000);
			this.addChild(text);
			text.visible = false;
			text.x = multipler+2;
			text.y = -7;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function talk():void {
			
			if (!Sounds.muteSounds) {
				Sounds.sndPrisioner1Talk.play();
			}
			
			bubble.visible = true;
			text.visible = true;
			
			switch (talkcode) {
				case 0:
					text.text = "YOUR HIGHNESS, I'M CLOTILDA, YOUR MAID.";//presentación
					break; 
				case 1:
					text.text = "WHEN THEY ATTACKED THE CASTLE I WAS CAPTURED TOO."; // YO TAMBIEN FUI CAPTURADA CUANDO ATACARÓN EL CASTILLO
					break;
				case 2:
					text.text = "BE CAREFUL WITH THE MAGE,\nHE WON'T LISTEN TO YOU."; //cuidado con los soldados, no atienden a razones
					talkcode++;
					break; 
				case 3:
					text.text = "YOU...YOU KILLED THE DRUNK. HE DIDN'T DESERVE IT!" ; //el borracho no debia morir
					break;
				default:
					text.text = "THE DRUNK SOLDIER NEVER STOPS SINGING...\nPLEASE, MAKE HIM STOP!"; //el soldado borracho no para de cantar
					break;
			}
			talkcode++;
		}
	}

}