class Bonus
{
    float xposBonus, yposBonus;
    float horiBonus, vertiBonus;

    Bonus()
    {
        horiBonus = 10;
        vertiBonus = 20;
        xposBonus = random(0, 800 - horiBonus);
        yposBonus = random(platformY - (4*platformDistance) + platformL + 10, platformY - (2*platformDistance) - 10);
    }

    void display()
    {
        fill(#FFFFFF);
        ellipse(xposBonus + horiBonus/2, yposBonus + vertiBonus/2, horiBonus, vertiBonus);
        image(hourGlass, xposBonus, yposBonus, horiBonus, vertiBonus);
    }

    void update()
    {
        if ((yposBonus + vertiBonus <= position1.y + char1Y) && (yposBonus >= position1.y))
        {
            if ((position1.x + char1X > xposBonus) && (position1.x < xposBonus + horiBonus))
            {
                time.countUp(10);
                xposBonus = 1000;
                yposBonus = 1000;
            }
        }

        if ((yposBonus + vertiBonus <= position2.y + char2Y) && (yposBonus >= position2.y))
        {
            if ((position2.x + char2X > xposBonus) && (position2.x < xposBonus + horiBonus))
            {
                time.countUp(10);
                xposBonus = 1000;
                yposBonus = 1000;
            }
        }
    }
}
