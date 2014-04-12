/**
 *
 * @author Austin
 *
 * A simple gravity engine.
 */


public class Gravity
{
    private double gravAccel;

    double getGravAccel() { return gravAccel; }
    void setGravAccel(double gravAccel) { this.gravAccel = gravAccel; }

    void GravPull(Player box)
    {
        // Accelerate down due to gravity
        box.velY += gravAccel;
    }

    Gravity(double gravAccel) { this.gravAccel = gravAccel; }
}
