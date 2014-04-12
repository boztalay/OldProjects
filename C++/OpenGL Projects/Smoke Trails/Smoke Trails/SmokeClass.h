#pragma once

class Smoke
{
	public:
		int x;
		int y;
		float diam;
		float darkness;
		float darknessConst;
		bool alive;

		Smoke() {}
		void SmokeConst(int X, int Y, float Diam, float Darkness, bool Alive)
		{
			x = X;
			y = Y;
			diam = Diam;
			darkness = Darkness;
			darknessConst = darkness;
			alive = Alive;
		}

		~Smoke() {}

		void draw()
		{
			glPushMatrix();
				glTranslatef((float)x, (float)y, 0);
				glColor3f(darkness, darkness, darkness);
				glutSolidSphere((diam / 2), 20, 20);
			glPopMatrix();
		}

		void reset()
		{
			diam = (float)((rand() % 7) + 1);
			darkness = darknessConst;
			alive = false;
		}

		void update(float expansion, float darken)
		{
			darkness -= darken;
			diam += expansion;

			if(darkness <= 0.0)
				reset();
		}

		void setXY(int X, int Y)
		{
			x = X;
			y = Y;
		}
};
