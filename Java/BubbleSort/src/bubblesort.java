/*
 * @author Ben
 */

public class bubblesort
{
    public static void main(String[] args) 
    {
        int toSort[] = {32, 66, 777, 123, 5434, 11, 0, 874, 349, 51};
        int size = 10;
        int temp = 0;

        System.out.print("Original Array: ");
        for(int i = 0; i < size; i++)
        {
            System.out.print(toSort[i] + " ");
        }
        System.out.println();

        for(int i = 1; i < size; i++)
        {
            for(int j = (size - 1); j >= i; j--)
            {
                if(toSort[j - 1] > toSort[j])
                {
                    temp = toSort[j - 1];
                    toSort[j - 1] = toSort[j];
                    toSort[j] = temp;
                }
            }
        }

        System.out.print("Sorted Array: ");
        for(int i = 0; i < size; i++)
        {
            System.out.print(toSort[i] + " ");
        }
        System.out.println();

    }

}
