package gui.windows {
import gui.assets.AssetManager;
import gui.windows.base.WindowBase;

public class GameWindow extends WindowBase {

    protected override function buildWindow():void {
        AssetManager.Instance.standardAssets.load();
        this.addChild(new FriendInviteWindow());
    }
}
}
