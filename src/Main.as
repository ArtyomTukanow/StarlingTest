package {
import flash.display.Sprite;
import gui.windows.GameWindow;
import starling.core.Starling;

[SWF(frameRate="60", width="663", height="573", backgroundColor="0x333333")]
public class Main extends Sprite
{
    private var myStarling:Starling;

    public function Main()
    {
        myStarling = new Starling(GameWindow, stage);
        myStarling.antiAliasing = 1;
        myStarling.start();
    }
}
}
