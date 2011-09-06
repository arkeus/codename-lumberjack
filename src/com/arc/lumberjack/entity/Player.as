package com.arc.lumberjack.entity {
	import com.arc.lumberjack.registry.Resource;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;

	public class Player extends FlxSprite {
		public function Player(x:Number, y:Number) {
			super(x, y);
			loadGraphic(Resource.PLAYER, true, true, 5, 5);;
			
			addAnimation("stand", [0], 0, false);
			addAnimation("walk", [1, 0], 4, true);
			play("stand");
			
			acceleration.y = 300;
		}
		
		override public function update():void {
			if (FlxG.keys.pressed("D")) {
				velocity.x = 40;
				facing = LEFT;
				play("walk");
			} else if (FlxG.keys.pressed("A")) {
				velocity.x = -40;
				facing = RIGHT;
				play("walk");
			} else {
				velocity.x = 0;
				play("stand");
			}
			
			if (FlxG.keys.justPressed("W") && touching & DOWN) {
				velocity.y = -100;
			}
			
			super.update();
		}
	}
}
