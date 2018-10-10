package gui.elements.panels {
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;

public class PagePanelBase extends Sprite {

    protected function get elementType():Class {return ElementBase;}
    protected var _elementsSprite:Vector.<ElementBase>;
    protected var _data:Vector.<Object>;
    protected var _nextBtn:Button;
    protected var _prefBtn:Button;

    protected var _lines:int = 0;
    protected var _columns:int = 0;
    protected var _linesInterval:int = 10;
    protected var _columnsInterval:int = 50;

    protected var currentPage:int = 0;
    protected function get countElementsOnPage():int {
        return _columns * _lines;
    }

    public function PagePanelBase(data:Vector.<Object>, lines:int, columns:int) {
        _data = data;
        _lines = lines;
        _columns = columns;

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);


    }


    protected function onAddedToStage(event:Event):void {
        _elementsSprite = new Vector.<ElementBase>(countElementsOnPage);
        _nextBtn = new Button(
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_ARROW_NORM),
                "",
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_ARROW_NORM),
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_ARROW_OVER));

        _prefBtn = new Button(
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_ARROW_NORM),
                "",
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_ARROW_NORM),
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_ARROW_OVER));

        this.addChild(_nextBtn);
        this.addChild(_prefBtn);

        _nextBtn.addEventListener(Event.TRIGGERED, onNextBtnClick);
        _prefBtn.addEventListener(Event.TRIGGERED, onPrefBtnClick);
    }

    private function onNextBtnClick(event:Event):void {
        nextPage();
    }

    private function onPrefBtnClick(event:Event):void {
        prefPage();
    }

    public function nextPage():void {
        if(canNextPage)
            currentPage ++;
        update();
    }

    public function prefPage():void {
        if(canPrefPage)
            currentPage --;
        update();
    }

    private function get canNextPage():Boolean {
        return (currentPage+1)*countElementsOnPage < _data.length;
    }

    private function get canPrefPage():Boolean {
        return currentPage > 0;
    }

    protected function create():void {
        var currIdInPage:int = 0;
        for (var i:int = 0; i < _columns; i ++) {
            for (var j:int = 0; j < _lines; j ++) {
                _elementsSprite[currIdInPage] = new elementType(this);
                _elementsSprite[currIdInPage].x = i*_columnsInterval;
                _elementsSprite[currIdInPage].y = j*_linesInterval;
                this.addChild(_elementsSprite[currIdInPage]);
                currIdInPage ++;
            }
        }
    }

    protected function update():void {
        var currId:int = currentPage*countElementsOnPage;
        var currIdInPage:int = 0;
        for (var i:int = 0; i < _columns; i ++) {
            for (var j:int = 0; j < _lines; j ++) {
                if(currId < _data.length) {
                    _elementsSprite[currIdInPage].data = _data[currId];
                    _elementsSprite[currIdInPage].visible = true;
                } else {
                    _elementsSprite[currIdInPage].visible = false;
                }
                currId ++;
                currIdInPage ++;
            }
        }

        _nextBtn.visible = canNextPage;
        _prefBtn.visible = canPrefPage;

    }
}
}
