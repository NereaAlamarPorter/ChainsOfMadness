package screens 
{
	import starling.display.Sprite;
	
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
	import starling.display.Image;
	
	
	
	public class Credits extends Sprite 
	{
		private var creditsArt:Image;
		
		public function Credits() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createcreditsArt();
			
		}
		
		private function createcreditsArt():void 
		{
			creditsArt = new Image(Assets.getTexture("CreditsBg"));
			this.addChild(creditsArt);
		}
		
		public function initialize():void
		{
			this.visible = true;
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.C:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "main_menu"}, true));
					break;
			}
		}	
		
		public function disposeTemporarily():void {
			this.visible = false;
			this.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}		
	}

}