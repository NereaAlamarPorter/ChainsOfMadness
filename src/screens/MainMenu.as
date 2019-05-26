package screens 
{
	import starling.text.TextField;
	import starling.display.Sprite;
	import events.NavigationEvent;
	import starling.display.Stage;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.animation.DelayedCall;
	import starling.display.Button;
	import starling.display.Image;
	import flash.ui.Keyboard;
	import starling.events.KeyboardEvent;
	import starling.core.Starling;
	
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	import flash.media.SoundMixer;
	
	
	/**
	 * ...
	 * @author Group7
	 */
	public class MainMenu extends Sprite 
	{
		private var menuIndex:int;
		private var legend:TextField;
		private var menuArt:Image;
		private var botonsArt:Image;
		private var selectedArt:Image;
		private var selectedbool:Boolean;
		
		private var onsound:Boolean;
		
		public function MainMenu() 
		{
			super();
			drawScreen();
		}
		
		private function drawScreen():void 
		{
			if (!onsound) {
				musicOn();
				onsound = true;
			}
			
			menuIndex = 0;
			legend = new TextField(300, 300, "" + menuIndex, "Arial", 40, 0xff0000);
			legend.x = 300;
			legend.y = 300;
			addChild(legend);
			
			menuArt = new Image(Assets.getTexture("Main_MenuBg"));
			this.addChild(menuArt);
			
			onsound = false;
			
			
			selectedArt = new Image(Assets.getTexture("SelectedBt"));
			selectedArt.x=menuArt.width / 2 - selectedArt.width / 2
			this.addChild(selectedArt);
			selectedbool = true;
			
			botonsArt = new Image(Assets.getTexture("BotonsBt"));
			botonsArt.x = menuArt.width / 2 - botonsArt.width / 2;
			botonsArt.y = menuArt.height / 2 ;
			this.addChild(botonsArt);
			 
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void 
		{
			//Control del index
			if (menuIndex == 0) {
				legend.text = "" + menuIndex + ".Play";
				selectedArt.y = botonsArt.y - 25;
			}
			if (menuIndex == 1) {
				legend.text = "" + menuIndex + ".Controls";
				selectedArt.y = botonsArt.y + 35;
			}
			if (menuIndex == 2) {
				legend.text = "" + menuIndex + ".Credits";
				selectedArt.y = botonsArt.y + 110;
			}
			
			//Transparencia selecet
			if (selectedArt.alpha > 0.7 && selectedbool==true) {
				selectedArt.alpha -= 0.005;
				selectedbool = true;
			}
			else if (selectedArt.alpha < 1) {
				selectedArt.alpha += 0.005;
				selectedbool = false;
			}
			else selectedbool = true;
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			//Cambio del index
			switch(e.keyCode) {
				case Keyboard.DOWN:
					if (menuIndex == 2) {
						menuIndex = 0;
					}
					else {
						menuIndex++;
					}
					break;
				case Keyboard.UP:
					if (menuIndex == 0) {
						menuIndex = 2;
					}
					else {
						menuIndex--;
					}
					break;
				case Keyboard.C:
					changeScreen();
					break;
			}
		}
		
		private function changeScreen():void 
		{
			switch(menuIndex) {
				case 0:
					SoundMixer.stopAll();
					onsound = false;
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "intro" }, true));
					break;
				case 1:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"controls" }, true));
					break;
				case 2:
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"credits" }, true));
					break;
			}
		}
		
		public function initialize():void {
			this.visible = true;
			
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		public function disposeTemporarily():void {
			this.visible = false;
			this.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		public function musicOn():void {
			if (!Sounds.muteMusic) Sounds.sndMenus.play(0, 999);
			
		}
		
	}

}