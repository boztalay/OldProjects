/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ben
 */
public class HelpClass
{
    void helpon(int what)
    {
        switch(what)
        {
            case '1':
                System.out.println("The if:\n");
                System.out.println("if(condition) statement;");
                System.out.println("else statement\n");
                break;
            case '2':
                System.out.println("The switch:\n");
                System.out.println("switch(expression) {");
                System.out.println("    case costant:");
                System.out.println("        statement sequence");
                System.out.println("        break;");
                System.out.println("    // ...");
                System.out.println("}\n");
                break;
            case '3':
                System.out.println("The for:\n");
                System.out.println("for(init; condition; iteration) statement\n");
                break;
        }
    }

    void showmenu()
    {
        System.out.println("Help on:");
        System.out.println("    1. if");
        System.out.println("    2. switch");
        System.out.println("    3. for\n");
        System.out.print("Choose one (q to quit): ");
    }

    boolean isvalid(int ch)
    {
        if(ch < '1' | ch > '3' & ch != 'q') return false;
        else return true;
    }
}
