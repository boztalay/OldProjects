/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
 import java.io.*;
/**
 *
 * @author Ben
 */
public class thing
{
    public static void main(String[] args)
    {
        String input = ":D:D:D";
        char temp;
        int key = 0;

        System.out.println("Encryptor\n");

        System.out.print("Key: ");
        try
        {
            key = (int)System.in.read();
        }catch(IOException e) {}

        System.out.println(input);

        for(int i = 0; i < input.length(); i++)
        {
           temp = (char)(input.charAt(i)^key);
           System.out.print(temp);
        }
        System.out.println();
    }

}
