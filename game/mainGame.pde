import processing.sound.*;

boolean intro = true;
boolean ins = false;
boolean start = false;
boolean difficulty = false;
boolean result = false;
boolean exit = false;
boolean window = true;

int level = 1;
int levelMax;
int insCount = 0;
int maxTime;

float char1X = 30, char1Y = 78;
float char2X = 30, char2Y = 78;

Timer time = new Timer();
Buttons button = new Buttons();
Platform platform;
Player1 player1;
Player2 player2;
Status status = new Status();
Bonus bonus;

//for the lava
float lavaW = 800, lavaL = 5;
float lavaX = 0, lavaY = 500 - lavaL;
//for the largest platform in level 1
float platformlowestL, platformlowestW , platformlowestY;
float[] platformlowestX = new float[2];
//for the platforms
float platformL = 5;
float[] platformW = new float[6];
float[] platformX = new float[6];
float platformY;
float platformLowestX;
float platformDistance = 85;

float platformSpeed = 1.5;
float speed1, speed2, speed3, speed4;

float player1X = 0, player1Y = 407;
float player2X = 770, player2Y = 413;

float charSpeed = 5, charJump = platformDistance, charFall = 20;

PVector position1 = new PVector(player1X, player1Y);
PVector velocity1 = new PVector(0,0);
PVector acceleration1 = new PVector(0,0);

PVector position2 = new PVector(player2X, player2Y);
PVector velocity2 = new PVector(0,0);
PVector acceleration2 = new PVector(0,0);

//for the title
PImage backgroundTitle;
PImage designTitle;
PFont title1Title;
PFont title1_2Title;
PFont title2Title; 

//for the Instructions
PImage instruction1;
PImage instruction2;
PImage instruction3;

//for the status
PImage backgroundStatus;
PFont title1Status;
PFont title2Status;
PFont time_placementStatus;
PFont lvl_placementStatus;

//when choosing difficulty
PImage backgroundDifficulty;
PImage designDifficulty;
PFont title1Difficulty;
PFont easy_dDifficulty;
PFont moderate_dDifficulty;
PFont difficult_dDifficulty;

//for results
PImage backgroundResult;
PImage designResult;
PFont title1Result;
PFont title1_2Result;
PFont title2Result; 

PImage platformLowestTexture;
PImage platformTexture;
PImage gameBackground;

PImage hourGlass;

SoundFile backgroundMusic;

void setup(){
  size(800,500);
  surface.setTitle("Square Boy and Circle Girl");
  
  //for the title screen
  backgroundTitle = loadImage("title screen.png");
  backgroundTitle.resize(800, 500);
  title1Title = createFont("AutumnHuismuis22-3zGGy.otf", 10);
  title1_2Title = createFont ("AutumnHuismuis22-3zGGy.otf", 10);
  title2Title = createFont("PublicPixel-z84yD.ttf", 100);
  
  //for the instructions
  instruction1 = loadImage("Instruction1.png");
  instruction1.resize(800,500);
  instruction2 = loadImage("Instruction2.png");
  instruction2.resize(800,500);
  instruction3= loadImage("Instruction3.png");
  instruction3.resize(800,500);
  
  //for the difficulty selection
  backgroundDifficulty = loadImage("title screen.png");
  backgroundDifficulty.resize(800, 500);
  title1Difficulty = createFont("PublicPixel-z84yD.ttf", 10);
  easy_dDifficulty = createFont("AutumnHuismuis22-3zGGy.otf", 100);
  moderate_dDifficulty = createFont("AutumnHuismuis22-3zGGy.otf", 100);
  difficult_dDifficulty = createFont("AutumnHuismuis22-3zGGy.otf", 100);
  
  //for the status
  backgroundStatus = loadImage("result.png");
  backgroundStatus.resize(300, 500);
  title1Status = createFont("AutumnHuismuis22-3zGGy.otf", 10);
  title2Status = createFont("AutumnHuismuis22-3zGGy.otf", 10);
  time_placementStatus = createFont("PublicPixel-z84yD.ttf", 10);
  lvl_placementStatus = createFont("PublicPixel-z84yD.ttf", 10);
  
  gameBackground = loadImage("game layout.jpg");
  gameBackground.resize(800,500);
  platformLowestTexture = loadImage("ground platform.png");
  platformTexture = loadImage("platform 2.png");
  
  backgroundResult = loadImage("win or lose.png");
  backgroundResult.resize(800, 500);
  title1Result = createFont("PublicPixel-z84yD.ttf", 10);
  title1_2Result = createFont ("PublicPixel-z84yD.ttf", 10);
  title2Result = createFont ("AutumnHuismuis22-3zGGy.otf", 10);
  
  hourGlass = loadImage("hourGlass.png");
  
  backgroundMusic = new SoundFile(this, "IMG_6995.mp3");
  
  
  if(level == 1){
    button = new Buttons();
    platform = new Platform();
    player1 = new Player1(); 
    player2 = new Player2();
    bonus = new Bonus();
    
    if (window){
      String[] title = {""};
      PApplet.runSketch(title, status);
      backgroundMusic.loop();
    }
  } else {
    button = new Buttons();
    platform = new Platform();
    player1 = new Player1(); 
    player2 = new Player2();
    bonus = new Bonus();
  }
  
  
}

void draw(){
  if (intro){
    background(backgroundTitle);
    textFont(title1Title, 63);
    fill(#000000);
    textAlign(CENTER);
    text("SQUARE Boy and CIRCLE Girl", 390, 161);
    
    textFont(title1_2Title, 63);
    fill(#D6D6D6);
    textAlign(CENTER);
    text("SQUARE Boy and CIRCLE Girl", 392, 160);
    
    button.displayPlay(275, 350, 250, 70, "PLAY", 50);
    button.displayIns(275, 430, 250, 20, "INSTRUCTIONS", 15);
  }
  else if (start){
    if (!difficulty){
      background(backgroundDifficulty);
      textFont(title1Difficulty, 16);
      fill(255);
      textAlign(CENTER);
      text("Choose How Many Levels", 380, 180);
      
      button.displayEasy(150, 270, 150, 70, "3", 68);
      button.displayModerate(325, 270, 150, 70, "5", 68);
      button.displayDifficult(500, 270, 150, 70, "10", 68);
    } else if (difficulty){
      background(gameBackground);
      if (level <= levelMax){
        time.countDown();
        bonus.display();
        bonus.update();
      }
      if (time.getTime() < 0){
        intro = false;
        start = false;
        ins = false;
        difficulty = false;
        result = true;
        exit = false;
      }
      position1.add(velocity1);
      position2.add(velocity2);
      velocity1.add(acceleration1);
      velocity2.add(acceleration2);
      bonus.display();
      gravity();
      platform.lava(lavaX, lavaY, lavaW, lavaL);
      platform.display();
      player1.display(position1.x, position1.y);
      player2.display(position2.x, position2.y);
      levelUp();
      
      button.displayMenu(690, 0, 100, 50, "MENU", 50);
    }
  } else if (ins) {
    if (insCount == 1){
      background(instruction1);
      button.displayNext(580, 470, 200, 25, "NEXT", 20);
      button.displayIntro(20, 470, 200, 25, "INTRO", 20);
    } else if (insCount == 2){
      background(instruction2);
      button.displayNext(580, 470, 200, 25, "NEXT", 20);
      button.displayBack(360, 470, 200, 25, "BACK", 20);
    } else if (insCount == 3){
      background(instruction3);
      button.displayStart(20, 470, 200, 25, "START", 20);
      button.displayBack(360, 470, 200, 25, "BACK", 20);
    }
  } else if (result){
    if ((time.getTime() > 0) && (level > levelMax)){
      background(backgroundResult);
      textFont(title1Result, 50);
      fill(#000000);
      textAlign(CENTER);
      text("CONGRATULATIONS!", 389, 261);
      
      textFont(title1_2Result, 50);
      fill(255);
      textAlign(CENTER);
      text("CONGRATULATIONS!", 392, 261);
      
      textFont(title2Result, 50);
      fill(255);
      textAlign(CENTER);
      text("Great job! You won", 390, 320);
      
      button.displayExit(420, 400, 100, 60, "EXIT", 50);
      button.displayPlayAgain(155, 400, 150, 60, "PLAY AGAIN", 30);
    } else if ((time.getTime() < 0) && (level <= levelMax)){
      background(backgroundResult);
      textFont(title1Result, 50);
      fill(#000000);
      textAlign(CENTER);
      text("GAME OVER!", 389, 261);
      
      textFont(title1_2Result, 50);
      fill(255);
      textAlign(CENTER);
      text("GAME OVER!", 392, 261);
      
      textFont(title2Result, 50);
      fill(255);
      textAlign(CENTER);
      text("Better Luck Next Time!", 390, 320);
      
      button.displayExit(420, 400, 100, 60, "EXIT", 50);
      button.displayPlayAgain(155, 400, 150, 60, "PLAY AGAIN", 30);
    } 
  } else if (exit){
      background(backgroundTitle);
      textFont(title1Status, 70);
      fill(255);
      textAlign(CENTER, CENTER);
      text("DO YOU WANT TO EXIT?", 400, 200);
      
      button.displayYes(420, 350, 100, 50, "YES", 50);
      button.displayNo(180, 350, 100, 50, "NO", 50);
    }
  println("Intro = " + intro);
  println("Start = " + start);
  println("Ins = " + ins);
  println("Diff = " + difficulty);
  println("Result = " + result);
  println("Exit = " + exit);
} 

void keyPressed(){
  if ((key == 'a') || (key == 'A')){
    velocity1.x = -charSpeed;
    acceleration1.x = 1;
  }
  if ((key == 'd') || (key == 'D')){
    velocity1.x = charSpeed;
    acceleration1.x = -1;
  }
  if ((key == 'w') || (key == 'W')){
    velocity1.y = -charJump;
    acceleration1.y = charFall;
  }
  if ((key == 's') || (key == 'S')){
    velocity1.y = charJump;
    acceleration1.y = charFall;
  }
  
  if (key == CODED){
    if (keyCode == UP){
      velocity2.y = -charJump;
      acceleration2.y = charFall;
    }
    if (keyCode == DOWN){
      velocity2.y = charJump;
      acceleration2.y = charFall;
    }
    if (keyCode == LEFT){
      velocity2.x = -charSpeed;
      acceleration2.x = 1;
    }
    if (keyCode == RIGHT){
      velocity2.x = charSpeed;
      acceleration2.x = -1;
    }
  }
}

void gravity(){
  //for player 1
  if ((velocity1.x > -1) && (velocity1.x < 1)){
    acceleration1.x = 0;
    velocity1.x = 0;
  }
  if (position1.y > platformY - platformDistance){
    for (int i = 0; i < 2; i++){
      if ((position1.x + char1X > platformlowestX[i]) && (position1.x < platformlowestX[i] + platformlowestW)){
        acceleration1.y = 0;
        velocity1.y = 0;
        position1.y = player1Y;
      } else if (((position1.x > platformlowestX[0] + platformlowestW) && (position1.x + char1X < platformlowestX[1])) || 
      (position1.x + char1X < platformlowestX[0]) || (position1.x > platformlowestX[1] + platformlowestW)){
        acceleration1.y = charFall;
        velocity1.y = charJump;
      }
    }
  } 
  for (int i = 0; i < 6; i++){
    if ((position1.y < platformY - (i*platformDistance)) && (position1.y > platformY - ((i+1)*platformDistance))){
      if ((position1.x + char1X > platformX[i]) && (position1.x < platformX[i] + platformW[i])){ //to make the character stay in the platform
        acceleration1.y = 0;
        velocity1.y = 0;
        position1.y = platformY - (i*platformDistance) - char1Y;
      } else if ((position1.x > platformX[i] + platformW[i]) || (position1.x + char1X < platformX[i])){
          acceleration1.y = charFall;
          velocity1.y = charJump;
      }
   } else if (position1.y > 500){
     position1.y = 400;
     position1.x = 0;
   }
 }
 
 //for player 2
   if ((velocity2.x > -1) && (velocity2.x < 1)){
      acceleration2.x = 0;
      velocity2.x = 0;
    }
   if (position2.y > platformY - platformDistance){
    for (int i = 0; i < 2; i++){
      if ((position2.x + char2X > platformlowestX[i]) && (position2.x < platformlowestX[i] + platformlowestW)){
        acceleration2.y = 0;
        velocity2.y = 0;
        position2.y = player2Y;
      } else if (((position2.x > platformlowestX[0] + platformlowestW) && (position2.x + char2X < platformlowestX[1])) || 
      (position2.x + char2X < platformlowestX[0]) || (position2.x > platformlowestX[1] + platformlowestW)){
        acceleration2.y = charFall;
        velocity2.y = charJump;
      }
    }
  } 
  for (int i = 0; i < 6; i++){
    if ((position2.y < platformY - (i*platformDistance)) && (position2.y > platformY - ((i+1)*platformDistance))){
      if ((position2.x + char2X > platformX[i]) && (position2.x < platformX[i] + platformW[i])){ //to make the character stay in the platform
        acceleration2.y = 0;
        velocity2.y = 0;
        position2.y = platformY - (i*platformDistance) - char2Y + 6;
      } else if ((position2.x > platformX[i] + platformW[i]) || (position2.x + char2X < platformX[i])){
          acceleration2.y = charFall;
          velocity2.y = charJump;
      }
   } else if (position2.y > 500){
     if (level == 1){
       position2.y = 413;
       position2.x = 770;
     } else {
       position2.y = 400;
       position2.x = 0;
     }
   }
 }
}

void levelUp(){
  int i = 5;
    if (((position1.y < platformY - (i*platformDistance)) && (position1.y > platformY - ((i+1)*platformDistance))) && 
    ((position2.y < platformY - (i*platformDistance)) && (position2.y > platformY - ((i+1)*platformDistance)))){
      if (((position1.x + char1X > platformX[i]) && (position1.x < platformX[i] + platformW[i])) && 
      ((position2.x + char2X > platformX[i]) && (position2.x < platformX[i] + platformW[i]))){ //to make the character stay in the platform
          level += 1;
          if (level > levelMax){
            intro = false;
            start = false;
            ins = false;
            difficulty = false;
            result = true;
            exit = false;
          }
          position1.y = height-100;
          position1.x = 0;
          position2.y = height-100;
          position2.x = 0;
          setup();
          redraw();
      }
    }
}
