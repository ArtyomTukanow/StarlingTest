package engine.Utils {
import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;
import gui.assets.AssetManager;
import starling.textures.Texture;

public class NetLoader {

    public static function loadFromURL(url:String, onComplete:Function = null, onError:Function = null):void {
        var loader:Loader = new Loader();
        loader.load ( new URLRequest (url) );
        loader.contentLoaderInfo.addEventListener (flash.events.Event.COMPLETE, onComplete );
    }

    public static function loadTextureFromURL(url:String, onTextureLoaded:Function = null, onError:Function = null):void {
        var localTexture:Texture = AssetManager.Instance.standardAssets.getNetTexture(url);
        if(localTexture) {
            onTextureLoaded(localTexture);
            return;
        }

        loadFromURL(url, onComplete, onError);
        function onComplete(event:Event) {
            var texture:Texture = Texture.fromBitmap(event.currentTarget.loader.content as Bitmap);
            AssetManager.Instance.standardAssets.addNetTexture(url, texture);
            onTextureLoaded(texture);
        }
    }
}
}
