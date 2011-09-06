package com.arc.lumberjack.entity {
	import com.arc.lumberjack.Registry.Resource;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;

	public class Player extends FlxSprite {
		public function Player(x:Number, y:Number) {
			super(x, y);
			loadGraphic(Resource.PLAYER, true, true, 4, 4);
		}
		
		override public function update():void {
			if (FlxG.keys.pressed("D")) {
				velocity.x = 50;
			} else if (FlxG.keys.pressed("A")) {
				velocity.x = -50;
			} else {
				velocity.x = 0;
			}
		}
	}
}
