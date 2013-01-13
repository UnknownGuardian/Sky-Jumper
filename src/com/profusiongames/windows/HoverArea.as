package com.profusiongames.windows 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.flashdevelop.utils.FlashConnect;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class HoverArea
	{
		private var _container:Sprite;
		private var _dx:int = 0;
		private var _dy:int = 0;
		private var _width:int = 0;
		private var _height:int = 0;
		private var _rect:Rectangle
		private var _isInside:Boolean = false;
		private var _onRollover:Function
		
		
		private var _debug:Boolean = true;
		public function HoverArea(container:Sprite, dx:int, dy:int, width:int, height:int, onRollover:Function ) 
		{
			_container = container;
			_dx = dx;
			_dy = dy;
			_width = width;
			_height = height;
			_rect = new Rectangle(_dx, _dy, _width, _height);
			_onRollover = onRollover;
			
			if (_debug)
			{
				var q:Quad = new Quad(_width, _height, uint(0xFFFFFF*Math.random()));
				q.x = _rect.x;
				q.y = _rect.y;
				q.touchable = false;
				q.alpha = 0.5;
				_container.stage.addChild(q);
			}
			
			_container.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(_container.stage);
			if (touch)
			{
				var pos:Point = touch.getLocation(_container.stage);
				if (_rect.containsPoint(pos))
				{
					isInside = true;
				}
				else
				{
					isInside = false;
				}
			}
		}
		
		private function get isInside():Boolean 
		{
			return _isInside;
		}
		
		private function set isInside(value:Boolean):void 
		{
			if (isInside == value) 
				return;
			
			if (value)
				_onRollover();
				
			
			
			_isInside = value;
		}
		
	}

}