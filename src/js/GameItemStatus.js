saru.GameItemStatus = function(targetMC, radius)
{
    var _isActive = false;
    var _isReady = true;
    var _radius = 0;

    var mc;


    //Canvasのみ追記
    var _this = {
        getIsActive: getIsActive,
        getIsReady: getIsReady,
        getRadius: getRadius,
        activate: activate,
        hit: hit,
        sleep: sleep,
        outTest: outTest,
        circleHitTest: circleHitTest
    }

    mc = targetMC;
    _radius = radius;
    mc.addEventListener(saru.Const.VISUAL_HIT_ANIM_END, _onReset);


    function _onReset(e)
    {
        mc.gotoAndStop("ldef");
        sleep();
    }

    function getIsActive()
    {
        return _isActive;
    }

    function getIsReady()
    {
        return _isReady;
    }

    function getRadius()
    {
        return _radius;
    }



    function activate(myX, myY, type)
    {
        mc.x = myX;
        mc.y = myY;
        _isActive = true;
        _isReady = false;

    }

    function hit()
    {
        _isActive = false;
        _isReady = false;
        mc.gotoAndPlay("lhit");
    }


    function sleep()
    {
        mc.x = -500;
        mc.y = -500;
        _isActive = false;
        _isReady = true;
        mc.rotation = 0;
        mc.scaleX = 1;
        mc.scaleY = 1;
    }

    function outTest(w, h)
    {

        //はみ出ている場合はtrue
        var bool = false;
        if (mc.x < 0 - _radius || mc.x > w + _radius || mc.y < 0 - _radius || mc.y > h + _radius)
        {
            bool = true;
        }
        //実装
        return bool;
    }

    function circleHitTest(currentStatus)
    {

        var targetX = currentStatus.mc.x;
        var targetY = currentStatus.mc.y;
        var targetRadius = currentStatus._radius;


        //引数
        var _bool;
        var _val1 = (targetX - mc.x) * (targetX - mc.x) + (targetY - mc.y) * (targetY - mc.y);
        var _val2 = (targetRadius + _radius) * (targetRadius + _radius);


        if (_val1 <= _val2)
        {
            _bool = true;
        }
        else
        {
            _bool = false;
        }

        return _bool;

    }

    //このthisをインスタンス風に使えるよ
    return _this;

}
