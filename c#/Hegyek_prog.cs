using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hegyek
{
    //Minta vizsgafeladat
    class Program
    {
        static void Main(string[] args)
        {
            //A txt file beimportálása C# Hegyek jobb click --> add existing file, hegyek.txt + F4 copy always-re állítani


            //List létrehozása
            List<Hegycsucs> hegycsucsok = new List<Hegycsucs>();
            

            //try-catch létrehozása --> try + TabTab
            try
            {
                var sorok = File.ReadAllLines("hegyek.txt",Encoding.Default);

                //hány db hegy található a txt filbe?
                //for ciklus létrehozása --> for+TabTab
                for (int i = 0; i < sorok.Length; i++)
                {
                    hegycsucsok.Add(new Hegycsucs(sorok[i]));
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
            }


            // cw + TabTab kiíratás gyors billentyű
            Console.WriteLine($"A fájl sorainak száma:{ hegycsucsok.Count}");

            Console.WriteLine("-------------");


            //átlagmagasság listázása
            var atlagMagassag = hegycsucsok.Average(x => x.Magassag);

            Console.WriteLine($"A hegycsúcsok átlag magassága:{atlagMagassag:0.0}");

            Console.WriteLine("-------------");


            //legmagasabb hegy adatainak listázása
            var legMagasabb = hegycsucsok.Find(x => x.Magassag == hegycsucsok.Max(y => y.Magassag));

            Console.WriteLine($"A legmagasabb hegycsúcs:{legMagasabb.HegycsucsNeve},{legMagasabb.Magassag}");

            Console.WriteLine("-------------");


            //egy adott hegy adatainak bekérése, hogy nagyobb vagy kisebb a megadottnál
            var beMagassag = Convert.ToInt32(Console.ReadLine());

            var vanEMagasabb = hegycsucsok.FindAll(x => x.Hegyseg == "Börzsöny" && x.Magassag > beMagassag);

            if (vanEMagasabb.Count > 0)
            {
                Console.WriteLine($"A börzsönyben van {beMagassag} m-nél magasabb csúcs!");
            }
            else 
            {
                Console.WriteLine($"A börzsönyben nincs {beMagassag} m-nél magasabb csúcs!");
            }

            Console.WriteLine("-------------");

            if (hegycsucsok.Any(x=>x.Hegyseg=="Börzsöny" && x.Magassag>beMagassag)) 
            {
                Console.WriteLine($"A börzsönyben van {beMagassag} m-nél magasabb csúcs!");
            }
            else 
            {
                Console.WriteLine($"A börzsönyben nincs {beMagassag} m-nél magasabb csúcs!");
            }

            Console.WriteLine("-------------");


            //x értéknél magasabb hegyek száma kilistázása
            var magasabb3000 = hegycsucsok.FindAll(x => x.Magassag * 3.28 > 3000).Count;

            Console.WriteLine($"3000 lábnál magasabb csúcsok száma:{magasabb3000}");

            Console.WriteLine("-------------");


            //hegycsúcsok számáról statisztika készítése
            var stat = hegycsucsok.ToLookup(x=>x.Hegyseg);

            foreach (var i in stat)
            {
                Console.WriteLine($"{i.Key} - {i.Count()} db átlagos magasság:{i.Average(x=>x.Magassag)} m");
            }

            Console.WriteLine("-------------");


            //kért adatok kiírása egy txt állományba, amit létre is kell hozni
            var bukkVidek = hegycsucsok.FindAll(x => x.Hegyseg.ToLower() == "Bükk-vidék".ToLower());

            try
            {
                FileStream fajl = new FileStream("bukk-videk.txt",FileMode.Create);
                StreamWriter writer = new StreamWriter(fajl, Encoding.UTF8);
                foreach (var i in bukkVidek)
                {
                    writer.WriteLine($"{i.HegycsucsNeve};{i.Hegyseg};{i.Magassag}");
                }
                writer.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.WriteLine("-------------");


            Console.ReadKey();
        }
    }
}
