package gui.windows {
import engine.Managers.FriendInviteManager;
import gui.elements.covers.CoverBase;
import gui.elements.panels.FriendPanel;
import gui.elements.tabs.FriendInviteTab;
import starling.events.Event;
import gui.windows.base.WindowBase;
import gui.elements.buttons.CloseButton;
import gui.elements.buttons.GreenButton;

public class FriendInviteWindow extends WindowBase{

    private var _greenButton:GreenButton;
    private var _closeBtn:CloseButton;
    private var _cover:CoverBase;
    private var _friendInviteTab:FriendInviteTab;
    private var _offlineFriendsPanel:FriendPanel;
    private var _onlineFriendsPanel:FriendPanel;


    protected override function buildWindow():void {

        _cover = new CoverBase("Выберите друзей");
        this.addChild(_cover);

        _greenButton = new GreenButton(260, 505, "Закрыть", onCloseWindow);
        _cover.addChild(_greenButton);

        _friendInviteTab = new FriendInviteTab();

        _friendInviteTab.x = 55;
        _friendInviteTab.y = 185;
        _cover.addChild(_friendInviteTab);

        _offlineFriendsPanel = new FriendPanel(FriendInviteManager.Instance.offlineFriendsData, false);
        _offlineFriendsPanel.x = 60;
        _offlineFriendsPanel.y = 60;

        _onlineFriendsPanel = new FriendPanel(FriendInviteManager.Instance.onlineFriendsData, true);
        _onlineFriendsPanel.x = 60;
        _onlineFriendsPanel.y = 60;

        _friendInviteTab.getTab(0).addChild(_onlineFriendsPanel);
        _friendInviteTab.getTab(1).addChild(_offlineFriendsPanel);

        _closeBtn = new CloseButton(610, 45);
        _cover.addChild(_closeBtn);

        FriendInviteManager.Instance.getUsers(updateFriendPanels);
    }

    private function updateFriendPanels():void {
        _offlineFriendsPanel.update();
        _onlineFriendsPanel.update();
    }

    private function onCloseWindow(event:Event) {

    }
}
}
