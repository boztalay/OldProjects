/**
 *
 * @author Austin
 *
 * This file describes the main functionality of the actual world the player
 * steps on.
 *
 */

import java.io.*;
import java.awt.*;
import java.applet.*;

public class tileworld extends Applet
{
    Player[][] boxes;
    int BOXW;
    int BOXH;
    FileInputStream fin;
    private int tileWidth, tileHeight;
    Color c;

    tileworld(int ScrWidth, int ScrHeight, int tileWidth, int tileHeight, Color c)
    {
        BOXW = 24;//(ScrWidth/tileWidth);// CHANGE LATER
        BOXH = 24;//(ScrHeight/tileHeight);// CHANGE LATER
        this.tileWidth = tileWidth;
        this.tileHeight = tileHeight;
        boxes = new Player[BOXH][BOXW];
        this.c = c;

        for(int i=0; i < BOXH; i++)
        {
            for(int j=0; j < BOXW; j++)
            {
                boxes[j][i] = new Player((i*tileWidth), (j*tileHeight),
                        tileWidth, tileHeight,100.0, c);
                boxes[j][i].setAlive(false);
            }
        }
    }

    tileworld(int ScrWidth, int ScrHeight)
    {
        //default box widths and height is 20
        BOXW = (ScrWidth/20);
        BOXH = (ScrHeight/20);
        boxes = new Player[BOXW][BOXH];
        c = Color.GREEN;

        for(int i=0; i < BOXH; i++)
        {
            for(int j=0; j < BOXW; j++)
            {
                boxes[j][i] = new Player((i*20), (j*20),20, 20,100.0, c);
                boxes[j][i].setAlive(false);
            }
        }
    }

    void initworld(String filename) throws FileNotFoundException
    {
//        int input[];
//
//        try
//        {
//            fin = new FileInputStream(filename);
//        }
//        catch(FileNotFoundException exc)
//        {
//            throw exc;
//        }
//
//        for(int i=0; i< BOXW; i++)
//
//        for(int i=0; i < BOXW; i++)
//        {
//            for(int j=0; j < BOXH; j++)
//            {
//                fin.read(b, j, j);
//                if(arr[i][j] <= 0)
//                    boxes[i][j].setAlive(false);
//                else if(arr[i][j] >= 0)
//                    boxes[i][j].setAlive(true);
//            }
//        }
    }

    void initworld(int arr[][])
    {
        for(int i=0; i < BOXH; i++)
        {
            for(int j=0; j < BOXW; j++)
            {
                if(arr[j][i] <= 0)
                    boxes[j][i].setAlive(false);
                else if(arr[j][i] > 0)
                    boxes[j][i].setAlive(true);
            }
        }
    }

    void drawWorld(Graphics2D g2d)
    {
        g2d.setColor(c);
        for(int i=0; i < BOXH; i++)
        {
            for(int j=0; j < BOXW; j++)
            {
                if(boxes[j][i].isAlive())
                {
                    g2d.fillRect(boxes[j][i].x, boxes[j][i].y,
                            boxes[j][i].width, boxes[j][i].height);
                }
            }
        }
    }

    void checkWColisions(Player player)
    {
        for(int i=0; i < BOXH; i++)
        {
            for(int j=0; j < BOXW; j++)
            {
                if(boxes[j][i].isAlive())
                {
                    if(player.intersects(boxes[j][i].getBounds()))
                    {
                        //Check Left box side
                        if((player.getCenterX() < boxes[j][i].getCenterX()) &&
                           ((player.lastMoveY + player.height) > (boxes[j][i].y)) &&
                            (player.lastMoveY < (boxes[j][i].y + boxes[j][i].height)))
                        {
                            player.x = (boxes[j][i].x - player.width);
                        }
                        //Check Right box side
                        else if((player.getCenterX() > boxes[j][i].getCenterX()) &&
                               ((player.lastMoveY + player.height) > (boxes[j][i].y)) &&
                                (player.lastMoveY < (boxes[j][i].y + boxes[j][i].height)))
                        {
                            player.x = (boxes[j][i].x + boxes[j][i].width);
                        }
                        //Check Top box side
                        if((player.getCenterY() < boxes[j][i].getCenterY()) &&
                          ((player.lastMoveX + player.width) > (boxes[j][i].x)) &&
                           (player.lastMoveX < (boxes[j][i].x + boxes[j][i].width)))
                        {
                            player.y = (boxes[j][i].y - player.height);
                            player.velY = 0.0;
                            player.Jumping = false;
                            player.Jumping2 = false;
                        }
                        //Check Bottom box side
                        else if((player.getCenterY() > boxes[j][i].getCenterY()) &&
                               ((player.lastMoveX + player.width) > (boxes[j][i].x)) &&
                                (player.lastMoveX < (boxes[j][i].x + boxes[j][i].width)))
                        {
                            player.y = (boxes[j][i].y + boxes[j][i].height);
                            player.velY = 0.0;
                        }
                    }
                }
            }
        }
    }

    boolean tileUp(Player box)
    {
        int x = ((int)box.getCenterX() / tileWidth);
        int y = ((int)box.getCenterY() / tileHeight)-1;
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            if(boxes[y][x].isAlive())
                return true;
            else
                return false;
        }
        return true;
    }

    boolean tileUpRight(Player box)
    {
        int x = ((int)box.getCenterX() / tileWidth)+1;
        int y = ((int)box.getCenterY() / tileHeight)-1;
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            if(boxes[y][x].isAlive())
                return true;
            else
                return false;
        }
        return true;
    }

    boolean tileRight(Player box)
    {
        int x = ((int)box.getCenterX() / tileWidth)+1;
        int y = ((int)box.getCenterY() / tileHeight);
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            if(boxes[y][x].isAlive())
                return true;
            else
                return false;
        }
        return true;
    }

    boolean tileDownRight(Player box)
    {
        int x = ((int)box.getCenterX() / tileWidth)+1;
        int y = ((int)box.getCenterY() / tileHeight)+1;
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            if(boxes[y][x].isAlive())
                return true;
            else
                return false;
        }
        return true;
    }

    boolean tileDown(Player box)
    {
        int x = ((int)box.getCenterX() / tileWidth);
        int y = ((int)box.getCenterY() / tileHeight)+1;
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            if(boxes[y][x].isAlive())
                return true;
            else
                return false;
        }
        return true;
    }

    boolean tileDownLeft(Player box)
    {
        int x = ((int)box.getCenterX() / tileWidth)-1;
        int y = ((int)box.getCenterY() / tileHeight)+1;
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            if(boxes[y][x].isAlive())
                return true;
            else
                return false;
        }
        return true;
    }

    boolean tileLeft(Player box)
    {
        int x = ((int)box.getCenterX() / tileWidth);
        int y = ((int)box.getCenterY() / tileHeight)-1;
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            if(boxes[y][x].isAlive())
                return true;
            else
                return false;
        }
        return true;
    }

    boolean testTile(Player box, int xOffset, int yOffset)
    {
        int x = ((int)box.getCenterX() / tileWidth)+xOffset;
        int y = ((int)box.getCenterY() / tileHeight)+yOffset;
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            if(boxes[y][x].isAlive())
                return true;
            else
                return false;
            }
        return true;
    }

    boolean tileUpLeft(Player box)
    {
        int x = ((int)box.getCenterX() / tileWidth)-1;
        int y = ((int)box.getCenterY() / tileHeight)-1;
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            if(boxes[y][x].isAlive())
                return true;
            else
                return false;
            }
        return true;
    }

    void tileSetColor(Player box)
    {
        int x = ((int)box.getCenterX() / tileWidth)-1;
        int y = ((int)box.getCenterY() / tileHeight)-1;
        if(x >= 0 && y >= 0 && x < BOXW && y < BOXH)
        {
            boxes[y][x].setAlive(true);
            boxes[y][x].color = Color.RED;
        }
    }
//END
}
