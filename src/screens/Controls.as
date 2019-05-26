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
	import starling.display.Image;

	/**
	 * ...
	 * @author Group7
	 */
	public class Controls extends Sprite
	{
		public var controlsArt:Image
		
		public function Controls() 
		{
			super();
			//Cosos de la imagen
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);

		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createcontrolsArt();
			
		}
		
		private function createcontrolsArt():void 
		{
			controlsArt= new Image(Assets.getTexture("ControlsBg"));
			this.addChild(controlsArt);
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