/**
 *
 * @author Owner
 */

import java.net.*;
import java.io.*;
import java.awt.*;
import java.awt.image.*;
import java.applet.*;
import java.awt.event.*;

public class clickclient extends Applet implements Runnable, MouseListener
{
    static int SCRWIDTH = 500;
    static int SCRHEIGHT = 500;
    private static final int PORT = 5001;
    private static final String HOST = "98.250.15.150";

    private Socket sock;
    private BufferedReader in;     // i/o for the client
    private PrintWriter out;
    private String ServerMsg;

    Thread thread;
    BufferedImage backBuffer;
    Graphics2D g2d;

    @Override
    public void init()
    {
        backBuffer = new BufferedImage(SCRWIDTH, SCRHEIGHT,
                BufferedImage.TYPE_INT_RGB);
        g2d = backBuffer.createGraphics();
        setBackground(Color.BLACK);
        thread = new Thread(this);
        addMouseListener(this);
    }

    @Override
    public void start()
    {
        thread.start();
    }

    public void run()
    {
        makeContact();
        while(true)
        {
            try
            {
                Thread.sleep(20);
                repaint();
            }catch(InterruptedException e) {}
        }
    }

    public void mouseClicked(MouseEvent e) {}
    public void mousePressed(MouseEvent e)
    {
        int X = e.getX();
        int Y = e.getY();
        g2d.drawRect(X-5, Y-5, 10, 10);

        String line = "Clicked at: " + X + ", " + Y;
        out.println(line);
    }
    public void mouseReleased(MouseEvent e) {}
    public void mouseEntered(MouseEvent e) {}
    public void mouseExited(MouseEvent e) {}

    @Override
    public void stop()
    {
        thread = null;
        closeLink();
    }

    @Override
    public void update(Graphics g)
    {
        getServerMsgs();
        if(ServerMsg != null)
        {
            g2d.setColor(Color.BLACK);
            g2d.fillRect(0, 0, 500, 18);
            g2d.setColor(Color.red);
            g2d.drawString(ServerMsg, 5, 15);
        }

        paint(g);
    }

    @Override
    public void paint(Graphics g)
    {
        g.drawImage(backBuffer, 0, 0, this);
    }

    private void getServerMsgs()
    {
        String line;
        try
        {
            out.println("get");
            ServerMsg = in.readLine();

        }catch(IOException e) { System.out.println(e); }
    }

    private void makeContact()
    {
        try
        {
            sock = new Socket(HOST, PORT);
            in  = new BufferedReader( new InputStreamReader( sock.getInputStream() ) );
            out = new PrintWriter( sock.getOutputStream(), true );  // autoflush

        }catch(Exception e) {  System.out.println(e);  }
    }  // end of makeContact()

    private void closeLink()
    {
        try
        {
            out.println("bye");    // tell server that client is disconnecting
            sock.close();
        }
        catch(Exception e) {  System.out.println( e );  }
    }
}
