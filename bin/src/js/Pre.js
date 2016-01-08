saru.Pre = function()
{

    var container = new saru_assets.PreVisual();
    var _btStart;


    _btStart = container["start_bt"];
    _btStart.buttonMode = true;
    _btStart.addEventListener("click", _clickHandler);

    var _this = {
        container: container,
        start: start,
        end: end
    }

    function _clickHandler(e)
    {
        container.dispatchEvent(new Event(saru.Const.PRE_START_BT_CLICK)); //イベントを発信
    }

    /**
     * 画面を表示する
     */
    function start()
    {
        container.visible = true;
    }

    /**
     * 画面を非表示する
     */
    function end()
    {
        container.visible = false;
    }

    return _this;
}
