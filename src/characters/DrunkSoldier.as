package characters 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.text.TextField;
	
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.core.Starling;

	
	/**
	 * ...
	 * @author Grupo7
	 */
	public class DrunkSoldier extends Sprite 
	{
		public var positionX: int;
		public var positionY: int;
		public var healthPoints: int;
		public var drunkSol:MovieClip;
		public var bubble:Image;
		public var text:TextField;
		public var talkcode:int;
		
		private const multipler:int = 75;
		
		public function DrunkSoldier(posX:int, posY: int, hp:int) 
		{
			super();
			
			positionX = posX;
			positionY = posY;
			healthPoints = hp;
			talkcode = 0;
			
			drunkSol = new MovieClip(Assets.getAtlas().getTextures("Drunk00"), 4);
			starling.core.Starling.juggler.add(drunkSol);

			this.addChild(drunkSol);
			
			
			
			bubble = new Image(Assets.getAtlas().getTexture("Bubbles"));
			this.addChild(bubble);
			bubble.y = 2;
			bubble.x = multipler -5;
			bubble.visible = false;
			
			text = new TextField(200, multipler+5, "", "Gill Sans MT", 12, 0x000000);
			this.addChild(text);
			text.visible = false;
			text.x = multipler+2;
			text.y = 5;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		public function talk():void {
			
			
			bubble.visible = true;
			text.visible = true;
			
			switch (talkcode) {
				case 0:
					if (!Sounds.muteSounds) {
						Sounds.sndDrunkSolTalk.play();
					}
					text.text = "EHMM... I WASN'T ZLEEPING! GHH... \nAND MY BOTTLE... AGAIN EMPTY";//esta borracho 
					break; 
				case 1:
					if (!Sounds.muteSounds) {
						Sounds.sndDrunkSolTalk.play();
					}
					text.text = "I'D WANT TO GO FOR MORE COGNAC BUT IT'Z DANGEROUZ BECAUZE OF THOZE ZTUPID DOGZ OUT THERE\nTHEY SHOULD FEED THEM BETTER"; //hay perros hambrientos fuera
					break;
				case 2:
					if (!Sounds.muteSounds) {
						Sounds.sndDrunkSolTalk.play();
					}
					text.text = "THERE MAY BE SOME ALCOHOL IN THE LARDER... AND NOT ONLY MEAT"; //hay carne en la bodega
					break; 
				default:
					
					if (!Sounds.muteSounds) {
						Sounds.sndStonecutters.play();
					}
					
					text.text = "WHO CONTROLS THIS COUNTRY'S CROWN?\nWHO HARDEN THE MAGIC LAWS?\nWE DO, WE DO!"; //canta una canción
					break;
			}
			talkcode++;
		}
	}

}