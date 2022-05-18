using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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

namespace _14GE_2022_04_11_Notepad
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Megnyitas_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Filter = "szövegek (*.txt)|*.txt|csv fájl(*.csv)|*.csv|minden fájl(*.*)|*.*";
            if (dialog.ShowDialog() == true)
            {
                try
                {
                    textboxSzoveg.Text = File.ReadAllText(dialog.FileName, Encoding.Default);
                    this.Title = dialog.FileName;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                
            }
        }

        //Mentes_Maskent kód belseje ctrl + . első method + apply a xaml file-be is kell írni a Tag-be
        private void MentesMaskent_Click(object sender, RoutedEventArgs e)
        {
            Mentes_Maskent();
        }

        private void Mentes_Maskent()
        {
            SaveFileDialog dialog = new SaveFileDialog();
            dialog.Filter = "szövegek (*.txt)|*.txt|csv fájl(*.csv)|*.csv|minden fájl(*.*)|*.*";
            if (dialog.ShowDialog() == true)
            {
                try
                {
                    File.WriteAllText(dialog.FileName, textboxSzoveg.Text);
                    this.Title = dialog.FileName;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }

            }
        }

        private void Mentes_Click(object sender, RoutedEventArgs e)
        {
            if (this.Title=="Notepad")
            {
                Mentes_Maskent();
            } else
            {
                try
                {
                    File.WriteAllText(this.Title, textboxSzoveg.Text, Encoding.Default);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void Nevjegy_Click(object sender, RoutedEventArgs e)
        {
            Nevjegy nevjegy = new Nevjegy();
            nevjegy.ShowDialog();

        }

        private void Kilepes_Click(object sender, RoutedEventArgs e)
        {
            Environment.Exit(0);
        }

        // A létrehozott methodus funkciókat mindig be kell írni a xaml file-okba is pl.: <MenuItem Header="Kilépés" Click="Kilepes_Click"/>

    }
}
