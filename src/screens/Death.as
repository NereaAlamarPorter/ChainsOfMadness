package screens 
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import events.NavigationEvent;
	import starling.display.Stage;
	
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Grupo7
	 */
	public class Death extends Sprite 
	{
		public var deathArt:Image;
		public var cudrado:Quad;
		
		public function Death() 
		{
			super();
			
			cudrado = new Quad(598, 598, 0x000022);
			cudrado.x = 101;
			cudrado.y = 1;
			this.addChild(cudrado);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);

			
		}
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createdeathArt();
			
		}
		
		private function createdeathArt():void 
		{
			deathArt = new Image(Assets.getTexture("DeathBg"));
			this.addChild(deathArt);
		}
		
		public function initialize():void
		{
			this.visible = true;
			
			if (!Sounds.muteSounds) {
				Sounds.sndPrincessDeath.play();
			}
			
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.V:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "main_menu"}, true));
					break;
				case Keyboard.C:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
					break;
			}
		}	
		
		public function disposeTemporarily():void {
			this.visible = false;
			this.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
	}

}