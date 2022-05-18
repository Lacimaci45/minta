using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace atletikaVB
{
    class Program
    {
        static void Main(string[] args)
        {
            //2.
            List<Versenyzo> versenyzok = new List<Versenyzo>();

            try
            {
                var sorok = File.ReadAllLines("atletikaVB2017.csv", Encoding.Default);

                
                for (int i = 0; i < sorok.Length; i++)
                {
                    versenyzok.Add(new Versenyzo(sorok[i]));
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }

            Console.WriteLine($"A sorok száma:{versenyzok.Count}");
            Console.WriteLine($"--------------------------------");

            //3.
            var versenySzamDb = versenyzok.ToLookup(x=>x.Versenyszam).Count;
            Console.WriteLine($"Érmek száma: {versenyzok.Count} db, Versenyszámok:{versenySzamDb} db.");
            Console.WriteLine($"--------------------------------");

            //4.
            var amerika = versenyzok.FindAll(x => x.Nemzet == "Egyesült Államok");
            var usaArany = amerika.FindAll(x => x.Erem == 1).Count;
            Console.WriteLine($"Usa aranyak száma:{(double)usaArany/(double)amerika.Count*100:0.0} %-a arany.");
            Console.WriteLine($"--------------------------------");

            //5. és 6.

            //7.
            var csucsnok = versenyzok.FindAll(x => x.Nem == "N" && x.Csucs != "");

            try
            {
                FileStream fajl = new FileStream("noi_csucsok.txt", FileMode.Create);
                StreamWriter writer = new StreamWriter(fajl, Encoding.Default);
                foreach (var i in csucsnok)
                {
                    writer.WriteLine($"{i.Versenyzonev}{"\t"},{i.Versenyszam}{"\t"},{i.Nemzet}");
                }
                writer.Close();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.WriteLine($"--------------------------------");




            Console.ReadKey();
        }
    }
}
