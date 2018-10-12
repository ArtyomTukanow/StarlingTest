package gui.windows {
import gui.assets.AssetManager;
import gui.windows.base.WindowBase;

public class GameWindow extends WindowBase {

    public static var friendInviteWindow:FriendInviteWindow;

    protected override function buildWindow():void {
        AssetManager.Instance.standardAssets.load();
        friendInviteWindow = new FriendInviteWindow();
        this.addChild(friendInviteWindow);
    }
}
}
