package characters 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.text.TextField;
	
	import starling.textures.Texture;
	import starling.display.MovieClip;

	
	/**
	 * ...
	 * @author Group7
	 */
	public class Soldier extends Sprite 
	{
		public var enemy:Quad;
		public var positionX:int;
		public var positionY:int;
		public var healthPoints:int;
		public var legend:TextField;
		public var alive:Boolean;
		public var enabledMov:Boolean = true;
		public var scared:Boolean = false;		//EL NINYO 'TA CAGAO
		public var kind:String;
		public var damage:int;
		
		public var maxPos:int;
		public var nomaxPos:int;
		public var direction:Boolean; //X=true, Y=false
		public var way:int; //-1=revés, 1=derecho
		public var movement2:int;
		
		private const multipler:int = 75;
		
		//Arte
		private var soldierArt:MovieClip;
		
		
		public function Soldier(posX:int, posY:int, health:int, max:int, move:int, dir:Boolean, w:int, dmg:int) 
		{
			super();
			
			damage = dmg;
			positionX = posX;
			positionY = posY;
			healthPoints = health;
			enemy = new Quad(multipler, multipler, 0xff0000);
			
			//VARIABLES PARA CALCULAR EL MOVIMIENTO
			maxPos = max;
			direction = dir;
			way = w;
			movement2 = move * way;
			nomaxPos = 0;
			alive = true;
			kind = new String("S");			
			
			legend = new TextField(multipler, 20, "(" + positionX + "," + positionY + ") HP " + healthPoints, "Arial", 15, 0xffffff);
			
			enemy.visible = false;
			legend.visible = false;
			
			this.addChild(enemy);
			this.addChild(legend);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createSoldierArt();
			
		}
		
		public function refreshLegend():void {
			legend.text = "(" + positionX + "," + positionY + ") HP " + healthPoints;
		}
		
		private function createSoldierArt():void 
		{
			var i:int;
			var j:int = 0;
			if (direction && way == 1) i = 0;
			if (!direction && way == 1) i = 3;
			if (direction && way == -1) i = 1;
			if (!direction && way == -1) i = 2;
			
			if (scared) j = 1;
			
			soldierArt = new MovieClip(Assets.getAtlas().getTextures("Soldier" + i + j), 10);
			starling.core.Starling.juggler.add(soldierArt);
			this.addChild(soldierArt);
		}
		
		
		public function changeSoldiersArt():void {
			
			this.removeChild(soldierArt);
			var i:int;
			var j:int = 0;
			if (direction && way == 1) i = 0;
			if (!direction && way == 1) i = 3;
			if (direction && way == -1) i = 1;
			if (!direction && way== -1) i = 2;
			
			if (scared) j = 1;
			
			if (!scared) {
				
				soldierArt = new MovieClip(Assets.getAtlas().getTextures("Soldier" + i + j), 10);
				starling.core.Starling.juggler.add(soldierArt);
			}
			else {
				soldierArt = new MovieClip(Assets.getAtlas().getTextures("Soldier" + i + j +"1"), 10);
				starling.core.Starling.juggler.add(soldierArt);
			}
			
			this.addChild(soldierArt);

		}
		
	}

}