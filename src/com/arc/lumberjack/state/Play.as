package com.arc.lumberjack.state {
	import com.arc.lumberjack.entity.Player;

	import org.flixel.FlxState;

	public class Play extends FlxState {
		public var player:Player;

		override public function create():void {
			player = new Player(50, 50);
			this.add(player);
		}
	}
}
