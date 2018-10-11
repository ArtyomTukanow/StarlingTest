package gui.windows {
import engine.Managers.FriendInviteManager;
import gui.assets.AssetManager;
import gui.elements.covers.CoverBase;
import gui.elements.panels.FriendPanel;
import gui.elements.tabs.FriendInviteTab;
import starling.events.Event;
import gui.windows.base.WindowBase;
import gui.elements.buttons.CloseButton;
import gui.elements.buttons.GreenButton;

public class FriendInviteWindow extends WindowBase{

    private var _sendToAllBtn:GreenButton;
    private var _closeBtn:CloseButton;
    private var _cover:CoverBase;
    private var _friendInviteTab:FriendInviteTab;
    private var _offlineFriendsPanel:FriendPanel;
    private var _onlineFriendsPanel:FriendPanel;



    protected override function buildWindow():void {

        _cover = new CoverBase("Выберите друзей");
        this.addChild(_cover);

        _sendToAllBtn = new GreenButton(260, 505, "Отправить", onSendToAllBtnClick);
        _cover.addChild(_sendToAllBtn);

        _friendInviteTab = new FriendInviteTab();

        _friendInviteTab.x = 55;
        _friendInviteTab.y = 185;
        _cover.addChild(_friendInviteTab);

        _offlineFriendsPanel = new FriendPanel(FriendInviteManager.Instance.getOfflineFriendsData());
        _offlineFriendsPanel.x = 60;
        _offlineFriendsPanel.y = 60;

        _onlineFriendsPanel = new FriendPanel(FriendInviteManager.Instance.getOnlineFriendsData());
        _onlineFriendsPanel.x = 60;
        _onlineFriendsPanel.y = 60;

        _friendInviteTab.getTab(0).addChild(_offlineFriendsPanel);
        _friendInviteTab.getTab(1).addChild(_onlineFriendsPanel);

        _closeBtn = new CloseButton(610, 45);
        _cover.addChild(_closeBtn);

    }

    private function onSendToAllBtnClick(event:Event) {
        trace("onSendToAllButtonClick");
    }
}
}
