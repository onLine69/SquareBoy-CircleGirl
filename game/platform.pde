class Platform
{

    Platform()
    {

        if (level == 1)
        {
            platformlowestX[0] = 0;
            platformlowestX[1] = 460;
            platformlowestW = 340;
            platformlowestL = 10;
            platformlowestY = lavaY - platformlowestL;

            platformY = platformlowestY;
            platformX[0] = 1000;
            platformW[0] = 0;

            platformX[1] = 300;
            platformW[1] = random(100,200);
            for (int i = 2; i < 6; i++)
            {
                platformW[i] = random(150,200);
                platformX[i] = random(0, 800 - platformW[i]);
            }
        }
        if (level != 1)
        {
            platformlowestX[0] = 1000;
            platformlowestX[1] = 1000;
            platformlowestW = 0;
            platformlowestY = 1000;

            platformY = lavaY - platformL;

            platformX[0] = 0;
            platformW[0] = 100;
            for (int i = 1; i < 6; i++)
            {
                platformW[i] = random(100,200);
                platformX[i] = random(0, 800 - platformW[i]);
            }
        }

        speed1 = platformSpeed;
        speed2 = platformSpeed;
        speed3 = platformSpeed;
        speed4 = platformSpeed;
    }

    void lava(float lavaX, float lavaY, float lavaW, float lavaL)
    {
        fill(#FF0A0A);
        rect(lavaX, lavaY, lavaW, lavaL);
    }

    void display()
    {
        platform.update();
        for (int i = 0; i < 6; i++)
        {
            fill(100, 0, 0, 0);
            rect(platformX[i], platformY - (i * platformDistance), platformW[i], platformL);
            image(platformTexture, platformX[i], platformY - (i * platformDistance), platformW[i], platformL);
        }
        for (int i = 0; i < 2; i++)
        {
            fill(100, 0, 0, 0);
            rect(platformlowestX[i], platformlowestY, platformlowestW, platformlowestL);
            image(platformLowestTexture, platformlowestX[i], platformlowestY, platformlowestW, platformlowestL);
        }
    }
    void update()
    {
        if ((platformX[1] + platformW[1] >= 800) || (platformX[1] < 0))
        {
            speed1 *= -1;
        }
        if ((platformX[2] + platformW[2] >= 800) || (platformX[2] < 0))
        {
            speed2 *=-1;
        }
        if ((platformX[3] + platformW[3] >= 800) || (platformX[3] < 0))
        {
            speed3 *=-1;
        }
        if ((platformX[4] + platformW[4] >= 800) || (platformX[4] < 0))
        {
            speed4 *=-1;
        }

        platformX[1] += speed1;
        platformX[2] += speed2;
        platformX[3] += speed3;
        platformX[4] += speed4;
    }
}
