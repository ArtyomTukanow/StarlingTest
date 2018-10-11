package gui.assets {
import gui.assets.base.AssetBase;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.textures.Texture;

public class StandardAssets extends AssetBase {


    private static var _instance:StandardAssets =  new StandardAssets();
    public static function get Instance():StandardAssets {return _instance;}

    public function StandardAssets() {
        if (_instance)
            throw new Error("Instance already created");
    }

    public function load():void {
        var texture:Texture = Texture.fromEmbeddedAsset(GreenFont);
        var xml:XML = XML(new GreenFontXml());
        var font:BitmapFont = new BitmapFont(texture, xml);
        TextField.registerCompositor(font, font.name);

        var texture2:Texture = Texture.fromEmbeddedAsset(TitleFont);
        var xml2:XML = XML(new TitleFontXml());
        var font2:BitmapFont = new BitmapFont(texture2, xml2);
        TextField.registerCompositor(font2, font2.name);
    }


    protected override function get currentClass():Class {
        return StandardAssets;
    }

    /****************************************************
     * --------------------FONTS------------------------*
     ****************************************************/

    [Embed(source="../../../media/fonts/MyriadPro-Bold.otf",fontFamily="DefaultFont",fontWeight="normal",fontStyle="normal",mimeType="application/x-font",embedAsCFF="false")]
    public static const DefaultFont:Class;
    public static const DEFAULTFONT:String = "DefaultFont";
    public static const DEFAULT_FONT:String = "DefaultFont";

    [Embed(source="../../../media/fonts/green_font.png")]
    public static const GreenFont:Class;
    public static const GREENFONT:String = "GreenFont";
    [Embed(source="../../../media/fonts/green_font.fnt", mimeType="application/octet-stream")]
    public static const GreenFontXml:Class;

    [Embed(source="../../../media/fonts/title_font.png")]
    public static const TitleFont:Class;
    public static const TITLEFONT:String = "TitleFont";
    [Embed(source="../../../media/fonts/title_font.fnt", mimeType="application/octet-stream")]
    public static const TitleFontXml:Class;



    /****************************************************
     * -------------------ATLASES-----------------------*
     ****************************************************/


    [Embed(source="../../../media/assets/atlas.png")]
    public static const atlas:Class;
    [Embed(source="../../../media/assets/atlas.xml", mimeType="application/octet-stream")]
    public static const atlasXml:Class;

    public static const ATLAS:String = "atlas";
    public static const BG_BIG_PURPLE:String = "bg_big_purple";
    public static const BG_BIG_PURPLE_BOARD_GIFT:String = "bg_big_purple_board_gift";
    public static const BG_BIG_PURPLE_TITLE:String = "bg_big_purple_title";
    public static const BTN_PURPLE_NORM_DIS:String = "btn_purple_norm_dis";
    public static const BTN_PURPLE_NORM_EN:String = "btn_purple_norm_en";
    public static const BTN_PURPLE_OVER_DIS:String = "btn_purple_over_dis";
    public static const BTN_PURPLE_OVER_EN:String = "btn_purple_over_en";
    public static const CHECKBOX_NORM:String = "checkbox_norm";
    public static const CHECKBOX_OVER:String = "checkbox_over";
    public static const CHECK:String = "check";
    public static const FRIEND_BOARD:String = "friend_board";
    public static const FRIEND_FRAME:String = "friend_frame";
    public static const FRIEND_FRAME_EMPTY:String = "friend_frame_empty";
    public static const WIN_BTN_ARROW_NORM:String = "WIN_btn_arrow_norm";
    public static const WIN_BTN_ARROW_OVER:String = "WIN_btn_arrow_over";
    public static const WIN_BTN_CLOSE_NORM:String = "WIN_btn_close_norm";
    public static const WIN_BTN_CLOSE_OVER:String = "WIN_btn_close_over";
    public static const WIN_BTN_GREEN_NORM:String = "WIN_btn_green_norm";
    public static const WIN_BTN_GREEN_OVER:String = "WIN_btn_green_over";
}
}
