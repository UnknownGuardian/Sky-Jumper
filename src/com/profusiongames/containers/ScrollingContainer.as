package com.profusiongames.containers 
{
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class ScrollingContainer extends Sprite 
	{
		
		public function ScrollingContainer() 
		{
			addChild(new Quad(100, 100, 0xFF00FF));
		}
		
		public function centerOn(s:Sprite):void
		{
			//x = -s.x + 500 / 2;
			y = -s.y + 600 / 2;
		}
		
	}

}