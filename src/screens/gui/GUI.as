package screens.gui
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.text.TextField;
	import items.Thoughts;
	
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author Group7
	 */
	public class GUI extends Sprite 
	{
		public var face:Quad;
		public var healthP:Quad;
		public var madnessP:Quad;
		public var thoughts:Quad;
		public var thoughtText:TextField;
		private var thought:Thoughts;
		public var healthPText:TextField;
		public var madnessPText:TextField;
		
		//Art
		public var thoughtArt:Image;
		private var faceArt:Image;
		
		public function GUI(h:int,p:int) 
		{
			super();
			face = new Quad(120, 120, 0x13b6f6);
			face.visible = false;
			healthP = new Quad(200, 15, 0xff1111);
			//healthP.visible = false;
			madnessP = new Quad(20, 15, 0x770077);
			//madnessP.visible = false;
			thoughts = new Quad(200, 80, 0xceb140);
			thoughts.visible = false;
			
			thoughtText = new TextField(200, 80, "FINALLY FREE\nI SHOULD HAVE TAKEN THE SWORD", "Gill Sans MT", 12, 0x000000);
			healthPText = new TextField(75, 20, "" + h + "HP", "Gill Sans MT", 12, 0xffffff);
			madnessPText = new TextField(75, 20, "" + p + "MdP", "Gill Sans MT", 12, 0xffffff);
			
			healthPText.x =	70;
			healthPText.y = 2;
			
			madnessPText.x =73;
			madnessPText.y =22;
			
			thought = new Thoughts();
			
			thoughts.x = 120;
			thoughts.y = 80;
			
			thoughtText.x = 135;
			thoughtText.y = 60;
			
			thoughts.alpha = 0.5;
			
			
			this.addChild(face);
			this.addChild(healthP);
			this.addChild(madnessP);
			this.addChild(madnessPText);
			this.addChild(healthPText);
			this.addChild(thoughts);
			this.addChild(thought);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);			
		}
				
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			creationGUIArt();
		}
		
		private function creationGUIArt():void 
		{
			faceArt = new Image(Assets.getAtlas().getTexture("Face000"));
			this.addChild(faceArt);
			
			thoughtArt = new Image(Assets.getAtlas().getTexture("Thoughts"));
			thoughtArt.x = 40;
			thoughtArt.y = 60;
			this.addChild(thoughtArt);
			this.addChild(thoughtText);
			
			healthP.x = 90;
			healthP.y = 5;
			
			madnessP.x = 90;
			madnessP.y = 25;

		}
		
		public function refreshguiArt(healthPoints:int, madnessPoints :int , thoughtcode :int):void
		{
			
			
			healthP.width = healthPoints * 2;
			madnessP.width = madnessPoints * 2;
			
			healthPText.text =""+ healthPoints + "HP";
			madnessPText.text = "" + madnessPoints + "MdP";
			
			refreshthoughts(thoughtcode);
			
			//Arte
			var i:int = 0;
			var j:int = 0;
			if (madnessPoints > 20) i = 1;
			if (madnessPoints > 35) i = 2;
			if (madnessPoints > 50) i = 3;
			this.removeChild(faceArt);
			if (thoughtcode == 4) j = 1;
			faceArt = new Image(Assets.getAtlas().getTexture("Face0" + j + i));
			this.addChild(faceArt);
			
						
		}
		
		private function refreshthoughts(thoughtcode:int):void
		{
			//Cosa para el arghhh
			if (thoughtcode == 4) thoughtText.fontSize = 30;
			else thoughtText.fontSize = 12;
			
			if (thoughtcode == 14) {
				thoughtText.text = "NICE, THE WOUND STOPPED BLEEDING...\nBUT IT STILL HURTS";
				return;
			}
			
			thoughtText.text = thought.thoughts[thoughtcode];
			
		}
		
		
		
	}

}