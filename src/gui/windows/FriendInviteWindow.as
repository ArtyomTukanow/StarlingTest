package gui.windows {
import gui.assets.FriendInviteAssets;
import gui.assets.FriendInviteAssets;
import gui.elements.checkboxes.Checkbox;
import gui.elements.covers.CoverBase;
import gui.elements.tabs.FriendInviteTab;

import starling.display.Image;
import starling.events.Event;
import gui.assets.AssetManager;
import gui.assets.FriendInviteAssets;
import gui.windows.base.WindowBase;
import gui.elements.buttons.CloseButton;
import gui.elements.buttons.GreenButton;

public class FriendInviteWindow extends WindowBase{

    private var _sendToAllBtn:GreenButton;
    private var _closeBtn:CloseButton;
    private var _cover:CoverBase;
    private var _friendInviteTab:FriendInviteTab;



    protected override function buildWindow():void {

        _cover = new CoverBase("Выберите друзей");
        this.addChild(_cover);

        _sendToAllBtn = new GreenButton(220, 505, "Отправить всем", onSendToAllBtnClick);
        _cover.addChild(_sendToAllBtn);

        _closeBtn = new CloseButton(610, 45);
        _cover.addChild(_closeBtn);

        var mouseW:Image = new Image(AssetManager.Instance.friendInviteAssets.getAtlasTexture(FriendInviteAssets.ATLAS, FriendInviteAssets.WIN_GIFT_MOUSE_W));
        var mouseB:Image = new Image(AssetManager.Instance.friendInviteAssets.getAtlasTexture(FriendInviteAssets.ATLAS, FriendInviteAssets.WIN_GIFT_MOUSE_B));
        mouseB.x = -20;
        mouseB.y = 345;
        mouseW.x = 465;
        mouseW.y = -15;
        _cover.addChild(mouseW);

        _friendInviteTab = new FriendInviteTab();

        _friendInviteTab.x = 55;
        _friendInviteTab.y = 185;
        _cover.addChild(_friendInviteTab);
        _cover.addChild(mouseB);
        _friendInviteTab.getTab(0).addChild(new Checkbox(100,100));
        _friendInviteTab.getTab(1).addChild(new Checkbox(200,100));
        _friendInviteTab.getTab(1).addChild(new Checkbox(300,100));
    }

    private function onSendToAllBtnClick(event:Event) {
        trace("onSendToAllButtonClick");
    }
}
}
