package window.model {
import starling.display.Button;
import starling.display.Image;
import starling.textures.Texture;

import window.assets.AssetManager;
import window.assets.FriendInviteAssets;
import window.model.base.WindowBase;

public class FriendInviteWindow extends WindowBase{

    private var _button:Button;
    private var _background:Image;

    private static function get assets():FriendInviteAssets {
        return AssetManager.Instance.friendInviteAssets;
    }


    protected override function buildWindow():void {
        _background = new Image(AssetManager.Instance.friendInviteAssets.getTexture(FriendInviteAssets.BACKGROUND));
        this.addChild(_background);


//        button = new Button(AssetManager.Instance.friendInviteAssets.getTexture(FriendInviteAssets.WIN_BTN_GREEN_NORM_STRING));
        var textureNorm:Texture = assets.getAtlasTexture(FriendInviteAssets.ATLAS, FriendInviteAssets.WIN_BTN_GREEN_NORM);
        var textureOver:Texture = assets.getAtlasTexture(FriendInviteAssets.ATLAS, FriendInviteAssets.WIN_BTN_GREEN_OVER);
        _button = new Button(textureNorm,"123",null, textureOver);
        this.addChild(_button);
        _button.x = 100;
        _button.y = 100;
    }
}
}
