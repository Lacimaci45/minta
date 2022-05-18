using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfMedia
{
  public  class MediaLista
    {

        public  ObservableCollection<MediaElem>Mediaelemek { get; set; }


        public  MediaLista()
        {
            Mediaelemek = new ObservableCollection<MediaElem>();
        }

        public void SetMediaLista(string[] fajlok, char elvalaszto)
        {
            foreach (var i in fajlok)
            {
                Mediaelemek.Add(new MediaElem(i, elvalaszto));

            }
        }
    
    

    }
}
