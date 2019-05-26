package items 
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import int;
	import starling.events.Event;

	
	/**
	 * ...
	 * @author Group7
	 */
	public class Thoughts extends Sprite 
	{
		public var thoughts:Vector.<String>;
		private var thought:String;
		
		
		public function Thoughts() 
		{
			super();
			thoughts = new Vector.<String>;			
			thought = new String;
			fillthoughts();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);			
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function fillthoughts():void 
		{
			
			//0
			//thought = "e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e e";
			thought = "FINALLY FREE\nI SHOULD HAVE TAKEN THE SWORD";
			thoughts.push(thought);
			
			//1. Ve al consejero
			thought = "IT’S RODOLF, THE ROYAL ADVISOR"; 
			thoughts.push(thought);
			
			//2. El consejero habla sobre el fuego
			thought = "ALRIGHT, THEN I MUST FIND FIRE."; 
			thoughts.push(thought);
			
			//3. Se encuentra a los guardias
			thought = "SHIT, SOLDIERS"; 
			thoughts.push(thought);
			
			//4. Recibe daño
			thought = "AGHHH"; 
			thoughts.push(thought);
			
			//5.Si tiene muy poca vida y no se ha curado
			thought = "MY LIFE... I SHOULD HURRY."; 
			thoughts.push(thought);
			
			//6.Encuentra la antorcha
			thought = "THERE IS A FIRE."; 
			thoughts.push(thought);
			
			//7. Encuentra el borracho
			thought = "THEN, I CAN TAKE SOME MEAT TO DISTRACT DOGS."; 
			thoughts.push(thought);
			
			//8. Encuentra la carne
			thought = "YES, IT MIGHT WORK."; 
			thoughts.push(thought);
			
			//9. Frase al morir
			thought = "I… I’M DYING… UGH…"; 
			thoughts.push(thought);
			
			//10. Mientras no hace nada pero pierde sangre
			thought = "AGH… I’M BLEEDING OUT."; 
			thoughts.push(thought);
			
			//11. Mientras no hace nada pero pierde sangre
			thought = "IT… IT HURTS."; 
			thoughts.push(thought);
			
			//12. Mientras no hace nada pero pierde sangre
			thought = "THE WOUND… IT DOESN’T STOP BLEEDING."; 
			thoughts.push(thought);
			
			//13. Mientras no hace nada pero no pierde sangre (locura baja)
			thought = "AGGHH… MY HAND."; 
			thoughts.push(thought);
			
			//14. Mientras no hace nada pero no pierde sangre (locura baja)
			thought = "I WON’T BE ABLE TO PLAY THE VIOLIN ANYMORE."; 
			thoughts.push(thought);
			
			//15. Mientras no hace nada pero no pierde sangre (locura baja)
			thought = "WILL MY FATHER BE ALL RIGHT?"; 
			thoughts.push(thought);
			
			//16.Mientras no hace nada pero no pierde sangre (locura media)
			thought = "I FANCY A SALAD."; 
			thoughts.push(thought);			
			
			//17.Mientras no hace nada pero no pierde sangre (locura media)
			thought = "HOW LONG UNTIL THE EXIT???"; 
			thoughts.push(thought);
			
			//18. Mientras no hace nada pero no pierde sangre (locura media)
			thought = "WELL… AT LEAST I SAVE A HALF A SESSION OF MANICURE."; 
			thoughts.push(thought);
			
			//19. Mientras no hace nada pero no pierde sangre (locura media)
			thought = "I WILL REVENGE ON THE ONES WHO DID THIS TO ME."; 
			thoughts.push(thought);
			
			//20. Mientras no hace nada pero no pierde sangre (locura media)
			thought = "THIS FUCKING SHIT IS BURNING SO MUCH."; 
			thoughts.push(thought);
			
			//21. Mientras no hace nada pero no pierde sangre (locura media)
			thought = "IF LOSING A HAND IS NOT AESTHETIC, LOSING BOTH…"; 
			thoughts.push(thought);
			
			//22. Mientras no hace nada pero no pierde sangre (locura alta)
			thought = "MY NEXT CASTLE WILL BE BUILT WITH CORPSES."; 
			thoughts.push(thought);
			
			//23. Mientras no hace nada pero no pierde sangre (locura alta)
			thought = "“THIS FUCKING CASTLE’S FALLING DOWN, FALLING DOWN, FALLING DOWN… ♪”"; 
			thoughts.push(thought);
			
			//24. Mientras no hace nada pero no pierde sangre (locura alta)
			thought = "I’D LIKE TO LICK MY STUMP."; 
			thoughts.push(thought);
			
			//25. Cuando ataca a los guardias (locura baja)
			thought = "I MUST DO IT."; 
			thoughts.push(thought);
			
			//26. Cuando ataca a los guardias (locura media)
			thought = "I’M STARTING TO PREFER RED TO PURPLE."; 
			thoughts.push(thought);
			
			//27. Cuando ataca a los guardias (locura media)
			thought = "AN EYE FOR AN EYE…"; 
			thoughts.push(thought);
			
			//28. Cuando ataca a los guardias (locura alta)
			thought = "KILL! KILL! KILL!"; 
			thoughts.push(thought);
			
			//29. Cuando ataca a los guardias (asustados, locura baja)
			thought = "ENOUGH."; 
			thoughts.push(thought);
			
			//30. Cuando ataca a los guardias (asustados, locura baja)
			thought = "THEY DON’T DESERVE TO SUFFER MORE."; 
			thoughts.push(thought);
			
			//31. Cuando ataca a los guardias (asustados, locura baja)
			thought = "THEY ARE JUST WORKING."; 
			thoughts.push(thought);
			
			//32. Cuando ataca a los guardias (asustados, locura media)
			thought = "I’M STARTING TO PREFER RED TO PURPLE."; 
			thoughts.push(thought);
			
			//33. Cuando ataca a los guardias (asustados, locura media)
			thought = "SHOULD I STOP?"; 
			thoughts.push(thought);
			
			//34. Cuando ataca a los guardias (asustados, locura alta)
			thought = "KILL! KILL! KILL!"; 
			thoughts.push(thought);
			
			//35. Cuando ataca a los guardias (asustados, locura alta)
			thought = "I WILL PREPARE A SALAD WITH THEIR BRAINS."; 
			thoughts.push(thought);
			
			//36. Cuando ataca a los guardias (asustados, locura alta)
			thought = "THE GAME ENDS FOR YOU."; 
			thoughts.push(thought);
			
			//37. Cuando ataca a los guardias (asustados, locura extrema)
			thought = "I WILL TELL YOUR HUSBAND THAT YOU LOVED HER… THEN I WILL KILL HER!"; 
			thoughts.push(thought);
			
			//38. Cuando ataca a los guardias (asustados, locura extrema)
			thought = "SOON, YOUR CHILDREN WILL VISIT YOU."; 
			thoughts.push(thought);
			
			//39. Cuando ataca a los guardias (asustados, locura extrema)
			thought = "LET ME ADVISE YOU WHERE TO TRAVEL ON HOLIDAYS… GO TO HELL!"; 
			thoughts.push(thought);
			
			//40. Cuando se enfrenta al mago (locura baja)
			thought = "WHY CAN’T THEY CHOOSE A REGULAR JAILER?"; 
			thoughts.push(thought);
			
			//41. Cuando se enfrenta al mago (locura baja)
			thought = "I THOUGHT MAGIC WAS FORBIDDEN."; 
			thoughts.push(thought);
			
			//42. Cuando se enfrenta al mago (locura baja)
			thought = "IF I BEAT HIM, I WILL BE ABLE TO SAVE RODOLF."; 
			thoughts.push(thought);
			
			//43. Cuando se enfrenta al mago (locura baja)
			thought = "I MUST FIGHT FOR MY KINGDOM!"; 
			thoughts.push(thought);
			
			//44. Cuando se enfrenta al mago (locura baja) 
			thought = "IF ONE OF THOSE MAGIC BALLS HIT ME…"; 
			thoughts.push(thought);
			
			//45. Cuando se enfrenta al mago (locura media)
			thought = "OH! WHAT WILL HE DO? TURNING ME INTO A FROG?"; 
			thoughts.push(thought);
			
			//46. Cuando se enfrenta al mago (locura media)
			thought = "ANOTHER STRIKE!"; 
			thoughts.push(thought);
			
			//47. Cuando se enfrenta al mago (locura media)
			thought = "TIME TO BITE THE MAGIC DUST."; 
			thoughts.push(thought);
			
			//48. Cuando se enfrenta al mago (locura media)
			thought = "HE WILL BRING MY EYES OUT WITH ONE OF THOSE BALLS."; 
			thoughts.push(thought);
			
			//49. Cuando se enfrenta al mago (locura media)
			thought = "I WISH SOMEONE COULD LEND ME A HAND…"; 
			thoughts.push(thought);
			
			//50. Cuando se enfrenta al mago (locura alta)
			thought = "ATTACK HIM, MY ARMY OF PENGUINS!"; 
			thoughts.push(thought);
			
			//51. Cuando se enfrenta al mago (locura alta)
			thought = "I ALSO KNOW TO DO MAGIC, I WILL MAKE YOUR HEAD DISAPPEAR."; 
			thoughts.push(thought);
			
			//52. Cuando se enfrenta al mago (locura alta)
			thought = "YOUR NATAL CHART TELLS ME I WILL KICK YOUR ASS."; 
			thoughts.push(thought);
			
			//53. Cuando se enfrenta al mago (locura alta)
			thought = "“THIS FUCKING MAGE’S FALLING DOWN, FALLING DOWN, FALLING DOWN… ♪”"; 
			thoughts.push(thought);
			
			//54. Cuando se enfrenta al mago (locura alta)
			thought = "I FEEL LIKE TRYING YOUR BLOOD."; 
			thoughts.push(thought);
			
		}
		
	}

}