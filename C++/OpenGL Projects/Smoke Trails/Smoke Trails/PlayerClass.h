#pragma once

class Player
{
	public:
		int x;
		int y;
		float r;
		float g;
		float b;
		int size;
		int speed;

		Player() {}
		Player(int X, int Y, float R, float G, float B, int Size, int Speed)
		{
			x = X;
			y = Y;
			r = R;
			g = G;
			b = B;
			size = Size;
			speed = Speed;
		}

		~Player() {}

		void draw()
		{
			glPushMatrix();
				glTranslatef((float)x, (float)y, 0);
				glColor3f(r, g, b);
				glBegin(GL_QUADS);
					glVertex2f((float)x, (float)y);
					glVertex2f((float)(x + size), (float)y);
					glVertex2f((float)(x + size), (float)(y + size));
					glVertex2f((float)x, (float)(y + size));
				glEnd();
			glPopMatrix();
		}

		void moveX(int disp)
		{
			x += disp;
		}

		void moveY(int disp)
		{
			y += disp;
		}
};
