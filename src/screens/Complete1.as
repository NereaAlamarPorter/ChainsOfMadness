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
	public class Complete1 extends Sprite 
	{
		public var complete1Art:Image;
		public var cudrado:Quad;
		
		public function Complete1() 
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
			createcomplete1Art();
			
		}
		
		private function createcomplete1Art():void 
		{
			complete1Art = new Image(Assets.getTexture("Complete1Bg"));
			this.addChild(complete1Art);
		}
		
		public function initialize():void
		{
			this.visible = true;
			
			if (!Sounds.muteSounds) {
				Sounds.sndLevelComplete.play();
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
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "final"}, true));
					break;
			}
		}	
		
		public function disposeTemporarily():void {
			this.visible = false;
			this.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
	}

}