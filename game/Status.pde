public class Status extends PApplet
{

    public void settings()
    {
        size(300, 500);
    }
    public void draw()
    {

        if (difficulty || result)
        {
            background(backgroundStatus);
            textFont(title1Status, 35);
            fill(255);
            textAlign(CENTER);
            text("TIME:", 150, 100);

            textFont(title2Status, 35);
            fill(255);
            textAlign(CENTER);
            text("CURRENT LEVEL:", 150, 280);

            textFont(time_placementStatus, 20);
            fill(255);
            textAlign(CENTER);
            if (time.getTime()/60 < 10)
            {
                if(time.getTime() % 60 < 10)
                {
                    text("0" + (int)(time.getTime() / 60) + ":0" + (int)(time.getTime() % 60), 150, 160);
                }
                else
                {
                    text("0" + (int)(time.getTime() / 60) + ":" + (int)(time.getTime() % 60), 150, 160);
                }
            }
            else
            {
                text((int)(time.getTime() / 60) + ":" + (int)(time.getTime() % 60), 150, 160);
            }

            textFont(lvl_placementStatus, 20);
            fill(255);
            textAlign(CENTER);
            if (level > levelMax)
            {
                text(level-1 + "/" + levelMax, 150, 345);
            }
            else
            {
                text(level + "/" + levelMax, 150, 345);
            }
        }
        else
        {
            background(backgroundStatus);
            textFont(time_placementStatus, 40);
            fill(255);
            textAlign(CENTER);
            text("WELCOME", 150, 250);
        }


    }
}
