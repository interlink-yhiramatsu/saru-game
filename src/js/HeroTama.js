saru.HeroTama = function()
{

    /*===========================================*/
    //ここから　　HeroTama特有
    /*===========================================*/
    var HERO_TAMA_SPEED = saru.Const.HERO_TAMA_SPEED;
    var TAMA_DIFF_A_X = 35;
    var TAMA_DIFF_A_Y = -11;
    var TAMA_DIFF_B_X = -8;
    var TAMA_DIFF_B_Y = 8;

    var _speedX = 0;
    var _speedY = 0;

    //Canvas特有
    var gameItemStatus;
    var mc;

    var _this = {
        getIsActive: getIsActive,
        getIsReady: getIsReady,
        activate: activate,
        hit: hit,
        sleep: sleep,
        outTest: outTest,
        circleHitTest: circleHitTest
    }


    /*===========================================*/
    //ここまで　　HeroTama特有
    /*===========================================*/


    mc = new saru_assets.TamaVisual();
    gameItemStatus = saru.GameItemStatus(mc, 5);




    /*===========================================*/
    //ここから　　override
    /*===========================================*/

    function activate(myX, myY, type)
    {
        if (type == 0)
        {
            gameItemStatus.activate(myX + TAMA_DIFF_A_X, myY + TAMA_DIFF_A_Y);
            _speedX = HERO_TAMA_SPEED;
        }
        else if (type == 1)
        {
            gameItemStatus.activate(myX + TAMA_DIFF_B_X, myY + TAMA_DIFF_B_Y);
            _speedX = -HERO_TAMA_SPEED;
        }
    }

    function _step()
    {
        mc.x += _speedX;
        mc.y += _speedY;
    }

    /*===========================================*/
    //ここまで　　override
    /*===========================================*/

    /*===========================================*/
    //ここからは共通
    /*===========================================*/

    //		 function activate(myX,myY,type=0) :void
    //		{
    //			gameItemStatus.activate(myX,myY,type);
    //		}

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

    function circleHitTest(targetStatus)
    {
        return gameItemStatus.circleHitTest(targetStatus);
    }

    /*===========================================*/
    //ここまでは共通
    /*===========================================*/

    //このthisをインスタンス風に使えるよ
    return _this;
}
