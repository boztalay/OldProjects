/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ben
 */
public class helpwithclass
{
    public static void main(String[] args)
        throws java.io.IOException
        {
            char choice;
            HelpClass help = new HelpClass();

            for(;;)
            {
                do
                {
                    help.showmenu();
                    do
                    {
                        choice = (char) System.in.read();
                    } while(choice =='\n' | choice == '\r');
                } while(!help.isvalid(choice));

                if(choice == 'q') break;

                System.out.println("\n");

                help.helpon(choice);
            }
        }
}
