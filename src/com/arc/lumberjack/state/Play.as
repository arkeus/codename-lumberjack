package com.arc.lumberjack.state {
	import com.arc.lumberjack.entity.Coin;
	import com.arc.lumberjack.entity.Player;
	import com.arc.lumberjack.registry.Resource;
	import com.arc.lumberjack.world.CoinMap;
	import com.arc.lumberjack.world.World;
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;

	/**
	 * This is our main game state, and works like any basic Flixel game state. We
	 * add the player, the tilemap, and objects to it, and we handle collisions
	 *  
	 * @author Arkeus
	 * 
	 */	
	public class Play extends FlxState {
		public var player:Player;
		public var world:World;
		public var coins:CoinMap;

		override public function create():void {
			FlxG.bgColor = 0xff1a9fdc;
			FlxG.mouse.show();
			
			// Create our background
			var background:FlxSprite = new FlxSprite(0, 0, Resource.BACKGROUND);
			background.scrollFactor = new FlxPoint(0, 0);
			
			// Add objects to the state
			this.add(background);
			this.add(world = new World);
			this.add(coins = new CoinMap);
			this.add(player = new Player(20, 24));
			
			// Setup camera and world bounds
			FlxG.camera.style = FlxCamera.STYLE_PLATFORMER;
			FlxG.camera.follow(player);
			FlxG.camera.setBounds(0, 0, world.width, world.height);
			FlxG.worldBounds.width = FlxG.width;
			FlxG.worldBounds.height = FlxG.height;
		}
		
		override public function update():void {
			// Adjust world bounds. This let's use only do collisions on the currently visible screen
			// rather than the entire level (though with a tiny game like this the performance gain
			// would not be noticeable).
			FlxG.worldBounds.y = FlxG.camera.scroll.y;
			FlxG.worldBounds.x = FlxG.camera.scroll.x;
			
			super.update();
			
			// This overlaps the player with the coins so he can collect them
			FlxG.overlap(player, coins, coinCallback);
			// This collides the player with the world so you don't fall through
			FlxG.collide(player, world);
		}
		
		/**
		 * This function is called whenever a player object touches a coin. For simplicity sake, we
		 * just destroy the coin, but typically we'd increment a coins counter here.
		 */
		private function coinCallback(a:FlxObject, b:FlxObject):void {
			var player:Player = a is Player ? a as Player : b as Player;
			var coin:Coin = a == player ? b as Coin : a as Coin;
			
			coin.kill();
		}
	}
}
