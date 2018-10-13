package gui.elements.panels.panelsElements {
import engine.Net.VKConnector;

import feathers.controls.ImageLoader;
import gui.elements.panels.*;
import engine.Managers.FriendInviteManager;
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import gui.elements.checkboxes.Checkbox;
import starling.display.Image;
import starling.events.Event;
import starling.text.TextField;
import starling.text.TextFormat;

public class OnlineFriendElement extends ElementBase {

    protected const LOCAL_PARAMS:String = "__localParams";
    private var _friendBoard:Image;
    private var _friendBoardEmpty:Image;
    private var _friendFrame:Image;
    private var _friendName:TextField;
    private var _friendAvatar:ImageLoader;
    private var _checkbox:Checkbox;


    public function OnlineFriendElement(parent:PagePanelBase) {
        super (parent);
    }

    protected override function onAddedToStage(event:Event):void {
        _friendBoard = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.FRIEND_BOARD));
        this.addChild(_friendBoard);
        _friendFrame = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.FRIEND_FRAME));
        this.addChild(_friendFrame);
        _friendName = new TextField(_friendBoard.width, _friendBoard.height, "User", new TextFormat(StandardAssets.DEFAULT_FONT, 18, 0x553371));
        _friendName.y -= 2;
        this.addChild(_friendName);
        _checkbox = new Checkbox(155, 5, onCheck, false);
        this.addChild(_checkbox);
        _friendAvatar = new ImageLoader();//AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.FRIEND_FRAME_EMPTY));
        _friendAvatar.width = _friendFrame.width - 10;
        _friendAvatar.height = _friendFrame.height - 10;
        _friendAvatar.x += 5;
        _friendAvatar.y += 5;
//        _friendAvatar.visible = false;
        this.addChild(_friendAvatar);
        _friendBoardEmpty = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.FRIEND_FRAME_EMPTY));
        this.addChild(_friendBoardEmpty);
    }

    protected function onCheck(object:Object):void {
        if(!data[LOCAL_PARAMS]) {
            FriendInviteManager.Instance.sendRequest(data, onRequestSuccess, onRequestError);
        }
    }

    protected function onRequestSuccess(data:Object = null):void {
        _checkbox.checked = true;
        _data[LOCAL_PARAMS] = true;
    }

    protected function onRequestError(error:Object = null):void {
        if(error.error_code == 214) {
            VKConnector.Instance.alert("Этот пользователь запретил добавлять посты на стену.")
        }
        _checkbox.checked = false;
    }

    public override function update():void {
        if (data) {
            _friendName.text = data.first_name;
//            _friendAvatar.visible = false;
            _friendAvatar.source = data["photo_50"];
//            _friendAvatar.addEventListener( Event.COMPLETE, function (event:Event):void {
//                _friendAvatar.visible = true;
//            });
            _checkbox.checked = data[LOCAL_PARAMS];
        }
    }
}
}
