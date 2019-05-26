package screens 
{
	import starling.display.Sprite;
	
	import starling.display.Quad;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import events.NavigationEvent;
	import starling.display.Stage;
	
	import starling.events.EnterFrameEvent;
	
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.display.Image;
	
	import flash.media.SoundMixer;

	
	
	public class IntroductionCTS extends Sprite
	{
		private var onScreen:Image;
		private var index:int=1;
		private var counter:int = 0;
		
		
		public function IntroductionCTS() 
		{
			super();
			drawScreen();
		}
		
		private function drawScreen():void 
		{
			musicOn();
			
			
			
			 
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void 
		{
			counter++;
			if (counter >= 500) {
				index++;
				if (index <= 10) {
					removeChild(onScreen);
					onScreen = new Image(Assets.getTexture("CTS_Intro_" + index));
					onScreen.scaleX = 2;
					onScreen.scaleY = 2;
					onScreen.x -= 60;
					onScreen.y += 40;
					this.addChild(onScreen);
					counter = 0;
				}
				
				else {
					this.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
					this.removeEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
					finishvideo();
				}
			}
		}
		
		private function finishvideo():void 
		{
			this.visible = false;
			SoundMixer.stopAll();
			removeChild(onScreen);
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "play" }, true));
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			//Cambio del index
			switch(e.keyCode) {
				case Keyboard.C:
					finishvideo();
					break;
			}
		}
		
		public function initialize():void {
			this.visible = true;
			index = 1;
			onScreen = new Image(Assets.getTexture("CTS_Intro_" + index));
			onScreen.scaleX = 2;
			onScreen.scaleY = 2;
			onScreen.x -= 60;
			onScreen.y += 40;
			this.addChild(onScreen);
			musicOn();
			counter = 0;
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
		}
		
		public function disposeTemporarily():void {
			this.visible = false;
			SoundMixer.stopAll();
			this.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.removeEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
		}
		
		public function musicOn():void {
			if (!Sounds.muteMusic) Sounds.sndIntro_Music.play();
			
		}
		
	}

}