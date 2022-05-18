using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfAtletika
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        AtletikaVb atletikaVB;
        public MainWindow()
        {
            InitializeComponent();
            try
            {
                atletikaVB = new AtletikaVb("ferfiAtletika2017.txt", ';');
                //Debug.WriteLine($"Lista hossza:{atletikaVB.Versenyzok.Count}");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            comboErem.Items.Add(1);
            comboErem.Items.Add(2);
            comboErem.Items.Add(3);
            comboErem.SelectedIndex = 0;
            var versenySzamok = atletikaVB.Versenyzok.ToLookup(x => x.Versenyszam);
            foreach (var i in versenySzamok)
            {
                listboxVersenyszam.Items.Add(i.Key);
            }
            listboxVersenyszam.SelectedIndex = 0;

        }

        private void buttonAranyos_Click(object sender, RoutedEventArgs e)
        {
            var aranyosNemzetek = atletikaVB.Versenyzok.FindAll(x => x.Erem == 1);
            var stat = aranyosNemzetek.ToLookup(x => x.Nemzet);
            foreach (var i in stat)
            {
                listboxNemzetek.Items.Add(i.Key);
            }
            buttonAranyos.Visibility = Visibility.Hidden;
        }

        private void buttonKeres_Click(object sender, RoutedEventArgs e)
        {
                        
            var versenySzam = Convert.ToString(listboxVersenyszam.SelectedItem);
                        
            var erem = Convert.ToInt32(comboErem.SelectedItem);

            var versenyzo = atletikaVB.Versenyzok.Find(x=>x.Versenyszam==versenySzam && x.Erem==erem);
            if (versenyzo==null)
            {
                MessageBox.Show("Nincs ilyen versenyző!");
            } else
            {
                labelNev.Content = versenyzo.Versenyzonev;
                labelNemzet.Content = versenyzo.Nemzet;
                labelEredmeny.Content = versenyzo.Eredmeny;
            }
        }
    }
}
