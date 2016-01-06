saru.Enemy = function(traceTarget)
{


    var _speed = 10;
    var _terminalX;
    var _terminalY;
    var _enemyType;
    var _traceTarget;

    var gameItemStatus;
    var mc;


    _traceTarget = traceTarget;
    //createjsのコード
    mc = new saru_assets.HitsujiVisual();
    //createjsのコード
    gameItemStatus = saru.GameItemStatus(mc, 25);

    var _this = {
        mc: mc,
        gameItemStatus: gameItemStatus,
        step: step,
        getIsActive: getIsActive,
        getIsReady: getIsReady,
        activate: activate,
        hit: hit,
        sleep: sleep,
        outTest: outTest,
        circleHitTest: circleHitTest,
        spawn: spawn
    }



    function _step()
    {

        var _oldX = mc.x;
        var _oldY = mc.y;



        if (_enemyType == saru.Const.TYPE_DEF)
        {
            mc.x += _speed;

        }
        else if (_enemyType == saru.Const.TYPE_KAMIKAZE)
        {
            mc.x += (_terminalX - mc.x) / 15;
            mc.y += (_terminalY - mc.y) / 15;

            if (Math.abs(mc.x - _terminalX) < 10 && Math.abs(mc.y - _terminalY) < 10)
            {
                _terminalX = saru.Utils.getRandom(saru.Const.WIDTH);
                _terminalY = saru.Utils.getRandom(saru.Const.HEIGHT);
            }
            //回転
            mc.rotation = _getRot(mc.x - _oldX, mc.y - _oldY);

            if (mc.rotation > 90 && mc.rotation < 270)
            {
                mc.scaleY = -1;
            }
            else
            {
                mc.scaleY = 1;
            }


        }
        else if (_enemyType == saru.Const.TYPE_MISSILE)
        {
            mc.x += (_traceTarget.x - mc.x) / 30;
            mc.y += (_traceTarget.y - mc.y) / 30;
            //回転
            mc.rotation = _getRot(mc.x - _oldX, mc.y - _oldY);


        }
        else if (_enemyType == saru.Const.TYPE_SHOURYU)
        {
            mc.x += 5;
            mc.y += -5;

            //回転
            mc.rotation = _getRot(mc.x - _oldX, mc.y - _oldY);

        }
        else if (_enemyType == saru.Const.TYPE_FUWAFUWA_X)
        {
            mc.x += (_traceTarget.x - mc.x) / (saru.Utils.getRandom(20) + 20);
            mc.y += (_terminalY - mc.y) / 30;
            //回転
            mc.rotation = _getRot(mc.x - _oldX, mc.y - _oldY);

            if (mc.rotation > 90 && mc.rotation < 270)
            {
                mc.scaleY = -1;
            }
            else
            {
                mc.scaleY = 1;
            }

        }
        else if (_enemyType == saru.Const.TYPE_FUWAFUWA_Y)
        {
            mc.x += (_terminalX - mc.x) / 30;
            mc.y += (_traceTarget.y - mc.y) / (saru.Utils.getRandom(20) + 20);

            //回転
            mc.rotation = _getRot(mc.x - _oldX, mc.y - _oldY);

            if (mc.rotation > 90 && mc.rotation < 270)
            {
                mc.scaleY = -1;
            }
            else
            {
                mc.scaleY = 1;
            }

        }
        else
        {

        }


    }


    function _getRot(diffX, diffY)
    {
        return ((Math.atan2(diffY, diffX)) * 180 / Math.PI) % 360;
    }


    function spawn(myX, myY, type, terminalX, terminalY)
    {


        activate(myX, myY);
        _enemyType = type;
        _terminalX = terminalX;
        _terminalY = terminalY;

    }




    /*===========================================*/
    //ここからは共通
    /*===========================================*/


    function activate(myX, myY, type)
    {
        gameItemStatus.activate(myX, myY, type);
    }


    function sleep()
    {
        gameItemStatus.sleep();
    }


    function getIsActive()
    {
        return gameItemStatus.getIsActive();
    }


    function getIsReady()
    {
        return gameItemStatus.getIsReady();
    }

    function hit()
    {
        gameItemStatus.hit();
    }


    function step()
    {
        if (gameItemStatus.getIsActive())
        {
            _step();
        }
    }


    function outTest(w, h)
    {
        return gameItemStatus.outTest(w, h);
    }


    function circleHitTest(targetStatuss)
    {
        return gameItemStatus.circleHitTest(targetStatus);
    }

    /*===========================================*/
    //ここまでは共通
    /*===========================================*/

    //このthisをインスタンス風に使えるよ
    return _this;
}
