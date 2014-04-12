struct Object
{
       Vector position;
       Vector direction;
       Vector appliedForces;
       Vector displayColor;
       Vector offsets;
       Vector velocity;
       
       float mass;
       float radius;
       
       void Init(float x, float y, float R, float G, float B, float m, float r)
       {
                  position.x = x;
                  position.y = y;
                  position.z = 0.0f;
                  direction.x = 1.0f;
                  appliedForces.x = 0.0f;
                  appliedForces.y = 0.0f;
                  appliedForces.z = 0.0f;
                  displayColor.x = R;
                  displayColor.y = G;
                  displayColor.z = B;
                  mass = m;
                  radius = r;
       }
       void Draw()
       {
             glPushMatrix();
                  glColor3f(displayColor.x, displayColor.y, displayColor.z);
                  glTranslatef(position.x, position.y, position.z);
                   glRotatef(0.0, 0.0, 1.0, atan2(direction.y, direction.x);
                  glBegin(GL_TRIANGLES);
                       glVertex3f(position.x, (position.y + radius));
                       glVertex3f((position.x - radius), (position.y - radius));
                       glVertex3f((position.x + radius), (position.y - radius));
                  glEnd();
             glPopMatrix();
       }
       void Move(float time)
       {
             offsets = vecScaleConst(offsets, time);
             
             position = vecAdd(position, offsets);
       }
       void Rotate(float rotateAngle)
       {
               direction = vecRotate(direction, rotateAngle);
       }
};
typedef struct Object Object;
