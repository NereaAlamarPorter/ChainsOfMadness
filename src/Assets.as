package 
{
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets 
	{
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		//
		//[Embed(source="../media/[ruta]")]
		//public static const [nombre]:Class;
		
		[Embed(source="../Media/Graphics/PrincessSpriteShit.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source = "../Media/Graphics/PrincessSpriteShit.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		//Pantallas principales
		
		[Embed(source = "../Media/Graphics/Screens/Credits.png")]
		public static const CreditsBg:Class;
		
		[Embed(source = "../Media/Graphics/Screens/Controls.png")]
		public static const ControlsBg:Class;
		
		[Embed(source = "../Media/Graphics/Screens/Main_Menu.png")]
		public static const Main_MenuBg:Class;
		
		[Embed(source = "../Media/Graphics/Screens/Botons.png")]
		public static const BotonsBt:Class;
		
		[Embed(source = "../Media/Graphics/Screens/Selected.png")]
		public static const SelectedBt:Class;
		
		[Embed(source = "../Media/Graphics/Screens/Death.png")]
		public static const DeathBg:Class;
		
		[Embed(source = "../Media/Graphics/Screens/Level_Completed.png")]
		public static const Complete1Bg:Class;
		
		//Nivel 1
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla51.png")]
		public static const Casilla51:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla52.png")]
		public static const Casilla52:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla53.png")]
		public static const Casilla53:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla43.png")]
		public static const Casilla43:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla33.png")]
		public static const Casilla33:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla34.png")]
		public static const Casilla34:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla35.png")]
		public static const Casilla35:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla25.png")]
		public static const Casilla25:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla15.png")]
		public static const Casilla15:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla14.png")]
		public static const Casilla14:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla13.png")]
		public static const Casilla13:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla03.png")]
		public static const Casilla03:Class;
		
		[Embed(source = "../Media/Graphics/Level1/nivel1/casillas/casilla12.png")]
		public static const Casilla12:Class;
		
		//INTRO
		
		[Embed(source = "../Media/Cutscenes/IntroImages/1.png")]
		public static const CTS_Intro_1:Class;
		
		[Embed(source = "../Media/Cutscenes/IntroImages/2.png")]
		public static const CTS_Intro_2:Class;
		
		[Embed(source = "../Media/Cutscenes/IntroImages/3.png")]
		public static const CTS_Intro_3:Class;
		
		[Embed(source = "../Media/Cutscenes/IntroImages/4.png")]
		public static const CTS_Intro_4:Class;
		
		[Embed(source = "../Media/Cutscenes/IntroImages/5.png")]
		public static const CTS_Intro_5:Class;
		
		[Embed(source = "../Media/Cutscenes/IntroImages/6.png")]
		public static const CTS_Intro_6:Class;
		
		[Embed(source = "../Media/Cutscenes/IntroImages/7.png")]
		public static const CTS_Intro_7:Class;
		
		[Embed(source = "../Media/Cutscenes/IntroImages/8.png")]
		public static const CTS_Intro_8:Class;
		
		[Embed(source = "../Media/Cutscenes/IntroImages/9.png")]
		public static const CTS_Intro_9:Class;
		
		[Embed(source = "../Media/Cutscenes/IntroImages/10.png")]
		public static const CTS_Intro_10:Class;
		
		//FINAL LM
		
		[Embed(source = "../Media/Cutscenes/FinalLowMadnessImages/1.png")]
		public static const CTS_Final_11:Class;
		
		[Embed(source = "../Media/Cutscenes/FinalLowMadnessImages/2.png")]
		public static const CTS_Final_12:Class;
		
		[Embed(source = "../Media/Cutscenes/FinalLowMadnessImages/3.png")]
		public static const CTS_Final_13:Class;
		
		
		//FINAL MM
		
		[Embed(source = "../Media/Cutscenes/FinalMediumMadnessImages/1.png")]
		public static const CTS_Final_21:Class;
		
		[Embed(source = "../Media/Cutscenes/FinalMediumMadnessImages/2.png")]
		public static const CTS_Final_22:Class;
		
		[Embed(source = "../Media/Cutscenes/FinalMediumMadnessImages/3.png")]
		public static const CTS_Final_23:Class;
		
		[Embed(source = "../Media/Cutscenes/FinalMediumMadnessImages/4.png")]
		public static const CTS_Final_24:Class;
		
		[Embed(source = "../Media/Cutscenes/FinalMediumMadnessImages/5.png")]
		public static const CTS_Final_25:Class;
		
		
		//FINAL HM
		
		[Embed(source = "../Media/Cutscenes/FInalHighMadnessImages/1.png")]
		public static const CTS_Final_31:Class;
		
		[Embed(source = "../Media/Cutscenes/FInalHighMadnessImages/2.png")]
		public static const CTS_Final_32:Class;
		
		[Embed(source = "../Media/Cutscenes/FInalHighMadnessImages/3.png")]
		public static const CTS_Final_33:Class;
		
		[Embed(source = "../Media/Cutscenes/FInalHighMadnessImages/4.png")]
		public static const CTS_Final_34:Class;
		
		[Embed(source = "../Media/Cutscenes/FInalHighMadnessImages/5.png")]
		public static const CTS_Final_35:Class;
		
		[Embed(source = "../Media/Cutscenes/FInalHighMadnessImages/6.png")]
		public static const CTS_Final_36:Class;
		
		[Embed(source = "../Media/Cutscenes/FInalHighMadnessImages/7.png")]
		public static const CTS_Final_37:Class;
		
		
		
		
		
		
		
		public static function getAtlas():TextureAtlas
		{
			if (gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}

		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
	}

}