package com.arc.lumberjack.state {
	import com.arc.lumberjack.entity.Player;
	import com.arc.lumberjack.world.Fog;
	import com.arc.lumberjack.world.World;
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;

	public class Play extends FlxState {
		public var player:Player;
		public var world:World;
		public var fog:Fog;

		override public function create():void {
			FlxG.bgColor = 0xff1a9fdc;
			FlxG.mouse.show();
			
			world = new World();
			this.add(world);
			
			player = new Player(50, 4);
			this.add(player);
			
			//fog = new Fog();
			//this.add(fog);
			
			//FlxG.worldBounds = new FlxRect(0, 0, FlxG.width+1000, FlxG.height+1000);
			FlxG.camera.style = FlxCamera.STYLE_PLATFORMER;
			FlxG.camera.follow(player);
			FlxG.worldBounds.width = FlxG.width;
			FlxG.worldBounds.height = FlxG.height;
		}
		
		override public function update():void {
			FlxG.worldBounds.y = FlxG.camera.scroll.y;
			FlxG.worldBounds.x = FlxG.camera.scroll.x;
			
			super.update();
			//fog.clear(player);
			FlxG.collide(player, world);
		}
	}
}
