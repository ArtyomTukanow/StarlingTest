package gui.elements.panels {
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import gui.elements.checkboxes.Checkbox;
import gui.elements.panels.PagePanelBase;

import starling.display.Image;
import starling.events.Event;
import starling.text.TextField;

public class FriendElement extends ElementBase {

    private var friendBoard:Image;
    private var friendFrame:Image;
    private var friendName:TextField;
    private var friendAvatar:Image;
    private var checkbox:Checkbox;


    public function FriendElement(parent:PagePanelBase) {
        super (parent);
    }

    protected override function onAddedToStage(event:Event):void {
        friendBoard = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.FRIEND_BOARD));
        this.addChild(friendBoard);
        friendFrame = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.FRIEND_FRAME));
        this.addChild(friendFrame);
        friendName = new TextField(friendBoard.width, friendBoard.height, "NAME");
        this.addChild(friendName);
        checkbox = new Checkbox(155, 5, onCheck);
        this.addChild(checkbox);
    }

    private function onCheck(object:Object):void {
        var checked:Boolean = object.target.checked;
        trace(checked);
    }

    public override function update():void {

    }
}
}
