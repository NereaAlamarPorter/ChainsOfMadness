package screens.maps 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author Group7
	 */
	public class TemplateMap extends Sprite 
	{
		//RECUERDA QUE LA MATRIZ ESTÁ TRASPUESTA
		public var matrix:Array;
		public var M15:Array = [[5, 5, 5, 5, 5, 5, 5, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[2, 0, 0, 0, 0, 0, 0, 5], 
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 6, 6, 6, 6, 6, 6, 5]];
									
		public var M25:Array = [[5, 6, 6, 6, 6, 6, 6, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 6, 6, 6, 6, 6, 6, 5]];
									
		public var M35:Array = [[5, 6, 6, 6, 6, 6, 6, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 3, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[5, 5, 5, 5, 5, 5, 5, 5]];
									
		public var M34:Array = [[5, 5, 5, 5, 5, 5, 5, 5],
									[6, 0, 0, 0, 0, 0, 0, 6],
									[6, 0, 0, 0, 0, 0, 0, 6],
									[6, 0, 3, 0, 0, 0, 0, 6],
									[6, 0, 0, 0, 0, 0, 0, 6],
									[6, 0, 0, 0, 0, 0, 0, 6],
									[6, 0, 0, 0, 0, 0, 0, 6],
									[5, 5, 5, 5, 5, 5, 5, 5]];
									
		public var M33:Array = [[5, 5, 5, 5, 5, 5, 5, 5],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 3, 0, 0, 0, 0, 6],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 0, 3, 0, 0, 0, 6],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 6, 6, 6, 6, 6, 6, 5]];
									
		public var M43:Array = [[5, 6, 6, 6, 6, 6, 6, 5], 		//EL ENEMIGO EH MU' TOSHO
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 3, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 6, 6, 6, 6, 6, 6, 5]];
									
		public var M53:Array = [[5, 6, 6, 6, 6, 6, 6, 5],		//OZÚ, UNA ANTORSHA
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 1, 5],
									[5, 5, 5, 5, 5, 5, 5, 5]];
									
		public var M52:Array = [[5, 5, 5, 5, 5, 5, 5, 5],
									[6, 0, 0, 0, 0, 0, 0, 6],
									[6, 0, 0, 0, 0, 0, 0, 6],
									[6, 0, 3, 0, 0, 0, 0, 6],
									[6, 0, 0, 0, 0, 0, 0, 6],
									[6, 0, 0, 3, 0, 0, 0, 6],
									[6, 0, 0, 0, 0, 0, 0, 6],
									[5, 5, 5, 5, 5, 5, 5, 5]];
									
		public var M51:Array = [[5, 6, 6, 6, 6, 6, 6, 5],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 5, 5, 5, 5, 5, 5, 5]];
									
		public var M41:Array = [[5, 6, 6, 6, 6, 6, 6, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 3, 0, 0, 0, 0, 5],
									[5, 0, 0, 3, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 6, 6, 6, 6, 6, 6, 5]];
									
		public var M31:Array = [[5, 6, 6, 6, 6, 6, 6, 5],    		//HACIA LA BODEGA
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 5],
									[6, 0, 0, 0, 0, 0, 0, 2],		//Prisionero1
									[5, 2, 0, 0, 0, 0, 0, 5],		//ILLO, 'TA MU' BORRASHO
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 6, 6, 6, 6, 6, 6, 5]];
									
		public var M21:Array = [[5, 5, 5, 5, 5, 5, 5, 5],
									[5, 0, 0, 7, 0, 0, 0, 1], //palanca abrepuertas 3000 (comprela ahora)
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 0, 0, 0, 0, 0, 0, 5],
									[5, 6, 6, 6, 6, 6, 6, 5]];
									
		public var M30:Array = [[5, 5, 5, 5, 5, 5, 5, 5],			//BODEGA
									[5, 5, 0, 0, 5, 5, 5, 5],		//
									[5, 0, 0, 0, 0, 0, 5, 5],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 0, 0, 0, 0, 0, 6],
									[5, 0, 0, 5, 0, 0, 0, 5],
									[5, 1, 5, 5, 0, 0, 5, 5],
									[5, 5, 5, 5, 5, 5, 5, 5]];
									
		public var NM:Array = [[null]];
		
		public var lvlmatrix:Array = [[NM, NM, NM,  M30, NM, NM],
									  [NM, NM, M21, M31, M41, M51],
									  [NM, NM, NM,  NM, NM, M52],
									  [NM, NM, NM, M33,M43, M53],
									  [NM, NM, NM,  M34, NM, NM],
									  [NM, M15, M25, M35, NM, NM]];
									

		
		public var legend:TextField;
		
		public function TemplateMap(X:int,Y:int) 
		{
			super();
			
			matrix = lvlmatrix[X][Y];
			legend = new TextField(200, 200, "" , "Arial", 15, 0x00ff00);
			legend.x = 0;
			legend.y = 100;
			this.addChild(legend);
			legend.visible = false;

			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		public function refreshLegend():void {
			var string:String = " ";
			for (var i:int = 0; i < matrix.length; i++) {
				for (var j:int = 0; j < matrix[i].length; j++) {
					string += matrix [i] [j] + ",";
				}
				string += ";\n";
			}
			legend.text = string;
		}
		
	}
	
	/* ESPACIOS DEL TERRENO 
	 * 0 - casilla pisable
	 * 1 - objeto
	 * 2 - npc
	 * 3 - enemigo
	 * 4 - princesa
	 * 5 - no pisable
	 * 6 - otra matriz
	 * 7 - mago
	 * */	
}