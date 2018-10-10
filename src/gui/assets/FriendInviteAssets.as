package gui.assets {
import gui.assets.base.AssetBase;

public class FriendInviteAssets extends AssetBase {

    protected override function get currentClass():Class {
        return FriendInviteAssets;
    }

    [Embed(source="../../../media/assets/background.png")]
    public static const Background:Class;
    public static const BACKGROUND:String = "Background";

    [Embed(source="../../../media/assets/atlas.png")]
    public static const atlas:Class;
    [Embed(source="../../../media/assets/atlas.xml", mimeType="application/octet-stream")]
    public static const atlasXml:Class;
    public static const ATLAS:String = "atlas";
    public static const WIN_GIFT_MOUSE_B:String = "WIN_gift_mouseB";
    public static const WIN_GIFT_MOUSE_W:String = "WIN_gift_mouseW";
}
}
