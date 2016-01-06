saru.Main = function()
{
    var MAX_ENEMY = saru.Const.MAX_ENEMY;
    var MAX_HERO_TAMA = saru.Const.MAX_HERO_TAMA;

    //弾を撃つかどうか？

    var _isShot = false;

    //スコア系

    var _score = 0;

    //敵が出るタイマー

    var _enemyProduceTimer;

    //時間カウント
    var GAME_TIME = saru.Const.GAME_TIME;

    var _currentTime = GAME_TIME;


    //インスタンス系

    var _hero;

    var _timeBar;

    //敵の配列

    var _enemyList = [];
    //自分の弾丸の配列

    var _heroTamaList = [];

    var container;


    _init();



    var _this = {

        container: container,
        start: start,
        end: end,
        getScore: getScore
    }


    function _init()
    {
        //最初の一回だけでの処理を記載

        //インスタンスを先に生成
        container = new createjs.Container();
        container.visible = false;

        //自分
        _hero = saru.Hero();
        _hero.mc.addEventListener(saru.Const.HERO_HIT_ANIM_END, _onHeroHitAnimEnd);



        var _bg = new saru_assets.BG();
        container.addChild(_bg);

        for (var i = 0; i < MAX_ENEMY; i++)
        {
            var _currentEnemy = saru.Enemy(_hero.mc);

            container.addChild(_currentEnemy.mc);
            _enemyList.push(_currentEnemy);
        }


        for (var k = 0; k < MAX_HERO_TAMA; k++)
        {
            var _currentHeroTama = saru.HeroTama();
            container.addChild(_currentHeroTama.mc);
            _heroTamaList.push(_currentHeroTama);
        }

        //自分
        container.addChild(_hero.mc);


        //時間バー
        var _timeBarBase = saru.Utils.kukei(700, 6, "#006B52", 0);
        container.addChild(_timeBarBase);

        var _timeContainer = new createjs.Container();

        _timeBar = saru.Utils.kukei(700, 6, "#B9CC20", 0);

        container.addChild(_timeContainer);
        _timeContainer.addChild(_timeBar);

        _timeBarBase.y=444;
        _timeContainer.y=444;
    }

    /**
     * ゲーム開始
     */
    function start()
    {
        //===================================================//
        //最初にリセット
        //===================================================//

        //ショット
        _isShot = false;

        //スコア
        _score = 0;

        //タイマーをリスタート
        _enemyProduceTimer = setInterval(_timerHandler, saru.Const.ENEMY_PRODUCE_TIME);


        // _enemyProduceTimer = new Timer(saru.Const.ENEMY_PRODUCE_TIME);
        // _enemyProduceTimer.addEventListener(TimerEvent.TIMER, _timerHandler);
        // _enemyProduceTimer.start();

        //時間制限
        _currentTime = GAME_TIME;
        _timeBar.scaleX = 1;

        //インスタンスの状態を初期化

        //			_hero.reset(saru.Const.WIDTH/2,saru.Const.HEIGHT/2);
        _hero.reset(0, saru.Const.HEIGHT / 2);

        for (var i = 0; i < MAX_ENEMY; i++)
        {
            var _currentEnemy = _enemyList[i];
            _currentEnemy.sleep();
        }
        for (var k = 0; k < MAX_HERO_TAMA; k++)
        {
            var _currentHeroTama = _heroTamaList[k];
            _currentHeroTama.sleep();
        }



        //イベント追加
        //container.addEventListener(Event.ENTER_FRAME, _step);
        createjs.Ticker.addEventListener("tick", _step);

        container.stage.addEventListener("stagemousedown", _mouseDownHandler);
        container.stage.addEventListener("stagemouseup", _mouseUpHandler);

        //この画面を表示
        container.visible = true;

    }


    function _mouseDownHandler(e)
    {

        _heroShot(_hero.mc.x, _hero.mc.y);
        _isShot = true;
    }


    function _mouseUpHandler(e)
    {
        _isShot = false;
    }




    function _heroShot(myX, myY)
    {
        for (var i = 0; i < MAX_HERO_TAMA; i++)
        {
            var _currentHeroTama = _heroTamaList[i];
            if (_currentHeroTama.getIsReady() == true)
            {

                if (saru.Utils.getRandom(2) == 0)
                {
                    _currentHeroTama.activate(myX, myY, 0);
                }
                else
                {
                    _currentHeroTama.activate(myX, myY, 1);
                }

                break;
            }

        }
    }



    function _produceEnemy()
    {
        for (var i = 0; i < MAX_ENEMY; i++)
        {
            var _currentEnemy = _enemyList[i];
            if (_currentEnemy.getIsReady() == true)
            {

                var ran = saru.Utils.getRandom(6);


                if (ran == 0)
                {

                    _currentEnemy.spawn(-10, saru.Utils.getRandom(saru.Const.HEIGHT), saru.Const.TYPE_DEF);

                }
                else if (ran == 1)
                {
                    _currentEnemy.spawn(saru.Const.WIDTH + 10, saru.Utils.getRandom(saru.Const.HEIGHT), saru.Const.TYPE_KAMIKAZE, _hero.mc.x, _hero.mc.y);


                }
                else if (ran == 2)
                {
                    _currentEnemy.spawn(-10, saru.Utils.getRandom(saru.Const.HEIGHT), saru.Const.TYPE_MISSILE);


                }
                else if (ran == 3)
                {
                    _currentEnemy.spawn(saru.Utils.getRandom(saru.Const.WIDTH), saru.Const.HEIGHT + 10, saru.Const.TYPE_SHOURYU);

                }
                else if (ran == 4)
                {
                    _currentEnemy.spawn(saru.Utils.getRandom(saru.Const.WIDTH), -10, saru.Const.TYPE_FUWAFUWA_X, _hero.mc.x, _hero.mc.y);

                }
                else if (ran == 5)
                {
                    _currentEnemy.spawn(saru.Const.WIDTH + 10, saru.Utils.getRandom(saru.Const.HEIGHT), saru.Const.TYPE_FUWAFUWA_X, _hero.mc.x, _hero.mc.y);

                }

                break;
            }
        }
    }




    function _timerHandler(e)
    {


        //後半は増える
        if (_currentTime > GAME_TIME * 0.8)
        {

            _produceEnemy();

        }
        else　 if (_currentTime > GAME_TIME * 0.6)
        {

            _produceEnemy();
            _produceEnemy();

        }
        else　 if (_currentTime > GAME_TIME * 0.4)
        {

            _produceEnemy();
            _produceEnemy();
            _produceEnemy();
        }
        else　 if (_currentTime > GAME_TIME * 0.2)
        {

            _produceEnemy();
            _produceEnemy();
            _produceEnemy();
            _produceEnemy();
        }
        else
        {

            _produceEnemy();
            _produceEnemy();
            _produceEnemy();
            _produceEnemy();
            _produceEnemy();
        }

    }



    function _step(e)
    {

        //打ちっ放し判定
        if (_isShot == true && (_currentTime % 3 == 0))
        {
            _heroShot(_hero.mc.x, _hero.mc.y);
        }


        //時間制限
        _currentTime--;

        if (_currentTime <= 0)
        {
            //trace("タイムアップ");
            _onTimeupEnd();
        }
        else
        {
            _timeBar.scaleX = (_currentTime / GAME_TIME);
        }

        /*最初にまとめて移動*/

        //自分の移動
        _hero.step();
        //自分の弾丸の移動
        _heroTamaList.forEach(__step);
        //羊の移動
        _enemyList.forEach(__step);

        /*まとめて画面外判定*/

        //弾丸の画面外判定
        _heroTamaList.forEach(__outTest);
        //敵の画面外判定
        _enemyList.forEach(__outTest);


        /*衝突判定*/

        //敵と自分の弾丸の判定&敵と自分の衝突判定

        var _currentEnemy;
        var _currentHeroTama;

        for (var i = 0; i < MAX_ENEMY; i++)
        {
            _currentEnemy = _enemyList[i];


            if (_currentEnemy.getIsActive() == true && _hero.circleHitTest(_currentEnemy.gameItemStatus))
            {
                //trace("自分にあたった");

                if (!saru.Const.DEBUG) _onLoseEnd();

            }

            for (var j = 0; j < MAX_HERO_TAMA; j++)
            {
                _currentHeroTama = _heroTamaList[j];

                //敵と弾丸の衝突判定

                if (_currentHeroTama.circleHitTest(_currentEnemy.gameItemStatus))
                {

                    if (_currentEnemy.getIsActive() == true && _currentHeroTama.getIsActive() == true)
                    {
                        //trace("敵に自分の弾丸があたった");
                        _score++;

                        _currentEnemy.hit();
                        _currentHeroTama.hit();
                    }
                }
            }
        }




    }



    function __step(item, index, array)
    {

        item.step();
    }


    function __outTest(item, index, array)
    {
        if (item.outTest(saru.Const.WIDTH, saru.Const.HEIGHT))
        {
            item.sleep();
        }
    }


    function _onTimeupEnd()
    {
        _onEnd();
        container.dispatchEvent(new Event(saru.Const.MAIN_END));
    }

    function _onLoseEnd()
    {
        _hero.hit();
        _onEnd();
    }


    /*終了の件は、演出に合わせて　要リファクタリング*/

    function _onEnd()
    {
        //タイマーをストップ
        // _enemyProduceTimer.stop();
        // _enemyProduceTimer.removeEventListener(TimerEvent.TIMER, _timerHandler);

        clearInterval(_enemyProduceTimer);

        //イベント削除
        //container.removeEventListener(Event.ENTER_FRAME, _step);

        createjs.Ticker.removeEventListener("tick", _step);


        container.stage.removeEventListener("stagemousedown", _mouseDownHandler);
        container.stage.removeEventListener("stagemouseup", _mouseUpHandler);


    }


    function _onHeroHitAnimEnd(e)
    {
        //終了を通知
        container.dispatchEvent(new Event(saru.Const.MAIN_END));
    }


    /**
     * ゲーム終了
     */
    function end()
    {

    }

    /**
     * スコアを返す
     */
    function getScore()
    {
        return _score;
    }


    return _this;

}
