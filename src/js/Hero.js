saru.Hero = function()
{
    var TICK = 4;

    //Canvas特有
    var gameItemStatus;
    var mc;


    mc = new saru_assets.HeroVisual();

    var _this = {
        getIsActive: getIsActive,
        getIsReady: getIsReady,
        activate: activate,
        hit: hit,
        sleep: sleep,
        outTest: outTest,
        circleHitTest: circleHitTest,
        reset: reset
    }

    gameItemStatus = saru.GameItemStatus(mc, 20);



    /*===========================================*/
    //ここから　　override
    /*===========================================*/

    function reset(myX, myY)
    {
        mc.gotoAndStop("ldef");
        activate(myX, myY);
    }


    function _step()
    {
        mc.x += (mc.parent.mouseX - mc.x) / TICK;
        mc.y += (mc.parent.mouseY - mc.y) / TICK;
    }

    /*===========================================*/
    //ここまで　　override
    /*===========================================*/


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

    function circleHitTest(targetStats)
    {
        return gameItemStatus.circleHitTest(targetStats);
    }

    /*===========================================*/
    //ここまでは共通
    /*===========================================*/

    //このthisをインスタンス風に使えるよ
    return _this;
}
