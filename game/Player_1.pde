class Player1
{
    float headX, headY;                 //for the coordinates of the head
    float eyeX, eyeBX, eyeAngle;        //for the coordinates of the eyes and eyebrow
    float mouthX, mouthY;               //for the coordinates of the mouth

    Player1()
    {
    }

    //display the player
    void display(float playerX, float playerY)
    {
        head(playerX,playerY);
        body(playerX,playerY);
    }

    //head of the player
    void head(float playerX, float playerY)
    {

        headX = playerX;
        headY = playerY;
        eyeX = headX;
        eyeBX = headX;
        mouthX = headX;
        mouthY = headY;
        eyeAngle = 315;

        facial();    //to change the facial expression

        //head
        beginShape();
        fill(#FFFFFF);
        vertex(headX+3,headY+9);
        vertex(headX+3,headY+24);
        vertex(headX+9,headY+33);
        vertex(headX+21,headY+33);
        vertex(headX+27,headY+24);
        vertex(headX+27,headY+9);
        endShape();

        //eyes
        fill(#FFD700);
        stroke(0);
        arc(eyeX+10.5,headY+15,3,6,0,PI);
        line(eyeBX+6,headY+15,eyeBX+12,headY+15);
        arc(eyeX+25.5,headY+15,3,6,0,PI);
        line(eyeBX+21,headY+15,eyeBX+27,headY+15);

        //mouth
        stroke(0);
        noFill();
        line(headX+12,mouthY+24,headX+18,mouthY+24);
        arc(mouthX+9,mouthY+24,6,3,radians(eyeAngle),radians(eyeAngle + 90));

        //hair
        beginShape();
        fill(#3228AD);
        stroke(#3228AD);
        vertex(headX+3,headY+9);
        vertex(headX+12,headY);
        vertex(headX+9,headY+6);
        vertex(headX+11,headY);
        vertex(headX+18,headY+6);
        vertex(headX+24,headY);
        vertex(headX+27,headY+9);
        stroke(0);
        endShape();
    }

    //facial expression
    void facial()
    {
        if (key == 'w' || key == 'W' || key == 's' || key == 'S')
        {
            eyeX -= 3;
            eyeAngle = 315;
            eyeBX -= 1.5;
        }
        if (key == 'a' || key == 'A')
        {
            eyeX = headX - 6;
            eyeAngle -= 180;
            mouthX = headX + 12;
            eyeBX = headX - 3;
        }
        if (key == 'd' || key == 'D')
        {
            eyeX = headX;
            eyeAngle = 315;
            mouthX = headX;
            eyeBX = headX;
        }
    }

    //body of the player
    void body(float playerX, float playerY)
    {
        //main body
        fill(#E8BEAC);
        rect(playerX+6, playerY+33, 18, 21);

        //shirt
        fill(#FFFFFF);
        arc(playerX+6,playerY+33,6,12,0,HALF_PI);
        arc(playerX+24,playerY+33,6,12,HALF_PI,PI);
        line(playerX+6,playerY+33,playerX+24,playerY+33);
        point(playerX+9,playerY+39);
        point(playerX+21,playerY+39);
        noFill();
        arc(playerX+9,playerY+39,8,4,radians(20), radians(160));
        arc(playerX+21,playerY+39,8,4,radians(20), radians(160));
        line(playerX+15,playerY+42,playerX+15,playerY+51);
        line(playerX+12,playerY+45,playerX+18,playerY+45);
        line(playerX+12,playerY+48,playerX+18,playerY+48);

        //arms
        fill(#FFFFFF);
        rect(playerX,playerY+33,6, 21);
        line(playerX+2,playerY+54,playerX+2,playerY+51);
        line(playerX+4,playerY+54,playerX+4,playerY+51);
        line(playerX+6,playerY+54,playerX+6,playerY+51);
        rect(playerX+24,playerY+33,6,21);
        line(playerX+26,playerY+54,playerX+26,playerY+51);
        line(playerX+28,playerY+54,playerX+28,playerY+51);
        line(playerX+30,playerY+54,playerX+30,playerY+51);

        //watch
        fill(0);
        stroke(#FFFFFF);
        rect(playerX+24,playerY+45,6,3);
        stroke(0);
        fill(#FFD700);
        ellipse(playerX+27,playerY+46.5,3,3);

        //legs
        fill(#FFFFFF);
        rect(playerX+6, playerY+54, 9, 24);
        rect(playerX+15, playerY+54, 9, 24);

        //shorts
        fill(#3A8891);
        rect(playerX+6,playerY+54,18,9);
        line(playerX+15,playerY+54,playerX+15,playerY+63);

        //shoes
        fill(#7D7D81);
        rect(playerX+6,playerY+72,9,6);
        rect(playerX+15,playerY+72,9,6);
        fill(#3D3D40);
        rect(playerX+9,playerY+75,3,3);
        rect(playerX+18,playerY+75,3,3);
    }
}
