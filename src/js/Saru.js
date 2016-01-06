saru.Saru = function()
{

    var _pre;
    var _main;
    var _result;
    var _maku;

    var _sceneStatus = 0;

    //Canvas特有
    var _stage;
    var _canvas;


    function init(stageName)
    {
        _canvas = document.getElementById(stageName);
        saru_images = saru_images ||
        {};
        ss = ss ||
        {};

        var loader = new createjs.LoadQueue(false);
        loader.addEventListener("fileload", handleFileLoad);
        loader.addEventListener("complete", handleComplete);
        loader.loadFile(
        {
            src: "src/images/saru_assets_atlas_.json",
            type: "spritesheet",
            id: "saru_assets_atlas_"
        }, true);
        loader.loadManifest(saru_assets.properties.manifest);
    }

    function handleFileLoad(evt)
    {
        if (evt.item.type == "image")
        {
            saru_images[evt.item.id] = evt.result;
        }
    }

    function handleComplete(evt)
    {
        var queue = evt.target;
        ss["saru_assets_atlas_"] = queue.getResult("saru_assets_atlas_");
        exportRoot = new saru_assets.saruAssets();

        _stage = new createjs.Stage(_canvas);


        createjs.Ticker.timingMode = createjs.Ticker.RAF_SYNC;
        createjs.Ticker.setFPS(30);



        _start();
    }


    function _start()
    {

        _pre = saru.Pre();
        _stage.addChild(_pre.container);
        _pre.container.addEventListener(saru.Const.PRE_START_BT_CLICK, _sceneChange);

        _main = saru.Main();
        _stage.addChild(_main.container);
        _main.container.addEventListener(saru.Const.MAIN_END, _sceneChange);

        _result = saru.Result();
        _stage.addChild(_result.container);
        _result.container.addEventListener(saru.Const.RESULT_REPLAY, _sceneChange);


        //演出用の幕
        _maku = new saru_assets.Maku();
        _stage.addChild(_maku);

        _maku.addEventListener(saru.Const.MAKU_CHANGE, _onMakuChangeHandler);


        createjs.Ticker.addEventListener("tick", _stage);


        _pre.start();
    }

    function _sceneChange(e)
    {
        _maku.gotoAndPlay("lplay");
    }

    function _onMakuChangeHandler(e)
    {
        if (_sceneStatus == 0)
        {
            _pre.end();
            _main.start();
            _sceneStatus = 1;
        }
        else if (_sceneStatus == 1)
        {
            _main.end();
            _result.start();
            _result.showScore(_main.getScore());
            _sceneStatus = 2;
        }
        else if (_sceneStatus == 2)
        {
            _main.start();
            _result.end();
            _sceneStatus = 1;
        }
    }


    return {
        init: init
    };

}
