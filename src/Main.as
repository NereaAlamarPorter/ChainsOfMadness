package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Group7
	 */
	
	[SWF(width = "800", height = "600", frameRate = "60", backgroundColor = "0x203048")]
	
	public class Main extends Sprite 
	{
		
		private var starling:Starling;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			starling = new Starling( Game, stage);
			starling.antiAliasing = 0;
			starling.start();
		}
		
	}
	
}