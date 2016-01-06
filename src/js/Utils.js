saru.Utils = {}
saru.Utils.getRandom = function(val)
{
    return Math.floor(Math.random() * val);
}


saru.Utils.kukei = function(width, height, fillColor, senHaba, senColor)
{

    var shape = new createjs.Shape();
    var g = shape.graphics;

    //線あり
    if (senHaba > 0)
    {
        g.beginFill(senColor);
        g.drawRect(0, 0, width, height);
        g.beginFill(fillColor);
        g.drawRect(senHaba, senHaba, width - senHaba * 2, height - senHaba * 2);

    }else
    {
        g.beginFill(fillColor);
        g.drawRect(0, 0, width, height);
    }

    return shape;

}