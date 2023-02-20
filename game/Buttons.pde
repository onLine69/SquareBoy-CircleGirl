class Buttons
{
    boolean pressedPlay = false;
    boolean pressedIns = false;
    boolean pressedEasy = false;
    boolean pressedModerate = false;
    boolean pressedDifficult = false;
    boolean pressedNext = false;
    boolean pressedBack = false;
    boolean pressedStart = false;
    boolean pressedIntro = false;
    boolean pressedPlayAgain = false;
    boolean pressedExit = false;
    boolean pressedYes = false;
    boolean pressedNo = false;
    boolean pressedMenu = false;
    
    color C = color(100,91,91);
    color I = color(0,0,0);
    color T = color(255,255,255);

    color ColorRP = I, ColorRI = I, ColorRE = I, ColorRM = I, ColorRD = I, ColorRN = I,
          ColorRB = I, ColorRS = I, ColorRIn = I, ColorRPA = I, ColorREx = I, ColorRY = I, ColorRNo = I, ColorRMe = I;
    color ColorP = T, ColorI = T, ColorE = T, ColorM = T, ColorD = T, ColorN = T,
          ColorB = T, ColorS = T, ColorIn = T, ColorPA = T, ColorEx = T, ColorY = T, ColorNo = T, ColorMe = T;

    float r = 24;

    void displayPlay(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorP = T;
            if (mousePressed == true && mouseButton == LEFT && pressedPlay == false)
            {
                start = true;
                intro = false;
                ins = false;
                window = false;
                pressedPlay = true;
                exit = false;
            }
        }
        else
        {
            ColorRP = color(100,0,0,0);
            ColorP = I;
            pressedPlay = false;
        }

        noStroke();
        fill(ColorRP);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorP);
        textFont(title2Title);
        textAlign(CENTER, CENTER);
        textSize(size);
        text(s, x + (w/2), y + (h/2));
    }

    void displayIns(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorI = T;
            if (mousePressed == true && mouseButton == LEFT && pressedIns == false)
            {
                pressedIns = true;
                intro = false;
                ins = true;
                insCount = 1;
                start = false;
                difficulty = false;
                result = false;
                exit = false;
            }
        }
        else
        {
            ColorRI = color(100,0,0,0);
            ColorI = I;
            pressedIns = false;
        }

        noStroke();
        fill(ColorRI);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorI);
        textFont(title2Title);
        textAlign(CENTER, CENTER);
        textSize(size);
        text(s, x + (w/2), y + (h/2));
    }

    void displayEasy(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRE = C;
            if (mousePressed == true && mouseButton == LEFT && pressedEasy == false)
            {
                ColorE = color(255, 255, 255);
                pressedEasy = true;
                intro = false;
                start = true;
                ins = false;
                result = false;
                exit = false;
                difficulty = true;
                levelMax = 3;
                maxTime = 180;

                time.setTime(maxTime);
            }
        }
        else
        {
            ColorRE = I;
            pressedEasy = false;
        }

        noStroke();
        fill(ColorRE);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorE);
        textAlign(CENTER, TOP);
        textFont(easy_dDifficulty, size);
        text(s, x + (w/2), y);
    }

    void displayModerate(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRM = C;
            if (mousePressed == true && mouseButton == LEFT && pressedModerate == false)
            {
                ColorM = color(255, 255, 255);
                pressedModerate = true;
                intro = false;
                start = true;
                ins = false;
                result = false;
                exit = false;
                difficulty = true;

                levelMax = 5;
                maxTime = 225;
                time.setTime(maxTime);
            }
        }
        else
        {
            ColorRM = I;
            pressedModerate = false;
        }

        noStroke();
        fill(ColorRM);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorM);
        textFont(moderate_dDifficulty, size);
        textAlign(CENTER, TOP);
        text(s, x + (w/2), y);
    }

    void displayDifficult(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRD = C;
            if (mousePressed == true && mouseButton == LEFT && pressedDifficult == false)
            {
                ColorD = color(255, 255, 255);
                pressedDifficult = true;
                intro = false;
                start = true;
                ins = false;
                result = false;
                exit = false;
                difficulty = true;
                levelMax = 10;
                maxTime = 300;

                time.setTime(maxTime);
            }
        }
        else
        {
            ColorRD = I;
            pressedDifficult = false;
        }

        noStroke();
        fill(ColorRD);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorD);
        textAlign(CENTER, TOP);
        textSize(size);
        text(s, x + (w/2), y);
    }

    void displayNext(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRN = C;
            if (mousePressed == true && mouseButton == LEFT && pressedNext == false)
            {
                ColorN = color(255, 255, 255);
                pressedNext = true;
                insCount += 1;
                intro = false;
                start = false;
                ins = true;
                difficulty = false;
                result = false;
                exit = false;
            }
        }
        else
        {
            ColorRN = I;
            pressedNext = false;
        }

        noStroke();
        fill(ColorRN);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorN);
        textAlign(CENTER, CENTER);
        textSize(size);
        text(s, x + (w/2), y + (h/2));
    }

    void displayBack(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRB = color(152,141,141);
            if (mousePressed == true && mouseButton == LEFT && pressedBack == false)
            {
                ColorB = color(255, 255, 255);
                pressedBack = true;
                insCount -= 1;
                intro = false;
                start = false;
                ins = true;
                difficulty = false;
                result = false;
                exit = false;
            }
        }
        else
        {
            ColorRB = I;
            ColorB = T;
            pressedBack = false;
        }

        noStroke();
        fill(ColorRB);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorB);
        textAlign(CENTER, TOP);
        textSize(size);
        text(s, x + (w/2), y);
    }

    void displayStart(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRS = color(152,141,141);
            if (mousePressed == true && mouseButton == LEFT && pressedStart == false)
            {
                ColorS = color(255, 255, 255);
                pressedNo = true;
                intro = false;
                start = true;
                ins = false;
                difficulty = false;
                result = false;
                exit = false;
                pressedStart = true;
            }
        }
        else
        {
            ColorRS = I;
            ColorS = T;
            pressedStart = false;
        }

        noStroke();
        fill(ColorRS);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorS);
        textAlign(CENTER, TOP);
        textSize(size);
        text(s, x + (w/2), y);
    }

    void displayIntro(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRIn = C;
            if (mousePressed == true && mouseButton == LEFT && pressedIntro == false)
            {
                ColorIn = color(255, 255, 255);
                pressedIntro = true;
                intro = true;
                start = false;
                ins = false;
                difficulty = false;
                result = false;
                exit = false;
                insCount = 0;
            }
        }
        else
        {
            ColorIn = T;
            ColorRIn = I;
            pressedIntro = false;
        }

        noStroke();
        fill(ColorRIn);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorIn);
        textAlign(CENTER, CENTER);
        textSize(size);
        text(s, x + (w/2), y + (h/2));
    }
    void displayPlayAgain(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRPA = C;
            if (mousePressed == true && mouseButton == LEFT && pressedPlayAgain == false)
            {
                ColorPA = color(255, 255, 255);
                pressedPlayAgain = true;
                intro = false;
                start = true;
                ins = false;
                difficulty = false;
                result = false;
                exit = false;
                window = false;
                
                level = 1;
                setup();
                
                redraw();
            }
        }
        else
        {
            ColorPA = T;
            ColorRPA = I;
            pressedPlayAgain = false;
        }

        noStroke();
        fill(ColorRPA);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorPA);
        textAlign(CENTER, CENTER);
        textSize(size);
        text(s, x + (w/2), y + (h/2));
    }

    void displayExit(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorREx = C;
            if (mousePressed == true && mouseButton == LEFT && pressedExit == false)
            {
                ColorEx = color(255, 255, 255);
                pressedExit = true;
                intro = false;
                start = false;
                ins = false;
                difficulty = false;
                result = false;
                exit = true;
            }
        }
        else
        {
            ColorEx = T;
            ColorREx = I;
            pressedExit = false;
        }

        noStroke();
        fill(ColorREx);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorEx);
        textAlign(CENTER, CENTER);
        textSize(size);
        text(s, x + (w/2), y + (h/2));
    }

    void displayYes(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRY = C;
            if (mousePressed == true && mouseButton == LEFT && pressedYes == false)
            {
                ColorY = color(255, 255, 255);
                exit();
            }
        }
        else
        {
            ColorY = T;
            ColorRY = I;
            pressedYes = false;
        }

        noStroke();
        fill(ColorRY);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorY);
        textAlign(CENTER, CENTER);
        textSize(size);
        text(s, x + (w/2), y + (h/2));
    }

    void displayNo(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRNo = C;
            if (mousePressed == true && mouseButton == LEFT && pressedNo == false)
            {
                ColorNo = color(255, 255, 255);
                pressedNo = true;
                intro = false;
                start = false;
                ins = false;
                difficulty = false;
                result = true;
                exit = false;
            }
        }
        else
        {
            ColorNo = T;
            ColorRNo = I;
            pressedNo= false;
        }

        noStroke();
        fill(ColorRNo);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorNo);
        textAlign(CENTER, CENTER);
        textSize(size);
        text(s, x + (w/2), y + (h/2));
    }
    
    void displayMenu(int x, int y, int w, int h, String s, int size)
    {
        if ((mouseX >= x) && (mouseX <= x + w) && (mouseY >= y) && (mouseY <= y + h))
        {
            ColorRMe = C;
            if (mousePressed == true && mouseButton == LEFT && pressedMenu == false)
            {
                ColorMe = color(255, 255, 255);
                pressedMenu = true;
                intro = true;
                start = false;
                ins = false;
                difficulty = false;
                result = false;
                exit = false;
                
                level = 1;
                position1.x = player1X;
                position1.y = player1Y;
                position2.x = player2X;
                position2.y = player2Y;
                setup();
                redraw();
            }
        }
        else
        {
            ColorMe = T;
            ColorRMe = I;
            pressedMenu= false;
        }

        noStroke();
        fill(ColorRMe);
        rect(x, y, w, h, r, r, r, r);

        fill(ColorMe);
        textAlign(CENTER, CENTER);
        textSize(size);
        text(s, x + (w/2), y + (h/2));
    }
    
}
