package window.assets.base {
import flash.display.Bitmap;
import flash.utils.Dictionary;

import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class AssetBase {

    protected function get currentClass():Class {
        return AssetBase;
    }

    private var _gameTextures:Dictionary = new Dictionary();
    private var _gameTextureAtlases:Dictionary = new Dictionary();

    public function getTexture(name:String):Texture {
        if (_gameTextures[name] == undefined) {
            var bitmap:Bitmap = new currentClass[name]();
            _gameTextures[name] = Texture.fromBitmap(bitmap)
        }
        return _gameTextures[name];
    }

    public function getAtlasTexture(atlasName:String, textureName:String):Texture {
        return getAtlas(atlasName).getTexture(textureName);
    }

    public function getAtlas(atlasName:String):TextureAtlas {
        if (_gameTextureAtlases[atlasName] == undefined) {
            var texture:Texture = getTexture(atlasName);
            var xml:XML = XML(new currentClass[atlasName+"Xml"]);
            _gameTextureAtlases[atlasName] = new TextureAtlas(texture, xml);
        }
        return _gameTextureAtlases[atlasName];
    }
}
}
