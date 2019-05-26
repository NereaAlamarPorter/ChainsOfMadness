package 
{
	import screens.Complete1;
	import screens.Credits;
	import screens.Death;
	import screens.FinalCTS;
	import screens.IntroductionCTS;
	import starling.display.Sprite;
	import starling.animation.DelayedCall;
	import starling.events.Event;
	import events.NavigationEvent;
	import screens.MainMenu;
	import screens.TemplatePlayground;
	import screens.Controls;
	
	import flash.media.SoundMixer;
	
	public class Game extends Sprite 
	{
		private var menuScreen:MainMenu;
		private var playScreen:TemplatePlayground;
		private var controlsScreen:Controls;
		private var creditsScreen:Credits;
		private var deathScreen:Death;
		private var complete1Screen:Complete1;
		private var introctsscreen:IntroductionCTS;
		private var finalscreen:FinalCTS;
		
		public static var madness:int;
		
		public function Game() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(e:Event):void 
		{
			
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
				
			playScreen = new TemplatePlayground();
			playScreen.disposeTemporarily();
			this.addChild(playScreen);
			
			menuScreen = new MainMenu();
			this.addChild(menuScreen);
			menuScreen.initialize();
			
			controlsScreen = new Controls();
			controlsScreen.disposeTemporarily();
			this.addChild(controlsScreen);
			
			creditsScreen = new Credits();
			creditsScreen.disposeTemporarily();
			this.addChild(creditsScreen);
			
			deathScreen = new Death();
			deathScreen.disposeTemporarily();
			this.addChild(deathScreen);
			
			complete1Screen = new Complete1();
			complete1Screen.disposeTemporarily();
			this.addChild(complete1Screen);
			
			introctsscreen = new IntroductionCTS();
			introctsscreen.disposeTemporarily();
			this.addChild(introctsscreen);
			
			finalscreen = new FinalCTS();
			finalscreen.disposeTemporarily();
			this.addChild(finalscreen);
			
			
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onChangeScreen(e:NavigationEvent):void 
		{
			switch (e.params.id) {
				case "main_menu":
					finalscreen.disposeTemporarily();
					playScreen.disposeTemporarily();
					controlsScreen.disposeTemporarily();
					creditsScreen.disposeTemporarily();
					deathScreen.disposeTemporarily();
					complete1Screen.disposeTemporarily();
					menuScreen.initialize();
					break;
				case "play":
					menuScreen.disposeTemporarily();
					deathScreen.disposeTemporarily();
					complete1Screen.disposeTemporarily();
					introctsscreen.disposeTemporarily();
					playScreen.initialize();
					break;
					
				case "controls":
					menuScreen.disposeTemporarily();
					controlsScreen.initialize();
					break;
				case "credits":
					menuScreen.disposeTemporarily();
					creditsScreen.initialize();					
					break;
				case "death":
					removeChild(playScreen);
					playScreen = new TemplatePlayground();
					playScreen.disposeTemporarily();
					this.addChild(playScreen);
					deathScreen.initialize();
					break;
				case "complete1":
					removeChild(playScreen);
					playScreen = new TemplatePlayground();
					playScreen.disposeTemporarily();
					this.addChild(playScreen);
					complete1Screen.initialize();
					break;
					
				case "intro":
					menuScreen.disposeTemporarily();
					introctsscreen.initialize();
					break;
				
				case "final":
					menuScreen.disposeTemporarily();
					finalscreen.initialize();
					break;
			}
		}		
	}
}