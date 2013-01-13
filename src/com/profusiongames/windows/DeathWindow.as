package com.profusiongames.windows 
{
	import com.profusiongames.events.WindowEvent;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class DeathWindow extends Window 
	{
		[Embed(source = "../../../../lib/Graphics/menus/death menu/menu.png")]private var _menu:Class;
		
		public function DeathWindow() 
		{
			background = new Image(Texture.fromBitmap(new _menu()));
			addChild(background);
			center();
			
			addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			if(e.getTouch(stage).phase == TouchPhase.ENDED)
				dispatchEvent(new WindowEvent(WindowEvent.NAVIGATION, "upgrade"));
				//dispatchEvent(new WindowEvent(WindowEvent.NAVIGATION, "play"));
		}
		
	}

}