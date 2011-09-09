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
			
			// bind animations
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
		
		/**
		 * Update the physics of the player based on whether the player is in air or in water.
		 */
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
		
		/**
		 * Handle player input. This is very simple, just move left and right with A/D or Left/Right and
		 * jump with W or Space (but only when touching the ground).
		 */
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
		
		/**
		 * This tells the player he is in liquid. We set it to 3 frames, so once the player isn't touching
		 * liquid for 3 frames, he will go back to using air physics.
		 */
		public function liquid():void {
			_inLiquid = 3;
		}
		
		/**
		 * A helper variable that tells us whether we are in water. Having this is nice because if we change
		 * the way we handle being in water (perhaps we do something different than having a 3 frame counter,
		 * then we don't have to change all the code that checks that counter, we just need to change how we
		 * determine if we are swimming or not in this function.
		 */
		public function get swimming():Boolean {
			return _inLiquid > 0;
		}
	}
}
