package {
import flash.display.Sprite;
import starling.core.Starling;

import window.model.FriendInviteWindow;

[SWF(frameRate="60", width="898", height="649", backgroundColor="0x333333")]
public class Main extends Sprite
{
    private var myStarling:Starling;

    public function Main()
    {
        myStarling = new Starling(FriendInviteWindow, stage);
        myStarling.antiAliasing = 1;
        myStarling.start();
    }
}
}
