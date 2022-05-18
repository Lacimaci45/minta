using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace atletikaVB
{
    public class Versenyzo
    {
        //prop+TabTab
        public string Versenyszam { get; set; }
        public string Nem { get; set; }
        public string Nemzet { get; set; }

        public string Versenyzonev { get; set; }
        public string Eredmeny { get; set; }
        public string Csucs { get; set; }
        public int Erem { get; set; }

        //ctor+TabTab
        public Versenyzo(string sor)
        {
            var adatok = sor.Split(';');
            Versenyszam = adatok[0];
            Nem = adatok[1];
            Nemzet = adatok[2];
            Versenyzonev = adatok[3];
            Eredmeny = adatok[4];
            Csucs = adatok[5];
            Erem = Convert.ToInt32(adatok[6]);
        }
     
    }
}
