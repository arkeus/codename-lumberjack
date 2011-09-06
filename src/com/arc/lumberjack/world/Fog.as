package com.arc.lumberjack.world {
	import com.arc.lumberjack.registry.Resource;
	
	import flash.display.BitmapData;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;

	public class Fog extends FlxSprite {
		private var _mask:BitmapData;
		private var _midpoint:FlxPoint;
		private var _offset:FlxPoint;
		
		public function Fog() {
			super(0, 0);
			makeGraphic(FlxG.width, FlxG.height, 0xff000000);
			_mask = new FlxSprite(0, 0, Resource.MASK).pixels;
			_offset = new FlxPoint(_mask.width / 2, _mask.height / 2);
		}
		
		public function clear(object:FlxObject):void {
			_midpoint = object.getMidpoint(_midpoint);
			var x:int = _midpoint.x - _offset.x;
			var y:int = _midpoint.y - _offset.y;
			for (var i:int = 0; i < _mask.width; i++) {
				for (var j:int = 0; j < _mask.height; j++) {
					var maskAlpha:uint = 0xff000000 * _mask.getPixel(i, j) / 0xffffff;
					var fogAlpha:uint = pixels.getPixel32(x + i, y + j) & 0xff000000;
					if (fogAlpha > maskAlpha) {
						pixels.setPixel32(x + i, y + j, maskAlpha);
						dirty = true
					}
				}
			}
			
		}
	}
}
