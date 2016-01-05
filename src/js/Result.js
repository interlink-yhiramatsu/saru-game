saru.Result = function()
{

    var container = new saru_assets.ResultVisual();
    var _btReplay;
    var _currentScore = 0;


    container.visible = false;
    _btReplay = container["replay_bt"];
    _btReplay.buttonMode = true;
    _btReplay.addEventListener("click", _clickHandler);
    // _btReplay.addEventListener(MouseEvent.ROLL_OVER, _overHandler);
    // _btReplay.addEventListener(MouseEvent.ROLL_OUT, _outHandler);

    var _this = {
        container: container,
        showScore: showScore,
        start: start,
        end: end
    }

    function start()
    {
        container.visible = true;
    }

    function showScore(score)
    {
        _currentScore = score;

        //けた揃えして、MCを動かす
        if (_currentScore > 999) _currentScore = 999;
        var _scoreStr = ("00" + _currentScore).slice(-3);

        //trace(_scoreStr);
        container["suji_0"].gotoAndStop(Number(_scoreStr.charAt(0)) + 1);
        container["suji_1"].gotoAndStop(Number(_scoreStr.charAt(1)) + 1);
        container["suji_2"].gotoAndStop(Number(_scoreStr.charAt(2)) + 1);

        container.visible = true;

    }

    // function _overHandler(e)
    // {
    //     Tween24.tween(_btReplay, 0.2).bright(1.5).play();
    // }

    // function _outHandler(e)
    // {
    //     Tween24.tween(_btReplay, 0.1).bright(0).play();
    // }


    function _clickHandler(e)
    {
        container.dispatchEvent(new Event(saru.Const.RESULT_REPLAY)); //イベントを発信
    }

    function end()
    {
        container.visible = false;
    }
    return _this;
}
