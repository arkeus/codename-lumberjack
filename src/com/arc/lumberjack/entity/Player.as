package com.arc.lumberjack.entity {
	import com.arc.lumberjack.registry.Resource;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;

	public class Player extends FlxSprite {
		/** Basic physics constants */
		private static const AIR_ACC:int = 250;
		private static const LIQUID_ACC:int = 50;
		private static const AIR_DRAG:int = 300;
		private static const LIQUID_DRAG:int = 6000;
		private static const AIR_TERMINAL:int = 400;
		private static const LIQUID_TERMINAL:int = 20;
		
		/** A liquid timer, each time you touch a liquid slow down movement for 3 frames */
		private var _inLiquid:Number = 3;
		
		public function Player(x:Number, y:Number) {
			super(x, y);
			loadGraphic(Resource.PLAYER, true, true, 5, 5);;
			
			addAnimation("stand", [0], 0, false);
			addAnimation("walk", [1, 0], 4, true);
			play("stand");
			
			acceleration.y = AIR_ACC;
			facing = RIGHT;
		}
		
		override public function update():void {
			physics();
			input();
			super.update();
		}
		
		private function physics():void {
			if (swimming) {
				_inLiquid--;
				drag.x = LIQUID_DRAG;
				acceleration.y = LIQUID_ACC;
				maxVelocity.y = velocity.y > 0 ? LIQUID_TERMINAL : AIR_TERMINAL;
			} else {
				drag.x = AIR_DRAG;
				acceleration.y = AIR_ACC;
				maxVelocity.y = AIR_TERMINAL;
			}
		}
		
		private function input():void {
			if (FlxG.keys.D || FlxG.keys.RIGHT) {
				velocity.x = 40;
				facing = RIGHT;
				play("walk");
			} else if (FlxG.keys.A || FlxG.keys.LEFT) {
				velocity.x = -40;
				facing = LEFT;
				play("walk");
			} else {
				velocity.x = 0;
				play("stand");
			}
			
			if ((FlxG.keys.justPressed("W") || FlxG.keys.justPressed("SPACE")) && touching & DOWN) {
				velocity.y = swimming ? -50 : -100;
			}
		}
		
		public function liquid():void {
			_inLiquid = 3;
		}
		
		public function get swimming():Boolean {
			return _inLiquid > 0;
		}
	}
}
