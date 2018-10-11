package gui.assets {

public class AssetManager {
    private static var _instance:AssetManager =  new AssetManager();
    public static function get Instance():AssetManager {return _instance;}

    public function AssetManager() {
        if(_instance)
            throw new Error("Instance already created");
    }

    public function get friendInviteAssets():FriendInviteAssets { return FriendInviteAssets.Instance; }
    public function get standardAssets():StandardAssets {return StandardAssets.Instance; }
    //other assets here..
}
}
