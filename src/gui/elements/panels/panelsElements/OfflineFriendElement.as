package gui.elements.panels.panelsElements {
import engine.Managers.FriendInviteManager;
import gui.elements.panels.PagePanelBase;

public class OfflineFriendElement extends OnlineFriendElement {

    public function OfflineFriendElement(parent:PagePanelBase) {
        super(parent);
    }

    protected override function onCheck(object:Object):void {
        if(!data[LOCAL_PARAMS]) {
            FriendInviteManager.Instance.postOnTheWall(data, onRequestSuccess, onRequestError);
        }
    }
}
}
