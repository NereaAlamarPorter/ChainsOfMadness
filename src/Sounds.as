package 
{
	import flash.media.Sound;
	
	public class Sounds 
	{
		
		//Embedded sound files. 
		
		/*[Embed(source="../Media/Sounds/--.mp3")]
		public static const SND_BG_GAME:Class;
		*/
		
		//Music
		[Embed(source="../Media/Sounds/InGame.mp3")]
		public static const SND_InGame:Class;
		
		[Embed(source="../Media/Sounds/Menus.mp3")]
		public static const SND_Menus:Class;
		
		
		//Sounds
		[Embed(source="../Media/Sounds/ChainAttack.mp3")]
		public static const SND_ChainAttack:Class;
		
		[Embed(source="../Media/Sounds/DeadEnemy.mp3")]
		public static const SND_EnemyDead:Class;
		
		[Embed(source="../Media/Sounds/ballmove.mp3")]
		public static const SND_BallMove:Class;
		
		[Embed(source="../Media/Sounds/chainwalk.mp3")]
		public static const SND_ChainWalk:Class;
		
		[Embed(source="../Media/Sounds/DrunkSolTalk.mp3")]
		public static const SND_DrunkSolTalk:Class;
		
		[Embed(source="../Media/Sounds/EnemyWalk.mp3")]
		public static const SND_EnemyWalk:Class;
		
		[Embed(source="../Media/Sounds/FallingDown.mp3")]
		public static const SND_FallingDown:Class;
		
		[Embed(source="../Media/Sounds/levelcomplete.mp3")]
		public static const SND_LevelComplete:Class;
		
		[Embed(source="../Media/Sounds/princessdamage.mp3")]
		public static const SND_PrincessDamage:Class;
		
		[Embed(source="../Media/Sounds/princessdeath.mp3")]
		public static const SND_PrincessDeath:Class;
		
		[Embed(source="../Media/Sounds/princesswalk.mp3")]
		public static const SND_PrincessWalk:Class;
		
		[Embed(source="../Media/Sounds/Prisioner1Talk.mp3")]
		public static const SND_Prisioner1Talk:Class;
		
		[Embed(source="../Media/Sounds/RoyalAdTalk.mp3")]
		public static const SND_RoyalAdTalk:Class;
		
		[Embed(source="../Media/Sounds/Stonecutters.mp3")]
		public static const SND_Stonecutters:Class;
		
		[Embed(source="../Media/Sounds/takeitem.mp3")]
		public static const SND_ItemTake:Class;
		
		[Embed(source="../Media/Sounds/torch.mp3")]
		public static const SND_Torch:Class;
		
		
		//INTRO
		
		[Embed(source = "../Media/Cutscenes/IntroImages/Intro.mp3")]
		public static const CTS_Intro_Music:Class;
		
		//FINAL LM
		[Embed(source = "../Media/Cutscenes/FinalLowMadnessImages/FinalLowMadness.mp3")]
		public static const CTS_Final_Music1:Class;
		
		//FINAL MM
		[Embed(source = "../Media/Cutscenes/FinalMediumMadnessImages/FInalMediumMadness.mp3")]
		public static const CTS_Final_Music2:Class;
		
		//FINAL HM
		[Embed(source = "../Media/Cutscenes/FInalHighMadnessImages/FinalHighMadness.mp3")]
		public static const CTS_Final_Music3:Class;
		
		
		
		
		
		//Initialized Sound objects
		
		public static var sndInGame:Sound = new Sounds.SND_InGame() as Sound;
		
		public static var sndMenus:Sound = new Sounds.SND_Menus() as Sound;
		
		public static var sndChainAttack:Sound = new Sounds.SND_ChainAttack() as Sound;
		
		public static var sndEnemyDead:Sound = new Sounds.SND_EnemyDead() as Sound;
		
		public static var sndBallMove:Sound = new Sounds.SND_BallMove() as Sound;
		
		public static var sndChainWalk:Sound = new Sounds.SND_ChainWalk() as Sound;
		
		public static var sndDrunkSolTalk:Sound = new Sounds.SND_DrunkSolTalk() as Sound;
		
		public static var sndEnemyWalk:Sound = new Sounds.SND_EnemyWalk() as Sound;
		
		public static var sndFallingDown:Sound = new Sounds.SND_FallingDown() as Sound;
		
		public static var sndLevelComplete:Sound = new Sounds.SND_LevelComplete() as Sound;
		
		public static var sndPrincessDamage:Sound = new Sounds.SND_PrincessDamage() as Sound;
		
		public static var sndPrincessDeath:Sound = new Sounds.SND_PrincessDeath() as Sound;
		
		public static var sndPrincessWalk:Sound = new Sounds.SND_PrincessWalk() as Sound;
		
		public static var sndPrisioner1Talk:Sound = new Sounds.SND_Prisioner1Talk() as Sound;
		
		public static var sndRoyalAdTalk:Sound = new Sounds.SND_RoyalAdTalk() as Sound;
		
		public static var sndStonecutters:Sound = new Sounds.SND_Stonecutters() as Sound;
		
		public static var sndItemTake:Sound = new Sounds.SND_ItemTake() as Sound;
		
		public static var sndTorch:Sound = new Sounds.SND_Torch() as Sound;
		
		public static var sndIntro_Music:Sound = new Sounds.CTS_Intro_Music() as Sound;
		
		public static var sndFinalMusic1:Sound = new Sounds.CTS_Final_Music1() as Sound;
		
		public static var sndFinalMusic2:Sound = new Sounds.CTS_Final_Music2() as Sound;
		
		public static var sndFinalMusic3:Sound = new Sounds.CTS_Final_Music3() as Sound;
		
		
		//Sound mute status.
		
		public static var muteMusic:Boolean = false;
		public static var muteSounds:Boolean = false;
		
		//public static var muteMusic:Boolean = true;
		//public static var muteSounds:Boolean = true;

		
	}

}