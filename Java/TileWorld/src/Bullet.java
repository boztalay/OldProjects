/**
 *
 * @author Owner
 */

import java.awt.*;

public class Bullet extends Rectangle
{
    double velX, velY;
    boolean Left;
    private boolean Alive;
    Color color;

    void setAlive(boolean X) { Alive = X; }
    boolean isAlive() { return Alive; }

    Bullet(int x, int y, double velX, double velY, int width, int height, Color c)
    {
        super(x, y, width, height);
        this.velX = velX;
        this.velY = velY;
        Left = false;
        Alive = false;
        color = c;
    }

    Bullet(int x, int y, int width, int height, Color c)
    {
        super(x, y, width, height);
        velX = 0.0;
        velY = 0.0;
        Left = false;
        Alive = false;
        color = c;
    }

    Bullet(int x, int y, double velX, double velY, int width, int height)
    {
        super(x, y, width, height);
        this.velX = velX;
        this.velY = velY;
        Left = false;
        Alive = false;
        color = Color.LIGHT_GRAY;
    }

    Bullet(int x, int y, int width, int height)
    {
        super(x, y, width, height);
        velX = 0.0;
        velY = 0.0;
        Left = false;
        Alive = false;
        color = Color.LIGHT_GRAY;
    }

    void incX(double velX)
    {
        this.x += velX;
    }
    void incY(double velY)
    {
        this.y += velY;
    }

    void Fire(Player player)
    {
        if(player.getHeading())
        {
            x = (int)player.getCenterX() - (player.width/2);
        }
        else
            x = (int)player.getCenterX() + player.width;
        
        y = (int)player.getCenterY();
        Alive = true;
        //this.y += velY;
    }

    public void drawBullet(Graphics2D g2d)
    {
        //draw the player
        if(!Alive)
            return;

        g2d.setColor(color);
        g2d.fillRect(x, y, width, height);
    }

    void checkBulletColisions(Player box)
    {
        if(!Alive || !box.isAlive())
            return;

        if(box.contains(this))
        {
            this.Alive = false;
            box.deincHealth(10);
        }
    }
}
