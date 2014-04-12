/**
 *
 * @author Austin
 *
 * The Main class.
 */

import java.applet.*;
import java.awt.*;
import java.awt.image.*;
//import java.awt.geom.*;
import java.awt.event.*;
import java.util.*;

public class UseTileworld extends Applet implements Runnable, KeyListener
{
    static int SCRWIDTH = 480;
    static int SCRHEIGHT = 480;
    static int FPS = 80;
    int frameRate = 0, frameCount = 0;
    long timeKeeper;
    int moveSignal = 101;
    int curBullet = 0;
    Thread thread;
    Player chars[];
    int ENEMYS = 10;
    tileworld world;
    Gravity gravity;

    BufferedImage backBuffer;
    Graphics2D g2d;

    Random rand = new Random();

    static final int worldArr[][] = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1},
                                     {0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,0,1,1,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                     {1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                     {1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                                     {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};

//    static int[][] worldArr = {{0,0,1,1},
//                               {1,0,0,1},
//                               {0,0,0,0},
//                               {1,0,0,1}};

    @Override
    public void init()
    {
        backBuffer = new BufferedImage(SCRWIDTH, SCRHEIGHT,
                BufferedImage.TYPE_INT_RGB);
        g2d = backBuffer.createGraphics();

        chars = new Player[21];
        chars[0] = new Player(240, 25, 1, 15, 15, 150.0, Color.YELLOW);  //player
        chars[0].setAlive(true);
        chars[0].isPlayer = true;
        for(int i=1; i < 21; i++)
        {
            //Color c = new Color(rand.nextInt(255),rand.nextInt(255),rand.nextInt(255));
            chars[i] = new Player(rand.nextInt(SCRWIDTH-40)+20,     //start pointX
                                rand.nextInt(SCRHEIGHT-40)+20,   //start pointY
                                1,                               //velX
                                15,                              //width
                                15,                              //height
                                100.0,                             // Health
                                Color.RED);                      //color
            chars[i].setAlive(true);
            chars[i].isPlayer = false;
        }

        world = new tileworld(640, 480, 20, 20, Color.GREEN);
        world.initworld(worldArr);
        gravity = new Gravity(0.4);

        thread = new Thread(this);

        addKeyListener(this);
    }

    @Override
    public void start()
    {
        thread.start();
    }

    public void run()
    {
        while(true)
        {
            try
            {
                Thread.sleep(1000/FPS);
                updateAll();
                repaint();

            }catch(InterruptedException exc) {}
        }
    }

    @Override
    public void stop()
    {
        thread = null;
    }


    @Override
    public void update(Graphics g)
    {
        frameCount++;
        if(System.currentTimeMillis() > timeKeeper + 1000)
        {
            timeKeeper = System.currentTimeMillis();
            frameRate = frameCount;
            frameCount = 0;
        }

        g2d.setColor(Color.BLACK);
        g2d.fillRect(0, 0, SCRWIDTH, SCRHEIGHT);

        for(int i=0; i < chars.length; i++)
        {
            chars[i].drawBox(g2d);
            for(int j=0; j < chars[i].bullets.length; j++)
                chars[i].bullets[j].drawBullet(g2d);
        }
        world.drawWorld(g2d);

        g2d.setColor(Color.WHITE);
        g2d.drawString("FPS: " + frameRate, 5, 10);

        paint(g);
    }

    @Override
    public void paint(Graphics g)
    {
        g.drawImage(backBuffer, 0, 0, this);
    }

    public void keyTyped(KeyEvent k){ }
    public void keyPressed(KeyEvent k)
    {
        switch (k.getKeyCode())
        {
            case KeyEvent.VK_LEFT:
                chars[0].Left = true;
                break;
            case KeyEvent.VK_RIGHT:
                chars[0].Right = true;
                break;
            case KeyEvent.VK_SPACE:
                chars[0].Jump();
                break;
//            case KeyEvent.VK_CONTROL:
//                chars[0].Firing = true;
//                break;
        }
    }

    public void keyReleased(KeyEvent k)
    {
        switch (k.getKeyCode())
        {
            case KeyEvent.VK_LEFT:
                chars[0].Left = false;
                break;
            case KeyEvent.VK_RIGHT:
                chars[0].Right = false;
                break;
            case KeyEvent.VK_CONTROL:
                chars[0].Firing = true;
                break;
        }
    }

    void updateAll()
    {
        for(int i=0; i < chars.length; i++)
        {
            if( i == 0)
            {
                updatePlayer(chars[i]);
            }
            else
            {
                updateEnemy(chars[i]);
            }
            gravity.GravPull(chars[i]);
            world.checkWColisions(chars[i]);
            for(int j=0; j < chars[i].bullets.length; j++)
            {
                updateBullets(chars[i].bullets[j]);
            }
            for(int j=0; j < chars.length; j++)
            {
                chars[i].checkBoxColisions(chars[j]);
            }
            for(int j=0; j < chars[i].bullets.length; j++)
            {
                for(int k = 0; k < chars.length; k++)
                {
                    chars[i].bullets[j].checkBulletColisions(chars[k]);
                }
            }
            for(int j=0; j < chars[i].bullets.length; j++)
            {
               for(int k = 0; k < chars.length; k++)
               {
                   if(i == k)
                        continue;
                   //if(!chars[i].isPlayer && !chars[k].isPlayer) //Friendly fire OFF
                   //    continue;
                   if(chars[k].isPlayer) //Player Invincibility
                       continue;
                   chars[i].bullets[j].checkBulletColisions(chars[k]);
               }
            }
        }
    }

    void updatePlayer(Player player)
    {
        if(!player.isAlive())
            return;
        
        if(curBullet >= player.bullets.length)
            curBullet = 0;

        player.incY(player.velY);
        if (player.Left && (player.x >= 0))
        {
            player.incX((player.velX * -1));
        }
        if (player.Right && (player.x <= (SCRWIDTH - player.width)))
        {
            player.incX(player.velX);
        }
        if(player.Firing)
        {
            player.bullets[curBullet].Fire(player);
            curBullet += 1;
            chars[0].Firing = false;
        }
        //world.tileSetColor(player);
//        if(player.y >= (SCRHEIGHT - player.height))
//        {
//            player.velY = 0.0;
//            player.y = (int)(SCRHEIGHT - player.width);
//        }
        
    }

    void updateBullets(Bullet bullet)
    {
        if(!bullet.isAlive())
        {
            bullet.Left = chars[0].getHeading();
            return;
        }
        if((bullet.x > SCRWIDTH) || (bullet.x < 0))
            bullet.setAlive(false);

        if (bullet.Left)
        {
            bullet.incX((bullet.velX * -1));
        }
        else
        {
            bullet.incX((bullet.velX));
        }
//        else if(!bullet.Left || bullet.Right)
//        {
//            if(chars[0].getHeading())
//                bullet.incX((bullet.velX * -1));
//            else
//                bullet.incX((bullet.velX));
//        }
        
    }

    void updateEnemy(Player enemy)
    {
        if(!enemy.isAlive())
            return;

        if(curBullet >= enemy.bullets.length)
            curBullet = 0;

        int moveDir, jump2;
        enemy.incY(enemy.velY);

        if(moveSignal > 50)
        {
            moveDir = rand.nextInt(10);
            if (moveDir >= 5 && moveDir < 10)
            {
                enemy.Right = false;
                enemy.Left = true;
            }
            else if (moveDir < 5 && moveDir >= 0)
            {
                enemy.Left = false;
                enemy.Right = true;
            }
            moveSignal = 0;
        }

        if ((enemy.Left)  && (enemy.x >= 0))
        {
            if((world.tileUpLeft(enemy) && !world.tileUp(enemy)) ||
                    (world.testTile(enemy, -1, -2) && !world.tileUp(enemy) && !world.testTile(enemy, 0, -2)))
                enemy.Jump();
            if(!world.tileDownLeft(enemy))
            {
                if(rand.nextInt(20) < 1)
                {
                    enemy.changeDir();
                }
            }

            enemy.incX(enemy.velX * -1);
        }
        else if ((enemy.Right) && (enemy.x <= (SCRWIDTH - enemy.width)))
        {
            if((world.tileUpRight(enemy) && !world.tileUp(enemy)) ||
                    (world.testTile(enemy, 1, -2) && !world.tileUp(enemy) && !world.testTile(enemy, 0, -2)))
                enemy.Jump();
            if(!world.tileDownRight(enemy))
            {
                if(rand.nextInt(20) < 1)
                {
                    enemy.changeDir();
                }
            }

            enemy.incX(enemy.velX);
        }
        if((chars[0].getCenterY() > enemy.y) &&
                chars[0].getCenterY() < (enemy.y + enemy.height) &&
                (chars[0].getCenterX() < (enemy.getCenterX() + 20) ||
                (chars[0].getCenterX() > (enemy.getCenterX() - 20)) ) && (moveSignal%10 == 0))
        {
            //enemy.bullets[curBullet].Fire(enemy);
            //curBullet += 1;
        }
//        if(enemy.y >= (SCRHEIGHT - enemy.height))
//        {
//            enemy.velY = 0.0;
//            enemy.y = (int)(SCRHEIGHT - enemy.width);
//        }
        moveSignal++;
    }
//END
}
