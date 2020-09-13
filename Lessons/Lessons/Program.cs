using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lessons
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 4;
            int b = 6;

            Console.WriteLine("Initial a :" + a);
            Console.WriteLine("Initial b :" + b);

            b = a;

            Console.WriteLine("After b=a b is :" + b);

            a = 400;

            Console.WriteLine("Final a :" + a);
            Console.WriteLine("Final b :" + b);

            Console.WriteLine("-------------------------------------");

            List<int> list1 = new List<int>() { 1, 2, 3, 4, 5};
            List<int> list2;

            list2 = list1;

            Console.WriteLine(list1[2]);
            Console.WriteLine(list2[2]);

            list1.RemoveAt(list1[0]);

            Console.WriteLine(list1[2]);
            Console.WriteLine(list2[2]);


            Console.ReadLine();
        }
    }
}
