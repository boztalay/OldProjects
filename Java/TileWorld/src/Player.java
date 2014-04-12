/**
 *
 * @author Austin
 *
 * This file describes the main functionality of the player and the enemys.
 */

import java.awt.*;

public class Player extends Rectangle
{
    double velX, velY = 0.0;
    int lastMoveX, lastMoveX2;
    int lastMoveY, lastMoveY2;
    boolean Left, Right, Jumping, Jumping2, Firing;
    boolean isPlayer;
    int AMOCAP = 6;
    private double TotalHealth, CurrentHealth;
    private boolean Alive;
    Color color;
    Bullet bullets[] = new Bullet[AMOCAP];

    void setAlive(boolean X) { Alive = X; }
    boolean isAlive() { return Alive; }

    Player(int x, int y, double velX, int width, int height, double Health, Color c)
    {
        super(x, y, width, height);
        this.velX = velX;
        lastMoveX = x;
        lastMoveY = y;
        TotalHealth = CurrentHealth = Health;
        Left = Right = Jumping = Jumping2 = false;
        isPlayer = false;
        Alive = false;
        color = c;
        loadBullets();
    }

    Player(int x, int y, int width, int height, double Health, Color c)
    {
        super(x, y, width, height);
        velX = 0.0;
        lastMoveX = x;
        lastMoveY = y;
        TotalHealth = CurrentHealth = Health;
        Left = Right = Jumping = Jumping2 = false;
        isPlayer = false;
        Alive = false;
        color = c;
        loadBullets();
    }

    Player(int x, int y, double velX, int width, int height, double Health)
    {
        super(x, y, width, height);
        this.velX = velX;
        lastMoveX = x;
        lastMoveY = y;
        TotalHealth = CurrentHealth = Health;
        Left = Right = Jumping = Jumping2 = false;
        isPlayer = false;
        Alive = false;
        color = Color.GREEN;
        loadBullets();
    }

    Player(int x, int y, int width, int height, double Health)
    {
        super(x, y, width, height);
        velX = 0.0;
        lastMoveX = x;
        lastMoveY = y;
        TotalHealth = CurrentHealth = Health;
        Left = Right = Jumping = Jumping2 = false;
        isPlayer = false;
        Alive = false;
        color = Color.GREEN;
        loadBullets();
    }

    void moveTo(int x, int y)
    {
        lastMoveX = this.x;
        lastMoveY = this.y;
        this.x = x;
        this.y = y;
    }

    void incX(double velX)
    {
        lastMoveX2 = lastMoveX;
        lastMoveX = this.x;
        this.x += velX;
    }
    void incY(double velY)
    {
        lastMoveY2 = lastMoveY;
        lastMoveY = this.y;
        this.y += velY;
    }

    void incHealth(int x)
    {
        CurrentHealth += x;
        if(CurrentHealth >= TotalHealth)
            CurrentHealth = TotalHealth;
    }
    void deincHealth(int x)
    {
        CurrentHealth -= x;
        if(CurrentHealth <= 0)
            reset();
    }

    void Jump()
    {
        if(!Jumping)
        {
            velY = -(height*0.45);
            Jumping = true;
            return;
        }
        if(Jumping && !Jumping2 && (velY > -1.0))
        {
            velY = -height*0.4;
            Jumping2 = true;
            return;
        }
    }

    boolean getHeading()
    {
        if(lastMoveX < lastMoveX2)
            return true;          // moving left
        else
            return false;         // moving right
    }

    void changeDir()
    {
        if(!isPlayer)
        {
            Right = !Right;
            Left = !Left;
        }
    }

    void reset()
    {
        if(isPlayer)
        {
            velY = 0.0;
            x = 240;
            y = 20;
            CurrentHealth = TotalHealth;
            Alive = true;
        }
        else
            Alive = false;
    }

    void loadBullets()
    {
        for(int i=0; i < bullets.length; i++)
        {
            bullets[i] = new Bullet(this.x, this.y, 4.0, 0.0, 3, 2);
        }
    }

    public void drawBox(Graphics2D g2d)
    {
        //draw the player
        if(!Alive)
            return;

        double healthbar = (width-2) * (CurrentHealth/TotalHealth);

        g2d.setColor(color);
        g2d.fillRect(x, y, width, height);

        g2d.setColor(Color.GREEN);
        g2d.fillRect(x+1, (y-7), (int)healthbar, 4);

        g2d.setColor(Color.LIGHT_GRAY);
        g2d.drawRect(x, (y-7), width-1, 4);
    }

    void checkBoxColisions(Player box2)
    {
        if(!Alive || !box2.Alive)
            return;

        if(intersects(box2.getBounds()))
        {
            //Check Left box side
            if((getCenterX() < box2.getCenterX()) &&
               ((lastMoveY + height) > (box2.y)) &&
                (lastMoveY < (box2.y + box2.height)))
            {
                x = (box2.x - width);
                changeDir();
            }
            //Check Right box side
            else if((getCenterX() > box2.getCenterX()) &&
                   ((lastMoveY + height) > (box2.y)) &&
                    (lastMoveY < (box2.y + box2.height)))
            {
                x = (box2.x + box2.width);
                changeDir();
            }
            //Check Top box side
            if((getCenterY() < box2.getCenterY()) &&
              ((lastMoveX + width) > (box2.x)) &&
               (lastMoveX < (box2.x + box2.width)))
            {
                y = (box2.y - height);
                velY = 0.0;
                Jumping = false;
                Jumping2 = false;
            }
            //Check Bottom box side
            else if((getCenterY() > box2.getCenterY()) &&
                   ((lastMoveX + width) > (box2.x)) &&
                    (lastMoveX < (box2.x + box2.width)))
            {
                y = (box2.y + box2.height);
                velY = 0.0;
            }
        }
    }
}

