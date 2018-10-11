package {
import flash.display.Sprite;

import net.TestApp;

import starling.core.Starling;
import gui.windows.FriendInviteWindow;

[SWF(frameRate="60", width="663", height="573", backgroundColor="0x333333")]
public class Main extends Sprite
{
    private var myStarling:Starling;

    public function Main()
    {
        myStarling = new Starling(FriendInviteWindow, stage);
        myStarling.antiAliasing = 1;
        myStarling.start();
        new net.TestApp();
    }
}
}
