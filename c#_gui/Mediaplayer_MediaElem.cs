using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfMedia
{
   public class MediaElem
    {

        public string TeljesUtvonal { get; set; }
        public string FajlNev { get; set; }

        public MediaElem(string teljesutvonal, char elvalaszto)
        {

            TeljesUtvonal = teljesutvonal;

            var a = teljesutvonal.Split(elvalaszto);
            FajlNev = a.Last();



        }

    }
}
