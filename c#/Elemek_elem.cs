using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// 14GE_elemek jobb klick--> add--> class--> osztály létrehozása
namespace _14GE_elemek
{
    class Elem
    {
        //prop+tabtab --> properties létrehozása
        public string Ev { get; set; }
        public string Nev { get; set; }
        public string Vegyjel { get; set; }
        public int Rendszam { get; set; }
        public string Felfedezo { get; set; }

        //ctor+tabtab --> constructor létrehozása + deklarásá string sor
        public Elem(string sor)
        {
            var adatok = sor.Split(';');
            Ev = adatok[0];
            Nev = adatok[1];
            Vegyjel = adatok[2];
            Rendszam = Convert.ToInt32(adatok[3]);
            Felfedezo = adatok[4];
        }
    }
}
