package {
	import com.arc.lumberjack.state.*;
	import org.flixel.*;
	
	[SWF(width = "360", height = "240", backgroundColor = "#ffffff")]
	[Frame(factoryClass = "Preloader")]
	
	public class Lumberjack extends FlxGame {
		public function Lumberjack() {
			forceDebugger = true;
			super(90, 60, Play, 4, 60, 60);
		}
	}
}