package screens 
{
	import characters.Mage;
	import characters.Princess;
	import items.Thoughts;
	import screens.maps.TemplateMap;
	import characters.Soldier;
	import characters.RoyalAdvisor;
	import items.MagicBall;
	import items.Item;
	import screens.gui.GUI;
	import characters.DrunkSoldier;
	import events.NavigationEvent;
	import items.Chain;
	import characters.Prisioner1;
	
	import starling.core.Starling;
	import starling.events.Event;
	import flash.ui.Keyboard;
	import starling.events.KeyboardEvent;
	import starling.display.Stage;
	import starling.events.EnterFrameEvent;
	import starling.display.Button;
	import starling.display.Quad;
	import Math;
	import flash.geom.Point;
	import starling.text.TextField;
	
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.display.Image;
	import starling.display.Sprite;
	
	import flash.media.SoundMixer;
	
	
	
	//PONER MÁS NPCs? (muy fácil de hacer)
	//PONER IMAGENES !!!!!

	public class TemplatePlayground extends Sprite 
	{
		/*
		 * VARIABLES
		 * VARIABLES
		 * VARIABLES
		 * */
		
		//ACTORS CREATION
		private var leg:TextField;
		private var queen:Princess;
		private var map:TemplateMap;
		private var soldier:Soldier;
		private var enemies:Vector.<Soldier>;
		private var mage:Mage;
		private var ball:MagicBall;
		private var item:Item;
		private var royalAd:RoyalAdvisor;
		private var drunkSol:DrunkSoldier;
		
		private var chain:Chain;
		private var prisioner1:Prisioner1;
		
		//CREATION OF CONSTANTS
		private var positionPoint:Point;
		private var counter:int = 0;
		private var contdamage:int;
		private var contchain:int;
		private var contthought:int = 0;
		private var contBall:int;
		private var matrixX:int;
		private var matrixY:int;
		
		private const multipler:int = 75;
		
		private var princessposiblepos:int;
		private var timeToDeath:int;
		
		//CREATION OF BOOLEANS
		private var booldamage:Boolean;
		private var boolchain:Boolean;
		private var enabledBall:Boolean;
		private var ballOnMove:Boolean = false;
		private var handDamage:Boolean = true;
		private var shitsoldiers:Boolean = false; //especifico para el pensamiento shitsoldiers
		private var olalatheroyalad:Boolean = false; //especifico para el pensamiento 1
		private var seetorch:Boolean = false; //especifico para el pensamiento 6
		private var seedrunk:Boolean = false; //especifico para el pensamiento 7
		private var magedeath:Boolean; //comprueba si el mago estña muerto
		private var dead:Boolean = false;
		private var usetorch:Boolean = false;
		private var firstusetorch:Boolean = true;
		private var fallingdown:Boolean = false;
		
		//INTERFACE
		private var interfaz:GUI;
		private var thoughts:Thoughts;
		private var thoughtscode:int=0;
		private var thoughtscodevisual:int=0;
		
		//PRINCESS CONVERSATION
		private var talkbool:Boolean = false;
		
		private var voicebool:Boolean = false;
		private var voicecont:int = 0;
		
		//Art
		private var backgroundArt:Image;
		private var backgroundArt0:Image;
		private var backgroundArt1:Image;
		
		//Sangre
		private var blood01:Image;
		private var blood02:Image;
		private var bloodint:int=1;
		private var bloodcont:int = 0;
		
		
		//Sonidos continuos
		private var contwalk:int = 0;
		
		/*
		 * CÓDIGO
		 * CÓDIGO
		 * CÓDIGO
		 * */
		
		
		//CONSTRUCTOR
		
		public function TemplatePlayground() {
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		//EVENTOS
		
		private function onAddedToStage(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onKeyUp(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case Keyboard.RIGHT:
					queen.right = false;
					break;
					
				case Keyboard.LEFT:
					queen.left = false;
					break;	
					
				case Keyboard.UP:
					queen.up = false;
					break;
					
				case Keyboard.DOWN:
					queen.down = false;
					break;
			}
						
			if (queen.right && !queen.left && !queen.up && !queen.down) queen.direction = 0;
			if (!queen.right && queen.left && !queen.up && !queen.down) queen.direction = 1;
			if (!queen.right && !queen.left && queen.up && !queen.down) queen.direction = 2;
			if (!queen.right && !queen.left && !queen.up && queen.down) queen.direction = 3;
			
			
			queen.changePrincessArt();
			
		}
		
		private function onKeyDown(e:KeyboardEvent):void {	
			
			
		
			switch(e.keyCode) {
				case Keyboard.RIGHT:
					queen.previousdir = queen.direction;
					queen.direction = 0;
					if (! talkbool) {
						if (royalAd.bubbleArt.visible = true) {
							royalAd.bubbleArt.visible = false;
							royalAd.text.visible = false;
						}
						
						if (drunkSol.bubble.visible = true) {
							drunkSol.bubble.visible = false;
							drunkSol.text.visible = false;
						}
						
						if (prisioner1.bubble.visible = true) {
							prisioner1.bubble.visible = false;
							prisioner1.text.visible = false;
						}
						
						queen.right = true;
						queen.changePrincessArt();
						princessposiblepos = princessCheckPossiblePos(map, queen);
						switch (princessposiblepos) {
							case 0:
								queen.right = true;
								break;
								
							case 2:
								queen.right = false;
								break;
								
							case 6:
								//changeMap();
								queen.right=true;
								break;
								
							case 5:
								queen.right = false;
								break;
								
							case 4:
								queen.right = true;
								break;
						}
					}
					break;
				
				case Keyboard.LEFT:
					queen.previousdir = queen.direction;
					queen.direction = 1;
					if (! talkbool) {
						if (royalAd.bubbleArt.visible = true) {
							royalAd.bubbleArt.visible = false;
							royalAd.text.visible = false;
						}
						
						if (drunkSol.bubble.visible = true) {
							drunkSol.bubble.visible = false;
							drunkSol.text.visible = false;
						}
						
						if (prisioner1.bubble.visible = true) {
							prisioner1.bubble.visible = false;
							prisioner1.text.visible = false;
						}
						
						queen.left = true;
						queen.changePrincessArt();
						princessposiblepos = princessCheckPossiblePos(map, queen);
						switch (princessposiblepos) {
							case 0:
								queen.left = true;
								break;
								
							case 2:
								queen.left = false;
								break;
								
							case 6:
								//changeMap();
								queen.left = true;
								break;
								
							case 5:
								queen.left = false;
								break;
								
							case 4:
								queen.left = true;
								break;
						}
					}
					break;
					
				case Keyboard.UP:
					queen.previousdir = queen.direction;
					queen.direction = 2;
					if (! talkbool) {
						if (royalAd.bubbleArt.visible = true) {
							royalAd.bubbleArt.visible = false;
							royalAd.text.visible = false;
						}
						
						if (drunkSol.bubble.visible = true) {
							drunkSol.bubble.visible = false;
							drunkSol.text.visible = false;
						}
						
						if (prisioner1.bubble.visible = true) {
							prisioner1.bubble.visible = false;
							prisioner1.text.visible = false;
						}
						
						queen.up = true;
						queen.changePrincessArt();
						princessposiblepos = princessCheckPossiblePos(map, queen);
						switch (princessposiblepos) {
							
							case 0:
								queen.up = true;
								break;
								
							case 2:
								queen.up = false;
								break;
								
							case 5:
								queen.up = false;
								break;
								
							case 6:
								//changeMap();
								queen.up = true;
								break;
								
							case 4:
								queen.up = true;
								break;
							
						}
					}
					break;
					
				case Keyboard.DOWN:
					queen.previousdir = queen.direction;
					queen.direction = 3;
					if (! talkbool) {
						if (royalAd.bubbleArt.visible = true) {
							royalAd.bubbleArt.visible = false;
							royalAd.text.visible = false;
						}
						
						if (drunkSol.bubble.visible = true) {
							drunkSol.bubble.visible = false;
							drunkSol.text.visible = false;
						}
						
						if (prisioner1.bubble.visible = true) {
							prisioner1.bubble.visible = false;
							prisioner1.text.visible = false;
						}
						
						queen.down = true;
						queen.changePrincessArt();
						princessposiblepos = princessCheckPossiblePos(map, queen);
						switch (princessposiblepos) {
							case 0:
								queen.down = true;
								break;
								
							case 2:
								queen.down = false;
								break;
								
							case 5:
								queen.down = false;
								break;
								
							case 6:
								//changeMap();
								queen.down = true;
								break;
								
							case 4:
								queen.down = true;
								break;
						}
					}
					break;
					
				case Keyboard.C:
					if (! talkbool) {
						if (royalAd.bubbleArt.visible = true) {
							royalAd.bubbleArt.visible = false;
							royalAd.text.visible = false;
						}
						
						if (drunkSol.bubble.visible = true) {
							drunkSol.bubble.visible = false;
							drunkSol.text.visible = false;
						}
						
						if (prisioner1.bubble.visible = true) {
							prisioner1.bubble.visible = false;
							prisioner1.text.visible = false;
						}
						
						if (boolchain) {
							boolchain = false;
							var Pcx: int = queen.positionX;
							var Pcy: int = queen.positionY;
							princessChain();
						}
					}
					break;
					
				case Keyboard.V:
					var Pvx: int = queen.positionX;
					var Pvy: int = queen.positionY;
					if (!voicebool)princessVoice();
			}
		}
		
		private function onEnterFrame(e:Event):void {
			refreshMap();
			enemiesMovement();
			
			interfaz.refreshguiArt(queen.healthPoints, queen.madnessPoints, thoughtscodevisual);
			if (thoughtscodevisual == 14) usetorch = false;
			
			//Rastro de sangre
			if (handDamage && bloodcont >= 45) princessBlood();
			else bloodcont++;
			blood01.alpha -= 0.01;
			blood02.alpha -= 0.01;
			
			//Musica
			if (thoughtscodevisual == 23) {
				if (!fallingdown) {
					if (!Sounds.muteSounds) {
						Sounds.sndFallingDown.play();
					}
					fallingdown = true;
				}
			}
			else fallingdown = false;
			
			//Walk Sound
			if ((contwalk == 20 ||contwalk == 40 || contwalk == 60) && queen.onmove==0) {
				if (!Sounds.muteSounds) {
					Sounds.sndPrincessWalk.play();
					}
			}
			if (contwalk == 15 ||contwalk == 35 || contwalk == 55 ) {
				if (!Sounds.muteSounds) {
					if (enemies.length != 0) {
						Sounds.sndEnemyWalk.play();
					}
				}
			}
			
			if (contwalk == 60 && queen.onmove==0) {
				if (!Sounds.muteSounds) {
					Sounds.sndChainWalk.play();
				}
			}
			if (contwalk > 60) contwalk = 0;
			contwalk++
			
			
			
			//Siguientes
			princessMovement();
			
			
			//Desangrandose
			counter++;
			if (counter >= 300 && handDamage == true) 
			{ 
				queen.healthPoints--;
				if (queen.healthPoints <= 0) {
					princessDeath();
				}
				counter = 0;
			}
			
			//Para controlar los pensamientos
			contthought++
			if (contthought >= 300) {
				contthought = 0;
				thoughtscodevisual = thoughtscode;
			}
			
			//Pensamientos: No pasa nada
			if (matrixX ==1  && matrixY ==2 ) {
				changeThought(13);
			}
			
			else {
				if (matrixX ==5  && matrixY ==1 && queen.positionY<3 && !olalatheroyalad){
					olalatheroyalad = true;
					changeThought(1);
					thoughtscodevisual = thoughtscode;
					contthought = 0;
				}
				if (queen.healthPoints <= 8 && handDamage) {
					changeThought(5);
					thoughtscodevisual = thoughtscode;
					contthought = 0;
				}
			}
			
			//para controlar princessvoice
			if (voicebool) voicecont++;
			if (voicecont >= 20) {
				voicebool = false;
				voicecont = 0;
			}
			
			changeThought(10);
			
			
			//Para controlar el ataque del mago

			if (!magedeath) {
				mageMovement();
				if (ballOnMove) {
					BallMovement();
				}
				
				if (! enabledBall && mage.visible) contBall++;
				
				if (contBall >= 150 && matrixX == 1 && matrixY == 2) {
					enabledBall = true;
					contBall = 0;
					mage.enableMov = true;
				}
			}
			
			
			
			//Evita que la bola aparezca
			
			if (matrixX != 1 && matrixY != 2) {
				enabledBall = false;
			}
			
			//Para controlar el ataque de la princesa y la recepción de daño de la princesa
			if (! boolchain) {
				contchain++;
			}
			if (contchain >= 15) {
				queen.onattack = 0;
				chain.changeChainArt(4);
				queen.changePrincessArt();
			}
			
			if (contchain >= 30) {
				contchain = 0;
				boolchain = true;
			}
			
			if (! booldamage) {
				contdamage++;
			}
			
			if (contdamage >= 60) {
				contdamage = 0;
				booldamage = true;
			}
			
			//Baja la opacidad de la interfaz correspondiente a los pensamientos si la princesa pasa por encima
			if (matrixX==1 && matrixY==2){
				
				if (queen.bounds.intersects(interfaz.bounds) || mage.bounds.intersects(interfaz.bounds)) {
					if (interfaz.thoughtArt.alpha > 0.3) {
						interfaz.thoughtArt.alpha -= 0.03;
						interfaz.thoughtText.alpha -= 0.03;
					}
				}
				else if (!queen.bounds.intersects(interfaz.bounds) && !mage.bounds.intersects(interfaz.bounds)) {
					if (interfaz.thoughtArt.alpha < 1) {
						interfaz.thoughtArt.alpha += 0.03;
						interfaz.thoughtText.alpha += 0.03;
					}
				}
			}
			else {
				if (queen.bounds.intersects(interfaz.bounds))  {
					if (interfaz.thoughtArt.alpha > 0.3) {
						interfaz.thoughtArt.alpha -= 0.03;
						interfaz.thoughtText.alpha -= 0.03;
					}
				}
				else {
					if (interfaz.thoughtArt.alpha < 1) {
						interfaz.thoughtArt.alpha += 0.03;
						interfaz.thoughtText.alpha += 0.03;
					}
				}				
			}
		}
		
		public function disposeTemporarily():void{
			this.visible = false;
			SoundMixer.stopAll();
		}
		
		//ESENCIALES
		
		public function initialize():void{
			this.visible = true;
			
			if (!Sounds.muteMusic) Sounds.sndInGame.play(0, 999);
			
			drawGame();
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
		}	
			
		private function drawGame():void {
			
			////Borracho
			//matrixX = 1;
			//matrixY = 3;
			
			//Torch
			//matrixX = 3;
			//matrixY = 5;
			//
			//Bodega
			//matrixX = 0;
			//matrixY = 3;
			
			//Inciciooficial
			matrixX = 5;
			matrixY = 1;
			
			map = new TemplateMap(matrixX, matrixY);
			
			//Arte
			
			
			
			
			backgroundArt = new Image(Assets.getTexture("Casilla" + matrixX + matrixY));
			backgroundArt.x = 85;
			this.addChild(backgroundArt);
			
			if (map.matrix[0][2] == 6) {
				backgroundArt0= new Image(Assets.getTexture("Casilla" + matrixX + (matrixY-1)));
				backgroundArt0.x = backgroundArt.x - backgroundArt.width + multipler * 2;
				this.addChildAt(backgroundArt0, 0);
			}
			if (map.matrix[7][2] == 6) {
				backgroundArt1= new Image(Assets.getTexture("Casilla" + matrixX + (matrixY + 1)));
				backgroundArt1.x = backgroundArt.x + backgroundArt.width - multipler * 2 ;
				this.addChildAt(backgroundArt1, 0);
			}
			
			
			
			//Juego			
			queen = new Princess(2, 3);
			magedeath = false;
			chain = new Chain();
			
			enemies = new Vector.<Soldier>;
			
			mage = new Mage(10, 1, 5);
			mage.visible = false;
			
			royalAd = new RoyalAdvisor(4, 0, 4);
			royalAd.visible = false;
			
			drunkSol = new DrunkSoldier(5, 1, 10);
			drunkSol.visible = false,
			
			prisioner1 = new Prisioner1(4, 7, 4);
			prisioner1.visible = false;
			
			
			leg = new TextField(300, 300, "", "Arial", 15, 0xffffff);
			leg.x = 30;
			leg.y = 30;
			
			
			interfaz = new GUI(queen.healthPoints, queen.madnessPoints);
			
			
			
			this.addChild(map);
			this.addChild(leg);
			
			this.addChild(chain);
			this.addChild(prisioner1);
			
			this.addChild(queen);
			this.addChild(mage);			
			this.addChild(royalAd);
			this.addChild(drunkSol);
			
			
			
			this.addChild(interfaz);
			
			objectGenerator(map.matrix);
			refreshMap();
		}
		
		//PRINCESA
		
		private function princessBlood():void {
			var index:int;
			if (bloodint == 1) {
				bloodint++;
				removeChild(blood01);
				blood01 = new Image(Assets.getAtlas().getTexture("blood01"));
				switch(queen.direction) {
					case 0:
							blood01.x = queen.x;
							blood01.y = queen.y + queen.height - 20;
						break;
					case 1:
							blood01.x = queen.x + queen.width - 20;
							blood01.y = queen.y + queen.height - 20;
						break;
					case 2:
							blood01.x = queen.x;
							blood01.y = queen.y + queen.height ;
						break;
					case 3:
							blood01.x = queen.x + queen.width - 20;
							blood01.y = queen.y + 20;
						break;
					
				}
				blood01.alpha = 1;
				blood01.visible = true;
				this.addChildAt(blood01, 3);
			}
			
			else {
				bloodint = 1;
				removeChild(blood02);
				blood02 = new Image(Assets.getAtlas().getTexture("blood02"));
				switch(queen.direction) {
					case 0:
							blood02.x = queen.x;
							blood02.y = queen.y + queen.height - 20;
						break;
					case 1:
							blood02.x = queen.x + queen.width-20;
							blood02.y = queen.y + queen.height - 20;
						break;
					case 2:
							blood02.x = queen.x;
							blood02.y = queen.y + queen.height ;
						break;
					case 3:
							blood02.x = queen.x + queen.width- 20;
							blood02.y = queen.y + 20;
						break;
				}
				blood02.visible = true;
				blood02.alpha = 1;
				this.addChildAt(blood02, 4);			
			}
			bloodcont = 0;
		}
		
		private function princessVoice():void {
			voicebool = true;
			
			var px:int = queen.positionX;
			var py:int = queen.positionY;
			
			switch (queen.direction) {
				case 0:
					px++;
					break;
				case 1:
					px--;
					break;
				case 2:
					py--;
					break;
				case 3:
					py++;
					break;
			}
			
			switch(map.matrix[px][py]) {
				//Objetos
				case 1:
					if (item.kind == "torch") 
					{
						queen.healthPoints -= 2;
						if (queen.healthPoints <= 0) princessDeath();
						if (! handDamage) queen.madnessPoints += 1;
						handDamage = false;
						changeThought(4);
						thoughtscodevisual = thoughtscode;
						contthought = 120;
						if (firstusetorch) {
							usetorch = true;
							firstusetorch = false;
						}
						if (!Sounds.muteSounds) {
							Sounds.sndPrincessDamage.play();
						}
					}
					
					if (item.kind == "meat") {
						if (queen.item == "") {
							queen.item == "meat";
							item.visible = false;
							changeThought(8);
							thoughtscodevisual = thoughtscode;
							contthought = 0;
							map.matrix[item.positionX][item.positionY] = 0;
						}
						
						if (!Sounds.muteSounds) {
							Sounds.sndItemTake.play();
						}
					}
					
					if (item.kind == "lever") {
						
						map.M15[4][0] = 5;	
						map.M31[4][7] = 5;
						item.lever.texture = (Assets.getAtlas().getTexture("Lever001"));
						
						if (!Sounds.muteSounds) {
							Sounds.sndItemTake.play();
						}
					}
					break;
					
				//NPCs
				case 2:
					//RoyalAd
					if (royalAd.positionX == px && royalAd.positionY == py) {
						if (royalAd.talkcode < 3) {
							talkbool = true;
							royalAd.talk();							
						}
						
						else {
							talkbool = false;
							royalAd.talk();
							changeThought(2);
							thoughtscodevisual = thoughtscode;
							contthought = 0;
						}
						
						if (royalAd.talkcode > 3) {
							royalAd.bubbleArt.visible = true;
							royalAd.text.visible = true;
							royalAd.talk();
						}	
					}
					
					//DrunkSol
					if (drunkSol.positionX == px && drunkSol.positionY == py) {
						if (drunkSol.talkcode < 3) {
							talkbool = true;
							drunkSol.talk();
						}
						
						else {
							talkbool = false;
							drunkSol.talk();
							if (!seedrunk) {
								changeThought(7);
								thoughtscodevisual = thoughtscode;
								contthought = 0;
							}
						}
						
						if (drunkSol.talkcode > 3) {
							drunkSol.bubble.visible = true;
							drunkSol.text.visible = true;
							drunkSol.talk();
						}
					}
					
					//Prisioner1
					if (prisioner1.positionX == px && prisioner1.positionY == py) {
						if (map.matrix[5][1]==2){
							if (prisioner1.talkcode<3) {
								talkbool = true;
								prisioner1.talk();							
							}
							else {
								talkbool = false;
								prisioner1.talk();
							}
							if (prisioner1.talkcode > 4) {
								prisioner1.bubble.visible = true;
								prisioner1.text.visible = true;
								prisioner1.talk();
							}
						}
						
						else{
							prisioner1.talkcode = 3;
							talkbool = false;
							prisioner1.bubble.visible = true;
							prisioner1.text.visible = true;
							prisioner1.talk();
						}
					}
					break;
			}
		}
		
		private function princessChain():void {
			
			if (!Sounds.muteSounds) {
				Sounds.sndChainAttack.play();
			}
			
			//COLOCACIÓN DE LA CADENA
			switch (queen.direction) {
				case 0:
					chain.height = (multipler-1)/2;
					chain.width = multipler;
					
					chain.x = queen.x + multipler; 
					chain.y = queen.y + (multipler-1)/4;
					break;
				case 1:
					chain.height = (multipler-1)/2;
					chain.width = multipler;
					
					chain.x = queen.x - multipler; 
					chain.y = queen.y + (multipler - 1) / 4;
					break;
				case 2:
					chain.height = multipler;
					chain.width =(multipler-1)/2;
					
					chain.x =queen.x + (multipler-1)/4; 
					chain.y = queen.y - multipler;
					break;
				case 3:
					chain.height = multipler;
					chain.width =(multipler-1)/2;
					
					chain.x = queen.x + (multipler-1)/4; 
					chain.y = queen.y  + multipler;
					break;
			}
			
			queen.onattack = 1;
			queen.changePrincessArt();
			chain.changeChainArt(queen.direction);
			
			//ATAQUE A LOS SOLDADOS  enemies[i].bounds.intersects(queen.chain.bounds)
			var enemy:Soldier ;
			for (var i:int = 0; i < enemies.length; i++) {
				if (enemies[i].bounds.intersects(chain.bounds) && enemies[i].alive == true) {
					enemies[i].healthPoints -= queen.calculateDamage();
					enemies[i].enabledMov = false;
					if (!Sounds.muteSounds) {
						Sounds.sndEnemyDead.play();
					}
					
					if (enemies[i].healthPoints <= 2 && enemies[i].scared == false) {
						queen.madnessPoints -= 2;
						enemies[i].scared = true;
						if (queen.madnessPoints < 0) queen.madnessPoints = 0;
					}
					
					//Pensamiento
					if (enemies[i].scared == false) {
						changeThought(11);
						thoughtscodevisual = thoughtscode;
						contthought = 0;
					}
					else {
						changeThought(12);
						thoughtscodevisual = thoughtscode;
						contthought = 0;
					}
					
					
					if (enemies[i].healthPoints <= 0) {
						if (enemies[i].scared) queen.madnessPoints += 4;
						else queen.madnessPoints += 2;
						
						enemy = enemies[i];
						map.matrix[enemies[i].positionX] [enemies[i].positionY] = 0;
						enemies[i].alive = false;
						enemies.splice(i,i);
						removeChild(enemy);
						
						break;
					}
				}
			}
			
			//ATACA NPCs
			
			//Consejero Real
			if (matrixX == 5 && matrixY == 1) {
				if (chain.bounds.intersects(royalAd.bounds)) {
					royalAd.healthPoints -= queen.calculateDamage();
					queen.madnessPoints += 5;
					
					royalAd.bubbleArt.visible = true;
					royalAd.text.text = "YOUR...YOUR HIGHNESS\n WHY!!";
					royalAd.text.visible = true;
					if (!Sounds.muteSounds) {
						Sounds.sndEnemyDead.play();
					}
					
					if (royalAd.healthPoints <= 0) {
						queen.madnessPoints += 5;
						map.matrix[royalAd.positionX][royalAd.positionY] = 5;
						royalAd.x = 0;
						royalAd.y = 0;
						this.removeChild(royalAd);
					}
				}
			}
			
			//Soldado borracho y Prisioner1 
			if (matrixX == 1 && matrixY == 3) {
				if (chain.bounds.intersects(drunkSol.bounds)) {
					drunkSol.healthPoints -= queen.calculateDamage();
					queen.madnessPoints += 3; //He bajado la locura que da porque subia demasiado. Ahora matar a cualquier npc da la misma locura.
					
					drunkSol.bubble.visible = true;
					drunkSol.text.text = "AGGHH FUCKING WOMAN!!";
					drunkSol.text.visible = true;
					if (!Sounds.muteSounds) {
						Sounds.sndEnemyDead.play();
					}
					
					if (drunkSol.healthPoints <= 0) {
						map.matrix[drunkSol.positionX][drunkSol.positionY] = 0;
						drunkSol.x = 0;
						drunkSol.y = 0;
						removeChild(drunkSol);
					}
				}
				
				if (chain.bounds.intersects(prisioner1.bounds)) {
					prisioner1.healthPoints -= queen.calculateDamage();
					queen.madnessPoints += 5;
					prisioner1.bubble.visible = true;
					prisioner1.text.text = "YOUR...YOUR HIGHNESS\n WHY!!";
					prisioner1.text.visible = true;
					if (!Sounds.muteSounds) {
						Sounds.sndPrincessDamage.play();
					}
					
					if (prisioner1.healthPoints <= 0) {
						queen.madnessPoints += 5;
						map.matrix[prisioner1.positionX][prisioner1.positionY] = 5;
						prisioner1.x = 0;
						prisioner1.y = 0;
						removeChild(prisioner1);
						if (!Sounds.muteSounds) {
							Sounds.sndPrincessDeath.play();
						}
					}
				}
			}
			
			//Mago
			if (chain.bounds.intersects(mage.bounds)) {
				mage.healthPoints -= queen.calculateDamage();
				//mage.enableMov = false;
				if (!Sounds.muteSounds) {
					Sounds.sndEnemyDead.play();
				}
				
				
				if (mage.healthPoints <= 0) {
					map.matrix[mage.positionX] [mage.positionY] = 0;
					magedeath = true;
					mage.x = 0;
					mage.y = 0;
					removeChild(mage);
					removeChild(ball);
					enabledBall = false;
					//abre la puerta
					map.matrix[0][3] = 6;
					map.matrix[0][4] = 6;
					
				}
			}
			/*
			chain.x = queen.queen.x;
			chain.y = queen.queen.y;
			*/
			}
		
		private function princessDeath ():void {
			changeThought(9);
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "death" }, true));
		}
		
		private function princessMovement ():void {
			
			//Comprobación cambio de matriz
			princessposiblepos = princessCheckPossiblePos(map, queen);
			if (princessposiblepos == 6) {
				changeMap();
			}
			
			//MUSICA
			
			if (queen.onmove == 0 && !Sounds.muteSounds) {
			}
			
			//Movimiento
			if (princessposiblepos==0 ||princessposiblepos==4 ||princessposiblepos==6){
				if (queen.right == true ) {
					queen.x += queen.speed;
					if (chain.chainArt.visible ==visible) chain.chainArt.x+=queen.speed ;
				}
				else if (queen.left == true) {
					queen.x -= queen.speed;
					if (chain.chainArt.visible ==visible) chain.chainArt.x-=queen.speed ;
				}
				if (queen.up == true) {
					queen.y -= queen.speed;
					if (chain.chainArt.visible ==visible) chain.chainArt.y-=queen.speed ;
				}
				else if (queen.down == true) {
					queen.y += queen.speed;
					if (chain.chainArt.visible ==visible) chain.chainArt.y+=queen.speed ;
				}
			}
		}
		
		private function changeThought(i:int):void {
			var j:int = 0;
			var max:int = 0;
			var min:int = 0;
			
			if (usetorch) {
				thoughtscode = 14;
				return;
			}
			
			if (i < 10) { 
				thoughtscode = i; //Pensamientos especificos
				return;
			}
			else {
				if (i == 10) { //Pensamientos mientras no pasa nada
					if (handDamage){ //Si pierde sangre
						max = 12;
						min = 10;
					}
					else {
						if (queen.madnessPoints < 20 )
						{
							max = 15;
							min = 13;
						}
						else if (queen.madnessPoints < 35 )
						{
							max = 21;
							min = 16;
						}
						else
						{
							max = 24;
							min = 22;
						}
					}
				}
				
				if (i == 11) { //Cuando ataca a los guardias y no estan asustados
					if (queen.madnessPoints <20 ) {
							thoughtscode = 25;
							return;
						}
						else if(queen.madnessPoints <35 ) {
							max = 27;
							min = 26;
						}
						else
						{
							thoughtscode = 28;
							return;
						}
				}
				
				if (i == 12) { //Cuando ataca a los guardias y estan asustados (reducimos en 2 los madnesspoints para ajustar datos)
					if (queen.madnessPoints <18 ) {
							max = 31;
							min = 29;
						}
						else if(queen.madnessPoints <33 ) {
							max = 33;
							min = 32;
						}
						else
						{
							max = 36;
							min = 34;
							
							if (queen.madnessPoints >=43){
								max = 39;
								min = 37;
							}
						}
				}
				
				if (i == 13) { //Mago
					if (queen.madnessPoints <20 ) {
							max = 44;
							min = 40;
						}
						else if(queen.madnessPoints <35 ) {
							max = 49;
							min = 45;
						}
						else
						{
							max = 54;
							min = 50;
						}
				}
				
				j = Math.floor(Math.random() * (max - min + 1)) + min;
				thoughtscode = j;
			}	
		}
		
		private function princessCheckPossiblePos(t:TemplateMap, obj:Princess):int{
			var supercoordenada: Point = new Point(0, 0);
			var subcoordenada:Point = new Point(0, 0);
			var supernumber:int;
			var subnumber:int;
			var x:int;
			var y:int;
			
			if (obj.direction == 0) {
				x = 4;
				y = 0;
				
				supercoordenada.x = obj.x + obj.width + x;
				supercoordenada.y = obj.y + y + 2*x;
				
				subcoordenada.x = obj.x + obj.width + x;
				subcoordenada.y = obj.y + obj.height + y - 2*x;
			}
			
			else if (obj.direction == 1) {
				x = -4;
				y = 0;
				
				supercoordenada.x = obj.x + x;
				supercoordenada.y = obj.y + y - 2*x;
				
				subcoordenada.x = obj.x + x;
				subcoordenada.y = obj.y + obj.height + y + 2 * x; 
			}
			
			else if (obj.direction == 2) {
				x = 0;
				y = -4;
				
				supercoordenada.x = obj.x + x - 2 * y;
				supercoordenada.y = obj.y + y;
				
				subcoordenada.x = obj.x + obj.width + x + 2*y;
				subcoordenada.y = obj.y + y;
			}
			
			else if (obj.direction == 3) {
				x = 0;
				y = 4;
				
				supercoordenada.x = obj.x + x + 2* y;
				supercoordenada.y = obj.y + obj.height + y ;
				
				subcoordenada.x = obj.x + obj.width + x - 2 * y;
				subcoordenada.y = obj.y + obj.height + y;
			}
			
			supercoordenada.x = ((supercoordenada.x - supercoordenada.x % multipler) / multipler)-1;
			supercoordenada.y = (supercoordenada.y - supercoordenada.y % multipler) / multipler;
			
			subcoordenada.x = ((subcoordenada.x - subcoordenada.x % multipler) / multipler)-1;
			subcoordenada.y = (subcoordenada.y - subcoordenada.y % multipler) / multipler;
			
			supernumber = t.matrix[supercoordenada.x][supercoordenada.y];
			subnumber = t.matrix[subcoordenada.x][subcoordenada.y];
			
			if (supernumber > subnumber) {return supernumber;}
			
			else { return subnumber;}
		}
		
		//ENEMIGOS
		
		private function mageMovement():void {
			//POR SI NO SE ELIMINA BIEN
			if(mage.healthPoints <= 0){
				map.matrix[mage.positionX][mage.positionY] = 4;
				mage.enableMov = false;
				enabledBall = false;
				removeChild(mage);
				removeChild(ball);
				
				magedeath = true;
			}
			
			
			//1.MOVIMIENTO
			if (mage.enableMov == true) {
				
				if (mage.positionY == queen.positionY) {
					
					
					if (enabledBall == true) {
						ball = new MagicBall(mage.damage, 5, mage.y+ mage.height/2, mage.x + mage.width);
						this.addChild(ball);
						enabledBall = false;
						ballOnMove = true;
						mage.enableMov = false;
						if (!Sounds.muteSounds) {
							Sounds.sndBallMove.play();
						}
					}
				}
				
				else{
					if (mage.way == 1) {
						if (mage.y <= multipler*6) {
							mage.y += 2;
						}
						else {
							mage.way = -1;
						}
					}
					else {
						if (mage.y >= 82) {
							mage.y -= 2;
						}
						else {
							mage.way = 1;
						}
					}
				}
			}
			//Daño al tocar a la princesa
			if (mage.bounds.intersects(queen.bounds)) {
				if (booldamage) {
					booldamage = false;
					switch (queen.direction) {
					case 0:
						queen.x -= 15;
						break;
					case 1:
						queen.x += 15;
						break;
					case 2:
						queen.y += 15;
						break;
					case 3:	
						queen.y -= 15;
						break;
					}
					changeThought(4);
					thoughtscodevisual = thoughtscode;
					contthought = 0;
					
					//mage.enableMov = false;
					queen.healthPoints -= mage.damage;
					if (!Sounds.muteSounds) {
						Sounds.sndPrincessDamage.play();
					}
					
					if (queen.healthPoints <= 0) { princessDeath(); }
				}
			
			}
			
			//2.ACTUALIZAR LA POSICION DEL MAGO EN EL MAPA
			positionPoint = matrixposition(mage);
			mage.positionX = positionPoint.x;
			mage.positionY = positionPoint.y;
			mage.refreshLegend();
		}
		
		private function enemiesMovement():void {
			var ecpi:int;
			
			for (var i:int = 0; i < enemies.length; i++) {
				if (enemies[i].alive == true && enemies[i].enabledMov == true && enemies[i].scared == false) 
				{
					ecpi = enemiesCheckPossiblePos(map, enemies[i]);
					
					//Movimiento
					if (ecpi != 0 && ecpi != 4 && ecpi != 3) {
						enemies[i].way *= -1;
						enemies[i].movement2 *= -1;
						enemies[i].nomaxPos = 0;
						enemies[i].nomaxPos += Math.abs(enemies[i].movement2);	
						
						if (enemies[i].direction == true) enemies[i].x += enemies[i].movement2;
						else enemies[i].y += enemies[i].movement2;
						
						enemies[i].changeSoldiersArt();
					}
					
					else { 
						if (enemies[i].nomaxPos >= enemies[i].maxPos) {
							enemies[i].way *= -1;
							enemies[i].movement2 *= -1;
							enemies[i].nomaxPos = 0;
							enemies[i].nomaxPos += Math.abs(enemies[i].movement2);
							
							enemies[i].changeSoldiersArt();
						}
						
						enemies[i].nomaxPos += Math.abs(enemies[i].movement2);
						
						if (enemies[i].direction == true) enemies[i].x += enemies[i].movement2;
						else enemies[i].y += enemies[i].movement2;
					}
					
					if (enemies[i].direction == true) enemies[i].x += enemies[i].movement2;
					else enemies[i].y += enemies[i].movement2;
					
					//daño princesa		
					if (enemies[i].bounds.intersects(queen.bounds)) {
							if (booldamage) {
								booldamage = false;
								switch (queen.direction) {
								case 0:
									queen.x -= 15;
									break;
								case 1:
									queen.x += 15;
									break;
								case 2:
									queen.y += 15;
									break;
								case 3:	
									queen.y -= 15;
									break;
								}
								changeThought(4);
								thoughtscodevisual = thoughtscode;
								contthought = 0;
								
								enemies[i].enabledMov = false;
								queen.healthPoints -= enemies[i].damage;
								if (!Sounds.muteSounds) {
									Sounds.sndPrincessDamage.play();
								}
								
								if (queen.healthPoints <= 0) { princessDeath(); }
							}
						}
					}
					else enemies[i].changeSoldiersArt();
				
				if (contdamage >= 30) enemies[i].enabledMov = true;
				
				positionPoint = matrixposition(enemies[i]);
				enemies[i].positionX = positionPoint.x
				enemies[i].positionY = positionPoint.y;
				enemies[i].refreshLegend();
				
				if (contchain >= 20) {
					enemies[i].enabledMov = true;
				}
				
			}
		}
		
		private function BallMovement():void {
			if (ball.x >= 0 && ball.x <= multipler*6 - 20){
				ball.x += ball.move;
			}
			
			else {
				removeChild(ball);
				mage.enableMov = true;
				ballOnMove = false;
				ballOnMove = false;
			}
			
			if (ball.bounds.intersects(queen.bounds)) {
				removeChild(ball);
				mage.enableMov = true;
				ballOnMove = false;
				
				queen.healthPoints -= ball.damage;
				if (!Sounds.muteSounds) {
					Sounds.sndPrincessDamage.play();
				}
				
				if (queen.healthPoints <= 0) { princessDeath(); }
			}
		}
		
		private function enemiesCheckPossiblePos(t:TemplateMap, obj:Soldier):int{
			var supercoordenada: Point = new Point(0, 0);
			var subcoordenada:Point = new Point(0, 0);
			var supernumber:int;
			var subnumber:int;
			var m:int = 4;
			
			var x:int = 0;
			var y:int = 0;
			
			if (obj.direction == true) {
				x = obj.movement2 * m;
				
				supercoordenada.y = obj.y;
				subcoordenada.y = obj.y + obj.height;
				
				if (obj.way == 1) {
					supercoordenada.x = obj.x + obj.width + x;
				
					subcoordenada.x = obj.x + obj.width + x;
				}
				
				else {
					supercoordenada.x = obj.x + x;
				
					subcoordenada.x = obj.x + x;
				}	
			}
			
			else if (obj.direction == false ) {
				y = obj.movement2 * m;
				
				supercoordenada.x = obj.x;
				subcoordenada.x = obj.x + obj.width;
				
				if (obj.way == 1) {
					supercoordenada.y = obj.y + obj.height + y;
					
					subcoordenada.y = obj.y + obj.height + y;
				}
				
				else{
					supercoordenada.y = obj.y  + y;
					
					subcoordenada.y = obj.y + y;
				}
			}
			
			supercoordenada.x = ((supercoordenada.x - supercoordenada.x % multipler) / multipler)-1;
			supercoordenada.y = (supercoordenada.y - supercoordenada.y % multipler) / multipler;
			
			subcoordenada.x = ((subcoordenada.x - subcoordenada.x % multipler) / multipler)-1;
			subcoordenada.y = (subcoordenada.y - subcoordenada.y % multipler) / multipler;
			
			supernumber = t.matrix[supercoordenada.x][supercoordenada.y];
			subnumber = t.matrix[subcoordenada.x][subcoordenada.y];
			
			if (supernumber > subnumber) {return supernumber;}
			
			else { return subnumber;}
		}
		
		//ENTORNO
		
		private function changeMap():void {
			blood01.alpha = 0;
			blood02.alpha = 0;
			
			var enemy:Soldier;
			
			//actualiza el templatemap
			map.lvlmatrix[matrixX][matrixY] = map.matrix;
			
			var X:int = 0;
			var Y:int = 0;
			
			//ELIMINANDO LO INECESARIO:
			
			//Caso jefe final (1,2)
			if (matrixX == 1 && matrixY == 2) {
				if (! magedeath) {
					removeChild(ball);
					removeChild(mage);
					item.visible = false;
					removeChild (item);
					enabledBall = false;
				}
				else {
					removeChild(ball);
					removeChild(mage);
					item.visible = false;
					removeChild (item);
					enabledBall = false;
				}
			}
			
			//Caso consejero real (5,1)
			if (matrixX == 5 && matrixY == 1) {
				removeChild(royalAd);
			}
			
			//Caso soldado borracho (1,3)
			if (matrixX == 1 && matrixY == 3) {
				removeChild(drunkSol);
				removeChild(prisioner1);
			}
			
			//Caso de objetos
			if ((matrixX == 3 && matrixY == 5) || (matrixX==0 && matrixY==3)) {
				removeChild(item);
			}
			
			//Caso soldados
			while (enemies.length > 0) {
				enemy = enemies.pop();
				removeChild(enemy);
			}
			
			//ACTUALIZANDO EL MAPA
			if (queen.direction == 0 && queen.positionX == 6) {
				Y = 1;
				queen.x = multipler * 2 + 10;
			}
			else if (queen.direction == 1 && queen.positionX == 1) {
				Y = -1;
				queen.x = multipler * 7 - 10;
			}
			else if (queen.direction == 2 && queen.positionY == 1) {
				X = -1;
				queen.y = multipler * 6 - 10;
			}
			 else if (queen.direction == 3 && queen.positionY == 6) {
				X = 1;
				queen.y = multipler + 10;
			}
			
			if (matrixX == 1 && matrixY == 2 && magedeath && Y == -1) {
				if (queen.madnessPoints <= 20) Game.madness = 1;
				else if (queen.madnessPoints <= 35) Game.madness = 2;
				else Game.madness = 3;
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "complete1"}, true));
			}
			
			matrixX += X;
			matrixY += Y;
			
			
			//Cambio a la nueva matriz
			map.matrix = map.lvlmatrix[matrixX][matrixY];
			map.refreshLegend();
			
			//Generación de los objetos
			objectGenerator(map.matrix);
			
			//Pensamientos
			if (matrixX == 5 && matrixY == 3 && ! shitsoldiers) {
				shitsoldiers = true;
				changeThought(3);
				thoughtscodevisual = thoughtscode;
				contthought = 0;
			}
			if (matrixX == 3 && matrixY == 5 && ! seetorch) {
				seetorch = true;
				changeThought(6);
				thoughtscodevisual = thoughtscode;
				contthought = 0;
			}	
			if (matrixX == 1 && matrixY == 2 && ! magedeath) {
				this.addChild(mage);
			}
			
			changeArt();
		}
		
		private function changeArt():void 
		{
			if (map.matrix[0][2] == 6) {
				removeChild(backgroundArt0);
				backgroundArt0= new Image(Assets.getTexture("Casilla" + matrixX + (matrixY - 1)));
				backgroundArt0.x = backgroundArt.x - backgroundArt.width + multipler * 2;
				this.addChildAt(backgroundArt0, 0);
			}
			else backgroundArt0.visible = false;
			
			if (map.matrix[7][2] == 6) {
				removeChild(backgroundArt1);
				backgroundArt1= new Image(Assets.getTexture("Casilla" + matrixX + (matrixY + 1)));
				backgroundArt1.x = backgroundArt.x + backgroundArt.width - 2* multipler ;
				this.addChildAt(backgroundArt1, 0);
			}
			else backgroundArt1.visible = false;
			
			removeChild(backgroundArt);
			backgroundArt = new Image(Assets.getTexture("Casilla" + matrixX + matrixY));
			backgroundArt.x = 85;
			
			this.addChildAt(backgroundArt, 0);
			
			
			
			
			
		}
		
		private function refreshMap():void {
			for (var i:int = 0; i < map.matrix.length; i++) {
				for (var j:int = 0; j < map.matrix.length; j++) {
					if (map.matrix[i][j] != 0 && map.matrix[i][j] != 5 && map.matrix[i][j] != 6 && map.matrix[i][j] != 1 && map.matrix[i][j] !=2 ) {
						map.matrix[i][j] = 0;
					}
				}
			}
			for (var k:int = 0; k < enemies.length; k++) {
				if (enemies[k].alive == true) {
					if (map.matrix[enemies[k].positionX] [enemies[k].positionY] != 5 && map.matrix[enemies[k].positionX] [enemies[k].positionY] != 6 && map.matrix[enemies[k].positionX] [enemies[k].positionY] != 1 && map.matrix[enemies[k].positionX] [enemies[k].positionY] !=2) {
						map.matrix[enemies[k].positionX] [enemies[k].positionY] = 3;
					}
				}
			}
			
			if (map.matrix[queen.positionX] [queen.positionY] != 6 && map.matrix[queen.positionX] [queen.positionY]!=1 && map.matrix[queen.positionX] [queen.positionY]!=5 ) {
				map.matrix[queen.positionX] [queen.positionY] = 4;
			}
			
			positionPoint = matrixposition(queen);
			queen.positionX = positionPoint.x;
			queen.positionY = positionPoint.y;
			queen.refreshLegend();
			map.refreshLegend();
		}
		
		private function matrixposition(obj:Object):Point {
			var coordenada: Point = new Point(0, 0);
			coordenada.x = obj.x + obj.width/2;
			coordenada.y = obj.y + obj.height/2;
			
			coordenada.x = ((coordenada.x - coordenada.x % multipler) / multipler)-1;
			coordenada.y = (coordenada.y - coordenada.y % multipler) / multipler;
			
			return coordenada;
		}
		
		private function objectGenerator(matrix:Array):void {
			
			var soldier:Soldier;
			var dir:Boolean = true;
			
			for (var i:int = 0; i < matrix.length; i++) {
				for (var j:int = 0; j < matrix[i].length; j++) {
					//ITEMS
					if (matrix[i][j] == 1) {
						if (matrixX == 3 && matrixY == 5) {
							item = new Item(i, j, "torch");
							matrix[i][j] = 1;
							this.addChild(item);
							
							if (!Sounds.muteSounds) {
								Sounds.sndTorch.play();
							}
						}
						if (matrixX == 0 && matrixY == 3) {
							item = new Item(i, j, "meat");
							this.addChild(item);
						}
						if (matrixX == 1 && matrixY == 2) {
							item = new Item(i, j, "lever");
							this.addChild(item);
						}
					}
					
					//SOLDIERS
					if (matrix[i][j] == 3) {
						
						//Soldado más fuerte en la matriz (3,4)
						if (matrixX == 3 && matrixY == 4) {
							soldier = new Soldier(i, j, 12, multipler * 5, 3, false, 1, 3);
						}
						//Otros soldados
						else {
							soldier = new Soldier(i, j, 7, multipler, 2, dir, 1,2);
						}
						if (dir) {
							dir = false;
						}
						else {
							dir = true;
						}
						soldier.x = i * multipler+50;
						soldier.y = j * multipler;
						enemies.push(soldier);
						this.addChild(enemies[enemies.length - 1]);
					}
					
					//Mage
					if (matrix[i][j] == 7) {
						mage.visible = true;
						mage.x = multipler*2;
						mage.y = multipler;
						this.addChild(mage);
					}
					
					//NPCs
					if (matrix[i][j] == 2) {
						
						//RoyalAdvisor
						if (matrixX == 5 && matrixY == 1) {
							royalAd.visible = true;
							royalAd.x = royalAd.positionX * multipler+50;
							royalAd.y = royalAd.positionY * multipler;
							this.addChild(royalAd);
						}	
						
						//DrunkSoldier
						if (matrixX == 1 && matrixY == 3) {
							if (i==5 &&j==1){
								drunkSol.visible = true;
								drunkSol.x = drunkSol.positionX * multipler+50;
								drunkSol.y = drunkSol.positionY * multipler;
								this.addChild(drunkSol);
							}
							
							// Prisioner1
							if (i==4 && j==7) {
								prisioner1.visible = true;
								prisioner1.x = prisioner1.positionX * multipler+50;
								prisioner1.y = prisioner1.positionY * multipler;
								this.addChild(prisioner1);
							}
						}
					}				 
				}
			}
		}
	
		
	}
}