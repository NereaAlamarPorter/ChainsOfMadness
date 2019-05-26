package items 
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.text.TextField;
	
	public class Chain extends Sprite 
	{
		public var chain:Quad;
		public const multipler:int = 75;
		public var chainArt:Image;
		
		
		public function Chain() 
		{
			super();
			
			chain = new Quad(multipler, multipler, 0xee22fa);
			chain.visible = false;
			
			chainArt = new Image (Assets.getAtlas().getTexture("chain0"));
			this.addChild(chainArt);
			
			this.addChild(chain);
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function changeChainArt(dir:int):void 
		{
			switch (dir) {
				case 0:
					removeChild(chainArt);
					chainArt = new Image (Assets.getAtlas().getTexture("chain0"));
					chainArt.x = chain.x;
					chainArt.y = chain.y+multipler-15;
					
					this.addChild(chainArt);
					break;
				case 1:
					removeChild(chainArt);
					chainArt = new Image (Assets.getAtlas().getTexture("chain0"));
					chainArt.x = chain.x+ 25;
					chainArt.y = chain.y+multipler-15;
					this.addChild(chainArt);
					break;
				case 2:
					removeChild(chainArt);
					chainArt = new Image (Assets.getAtlas().getTexture("chain3"));
					chainArt.x = chain.x+multipler - 25;
					chainArt.y = chain.y + 20;
					this.addChild(chainArt);
					break;
				case 3:
					removeChild(chainArt);
					chainArt = new Image (Assets.getAtlas().getTexture("chain3"));
					chainArt.x = chain.x-10;
					chainArt.y = chain.y;
					this.addChild(chainArt);
					break;
				default:
					removeChild(chainArt);
					break;
			}
		}
	}
}