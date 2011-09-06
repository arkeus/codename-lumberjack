package com.arc.lumberjack.utility {
	public class Util {
		/**
		 * Returns a random integer between min and max, inclusive.
		 * 
		 * @param min minimum number
		 * @param max maximum number
		 * @return random number 
		 * 
		 */
		public static function random(min:int, max:int):int {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}
		
		/**
		 * A quicker absolute value function than the build in flash one. 
		 * 
		 * @param n the number to find the absolute value of
		 * @return the absolute value
		 * 
		 */
		public static function abs(n:Number):Number {
			if (n < 0) n = -n;
			return n;
		}
		
		/**
		 * Clamps a number between a minimum and maximum, inclusive, ensuring that the number
		 * doesn't fall outside that range.
		 *  
		 * @param value the value to clamp
		 * @param min the minimum the value can be
		 * @param max the maximum the value can be
		 * @return the number clamped to the given range
		 * 
		 */
		public static function clamp(value:Number, min:Number, max:Number):Number {
			if (value > max) return max;
			if (value < min) return min;
			return value;
		}
	}
}