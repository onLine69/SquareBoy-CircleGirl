class Player2
{
    float eyeX, eyeSL, eyeSR;
    float headX, lip;
    float handsX, angleAS, angleAE;
    float feetLX, feetRX, angleFS, angleFE;


    Player2() {}

    void display(float playerX, float playerY)
    {
        eyeX = playerX;
        eyeSL = 9;
        eyeSR = 9;
        headX = playerX;
        lip = playerX;
        handsX = playerX;
        angleAS = 3*PI/2;
        angleAE = 2*PI + PI/2 - 0.7;
        feetLX = playerX;
        feetRX = playerX;
        angleFS = PI/2 + 0.7;
        angleFE = 3*PI/2;

        if (key == CODED)
        {
            if (keyCode == UP || keyCode == DOWN)
            {
                eyeX = playerX;
                eyeSL = 9;
                eyeSR = 9;
                headX = playerX;
                lip = playerX;
                handsX = playerX;
                angleAS = 3*PI/2;
                angleAE = 2*PI + PI/2 - 0.7;
                feetLX = playerX;
                feetRX = playerX;
                angleFS = PI/2 + 0.7;
                angleFE = 3*PI/2;
            }
            if (keyCode == LEFT)
            {
                eyeX = playerX;
                eyeSL = 6;
                eyeSR = 9;
                headX = playerX;
                lip = playerX;
                handsX = playerX;
                angleAS = 3*PI/2;
                angleAE = 2*PI + PI/2 - 0.7;
                feetLX = playerX;
                feetRX = playerX;
                angleFS = PI/2 + 0.7;
                angleFE = 3*PI/2;
            }
            if (keyCode == RIGHT)
            {
                eyeX = playerX+3;
                eyeSL = 9;
                eyeSR = 6;
                headX = playerX+3;
                lip = playerX+3;
                handsX = playerX-9;
                angleAS = PI/2;
                angleAE = 3*PI/2 + 0.7;
                feetLX = playerX+6;
                feetRX = playerX+6;
                angleFS = 3*PI/2;
                angleFE = 5*PI/2 + 0.7;
            }
        }

        //hair
        fill(#17100E);
        stroke(#17100E);
        strokeWeight(2);
        ellipse(12+playerX, 15+playerY, 18, 21);
        ellipse(21+playerX, 15+playerY, 18, 21);

        //braide
        fill(#17100E); // jet black
        stroke(#17100E);
        strokeWeight(2);
        ellipse(5+playerX, 30+playerY, 3, 3);
        ellipse(5+playerX, 26+playerY, 3, 6);
        quad(1.5+playerX, 37.5+playerY, 7.5+playerX, 37.5+playerY, 6+playerX, 34.5+playerY, 3+playerX, 34.5+playerY);

        ellipse(27+playerX, 30+playerY, 3, 3);
        ellipse(27+playerX, 26+playerY, 3, 6);
        quad(23.5+playerX, 37.5+playerY, 30+playerX, 37.5+playerY, 28.5+playerX, 34.5+playerY, 25.5+playerX, 34.5+playerY);

        stroke(#BC7F2F);
        fill(#BC7F2F);
        square(3+playerX, 31.5+playerY, 3);
        square(25.5+playerX, 31.5+playerY, 3);

        //body

        fill(#52381B);
        stroke(#52381B); //  dark brown
        arc(9+playerX, 46.5+playerY, 1, 9, PI/2, PI + PI/2);
        arc(24+playerX, 46.5+playerY, 1, 9, PI + PI/2, 2*PI + PI/2);
        rect(9+playerX, 42+playerY, 15, 9);

        //cloth
        fill(#FFBC12);
        stroke(#FFBC12); // mustard yellow
        strokeWeight(2);
        arc(16.5+playerX, 42+playerY, 15, 18, PI, 2*PI);
        fill(#52381B);
        beginShape();
        curveVertex(13.5+playerX, 33+playerY);
        curveVertex(16.5+playerX, 36+playerY);
        curveVertex(19.5+playerX, 33+playerY);
        curveVertex(16.5+playerX, 32+playerY);
        curveVertex(13.5+playerX, 33+playerY);
        curveVertex(16.5+playerX, 36+playerY);
        curveVertex(19.5+playerX, 33+playerY);
        curveVertex(16.5+playerX, 32+playerY);
        endShape();
        fill(#FFFFFF);
        stroke(#FFFFFF);
        strokeWeight(1);
        ellipse(9+playerX, 42+playerY, 5, 3);
        ellipse(14+playerX, 42+playerY, 5, 3);
        ellipse(19+playerX, 42+playerY, 5, 3);
        ellipse(24+playerX, 42+playerY, 5, 3);


        //head
        stroke(#765E3F);    // dark brown
        strokeWeight(1);
        fill(#AA8659);      //light brown shade
        ellipse(13.5+headX, 24+playerY, 27, 18);

        //eyes
        stroke(#A5A3A3); // gray
        strokeWeight(1);  // Default
        fill(#FFFFFF); // white
        circle(7.5+playerX, 15+playerY, eyeSL);
        circle(18+playerX, 15+playerY, eyeSR);
        fill(#000000); // fill color black
        noStroke();
        circle(6+eyeX, 15+playerY, 2);
        circle(16.5+eyeX, 15+playerY, 2);

        //lips
        strokeWeight(0.3);
        fill(#622217); // maroon
        stroke(#000000);
        arc(13.5+playerX, 27+playerY, 6, 3, PI, 2*PI);
        arc(13.5+playerX, 27+playerY, 6, 3, 0, PI);
        stroke(#000000);
        line(9+playerX, 27+playerY, 18+playerX, 27+playerY);
        line(18+playerX, 27+playerY, 19.5+playerX, 27.5+playerY);

        //legs
        noFill();
        strokeWeight(1);
        stroke(#816344);
        arc(10.5+playerX, 63+playerY, 3, 18, angleFS, angleFE);
        arc(22.5+playerX, 63+playerY, 3, 18, angleFS, angleFE);
        fill(#816344);
        stroke(#816344);
        ellipse(7.5+feetLX, 70.5+playerY, 6, 3);
        ellipse(19.5+feetRX, 70.5+playerY, 6, 3);

        //skirt
        fill(#52381B);
        stroke(#52381B); // mustard yellow
        strokeWeight(2);
        quad(9+playerX, 51+playerY, 24+playerX, 51+playerY, 25.5+playerX, 54+playerY, 7.5+playerX, 54+playerY);

        //belt
        strokeWeight(0.3);
        stroke(#FFFFFF);
        line(7.5+playerX, 51+playerY, 25.5+playerX, 51+playerY);

        //arms
        strokeWeight(1);
        stroke(#816344);
        noFill();
        arc(21+handsX, 45+playerY, 3, 18, angleAS, angleAE);
        ellipse(21+handsX, 52.5+playerY, 3, 3);
    }
}
