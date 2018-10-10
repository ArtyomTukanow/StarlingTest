package gui.assets {

public class AssetManager {
    private static var _instance:AssetManager =  new AssetManager();
    public static function get Instance():AssetManager {return _instance;}

    public function AssetManager() {
        if(_instance != null)
            throw new Error("Instance already created");
    }

    public var friendInviteAssets:FriendInviteAssets = new FriendInviteAssets();
    public var standardAssets:StandardAssets = new StandardAssets();
    //other assets here..
}
}
