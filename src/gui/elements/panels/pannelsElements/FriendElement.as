package gui.elements.panels.pannelsElements {
import gui.elements.panels.*;

import engine.Managers.FriendInviteManager;
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import gui.elements.checkboxes.Checkbox;
import gui.elements.panels.pannelsElements.ElementBase;

import starling.display.Image;
import starling.events.Event;
import starling.text.TextField;
import starling.text.TextFormat;
import starling.textures.Texture;

public class FriendElement extends ElementBase {

    private const LOCAL_PARAMS:String = "__localParams";
    private var friendBoard:Image;
    private var friendBoardEmpty:Image;
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
        friendName = new TextField(friendBoard.width, friendBoard.height, "User", new TextFormat(StandardAssets.DEFAULT_FONT, 18, 0x553371));
        friendName.y -= 2;
        this.addChild(friendName);
        checkbox = new Checkbox(155, 5, onCheck);
        this.addChild(checkbox);
        friendAvatar = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.FRIEND_FRAME_EMPTY));
        friendAvatar.width -= 10;
        friendAvatar.height -= 10;
        friendAvatar.x += 5;
        friendAvatar.y += 5;
        friendAvatar.visible = false;
        this.addChild(friendAvatar);
        friendBoardEmpty = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.FRIEND_FRAME_EMPTY));
        this.addChild(friendBoardEmpty);
    }

    private function onCheck(object:Object):void {
        var checked:Boolean = object.target.checked;
        data[LOCAL_PARAMS] = checked;
    }

    public override function update():void {
        if (data) {
            friendName.text = data.name;
            friendAvatar.visible = false;
            FriendInviteManager.Instance.getAvatarTexture(data, onTextureLoaded);
            function onTextureLoaded(avatar:Texture):void {
                friendAvatar.texture = avatar;
                friendAvatar.visible = true;
            }
            checkbox.checked = data[LOCAL_PARAMS];
        }
    }
}
}
