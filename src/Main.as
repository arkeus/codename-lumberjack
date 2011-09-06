package {
	import com.arc.lumberjack.state.*;
	import org.flixel.*;
	
	[SWF(width = "720", height = "480", backgroundColor = "#ffffff")]
	[Frame(factoryClass = "Preloader")]
	
	public class Main extends FlxGame {
		public function Main() {
			forceDebugger = true;
			super(360, 240, Play, 2, 60, 60);
		}
	}
}