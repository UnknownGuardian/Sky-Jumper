package com.profusiongames.windows 
{
	import com.profusiongames.beings.Player;
	import com.profusiongames.events.WindowEvent;
	import flash.text.TextFormat;
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class UpgradesWindow extends Window 
	{
		[Embed(source = "../../../../lib/Graphics/menus/upgrades menu/upgrades_menu.png")]private var _menu:Class;
		[Embed(source = "../../../../lib/Graphics/menus/upgrades menu/MenuButton.png")]private var _menuBtnBitmap:Class;
		[Embed(source="../../../../lib/Graphics/menus/upgrades menu/MenuButton.png")]private var _playBtnBitmap:Class;
		public static var greed:int = 0;//money value
		public static var lives:int = 0;//flatliner
		public static var doublejump:int = 0; //sugar boost
		public static var sideways:int = 0; //turning point
		public static var jump:int = 0;//jump higher
		public static var magnet:int = 0;//money magnet
		
		private var _greedPrice:Array = [25, 40, 90, 150, 200, "max"];
		private var _flatPrice:Array = [35, 55, 85, 125, 175, "max"];
		private var _sugarPrice:Array = [100, "max"];
		private var _turningPrice:Array = [15, 35, 55, 75, 95, "max"];
		private var _steroidsPrice:Array = [35, 60, 85, 110, 135, "max"];
		private var _magnetPrice:Array = [50, 70, 100, "max"];
		
		private var _greedHover:HoverArea;
		private var _flatLiner:HoverArea;
		private var _sugarBoost:HoverArea;
		private var _turningPoint:HoverArea;
		private var _steroids:HoverArea;
		private var _moneyMagnet:HoverArea;
		
		private var _greedUpgradeArea:UpgradeArea;
		private var _flatLinerUpgradeArea:UpgradeArea;
		private var _sugarBoostUpgradeArea:UpgradeArea;
		private var _turningPointUpgradeArea:UpgradeArea;
		private var _steroidsUpgradeArea:UpgradeArea;
		private var _moneyMagnetUpgradeArea:UpgradeArea;
		
		private var _totalCoinsText:TextField;
		private var _descriptionText:TextField;
		
		private var _menuBtn:Button;
		private var _playBtn:Button;
		public function UpgradesWindow() 
		{
			background = new Image(Texture.fromBitmap(new _menu()));
			addChild(background);
			center();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var sep:int = 42;
			var w:int = 112;
			_greedHover = new HoverArea(this, 95, 175 + sep*0, w, 40, onGreedHover);
			_flatLiner = new HoverArea(this, 95, 175 + sep*1, w, 40, onFlatLinerHover);
			_sugarBoost = new HoverArea(this, 95, 175 + sep*2, w, 40, onSugarBoostHover);
			_turningPoint = new HoverArea(this, 95, 175 + sep*3, w, 40, onTurningPointHover);
			_steroids = new HoverArea(this, 95, 175 + sep*4, w, 40, onSteroidsHover);
			_moneyMagnet = new HoverArea(this, 95, 175 + sep * 5, w, 40, onMoneyMagnetHover);
			
			sep = 42;
			_greedUpgradeArea = new UpgradeArea(142, 112 + sep * 0, _greedPrice, onGreedPurchase);
			_flatLinerUpgradeArea = new UpgradeArea(142, 112 + sep * 1, _flatPrice, onFlatLinerPurchase);
			_sugarBoostUpgradeArea = new UpgradeArea(142, 112 + sep * 2, _sugarPrice, onSugarBoostPurchase);
			_turningPointUpgradeArea = new UpgradeArea(142, 112 + sep * 3, _turningPrice, onTurningPointPurchase);
			_steroidsUpgradeArea = new UpgradeArea(142, 112 + sep * 4, _steroidsPrice, onSteroidsPurchase);
			_moneyMagnetUpgradeArea = new UpgradeArea(142, 112 + sep * 5, _magnetPrice, onMoneyMagnetPurchase);
			
			/*_greedUpgradeArea.ticks = 0;
			_flatLinerUpgradeArea.ticks = 5;
			_sugarBoostUpgradeArea.ticks = 5; 
			_turningPointUpgradeArea.ticks = 5;
			_steroidsUpgradeArea.ticks = 5;
			_moneyMagnetUpgradeArea.ticks = 5;*/
			
			addChild(_greedUpgradeArea);
			addChild(_flatLinerUpgradeArea);
			addChild(_sugarBoostUpgradeArea);
			addChild(_turningPointUpgradeArea);
			addChild(_steroidsUpgradeArea);
			addChild(_moneyMagnetUpgradeArea);
			
			_descriptionText = new TextField(300, 50, "Hey there", "Cartoonist", 24, 0xEEEEEE, true);
			_descriptionText.x = 25;
			_descriptionText.y = 360;
			_descriptionText.border = true;
			addChild(_descriptionText);
			
			_totalCoinsText = new TextField(58, 24, "" + Player.money, "Cartoonist", 24, 0xEEEEEE, true);
			_totalCoinsText.x = 158;
			_totalCoinsText.y = 63;
			_totalCoinsText.border = true;
			addChild(_totalCoinsText);
			
			_menuBtn = new Button(Texture.fromBitmap(new _menuBtnBitmap));
			_playBtn = new Button(Texture.fromBitmap(new _playBtnBitmap));
			_menuBtn.x = 50;
			_menuBtn.y = 430;
			_playBtn.x = 250;
			_playBtn.y = 430;
			addChild(_menuBtn);
			addChild(_playBtn);
			_menuBtn.addEventListener(Event.TRIGGERED, onMenuBtnPress);
			_playBtn.addEventListener(Event.TRIGGERED, onPlayBtnPress);
		}
		
		private function onMenuBtnPress(e:Event):void 
		{
			dispatchEvent(new WindowEvent(WindowEvent.NAVIGATION, "menu"));
		}
		
		private function onPlayBtnPress(e:Event):void 
		{
			dispatchEvent(new WindowEvent(WindowEvent.NAVIGATION, "play"));
		}
		
		private function onGreedPurchase():void 
		{
			_totalCoinsText.text = "" + Player.money;
			greed++;
		}
		
		private function onFlatLinerPurchase():void 
		{
			_totalCoinsText.text = "" + Player.money;
			lives++;
		}
		
		private function onSugarBoostPurchase():void 
		{
			_totalCoinsText.text = "" + Player.money;
			doublejump++;
		}
		
		private function onTurningPointPurchase():void 
		{
			_totalCoinsText.text = "" + Player.money;
			sideways++;
		}
		
		private function onSteroidsPurchase():void 
		{
			_totalCoinsText.text = "" + Player.money;
			jump++;
		}
		
		private function onMoneyMagnetPurchase():void 
		{
			_totalCoinsText.text = "" + Player.money;
			magnet++;
		}
		
		private function onGreedHover():void 
		{
			_descriptionText.text = "asd";
		}
		
		private function onFlatLinerHover():void 
		{
			_descriptionText.text = "dsaasd";
		}
		
		private function onSugarBoostHover():void 
		{
			_descriptionText.text = "fdsgdfg";
		}
		
		private function onTurningPointHover():void 
		{
			_descriptionText.text = "dfgdfgdf";
		}
		
		private function onSteroidsHover():void 
		{
			_descriptionText.text = "dfgdfg";
		}
		
		private function onMoneyMagnetHover():void 
		{
			_descriptionText.text = "I'm super greedy";
		}
		
		
		
	}

}