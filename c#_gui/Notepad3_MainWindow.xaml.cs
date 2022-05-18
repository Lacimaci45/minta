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

namespace WpfNotepad
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

        private void megnyitas_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            if (dialog.ShowDialog()==true)
            {
                try
                {
                    var inputSzoveg = File.ReadAllText(dialog.FileName, Encoding.Default);
                    szoveg.Text = inputSzoveg;
                    this.Title = dialog.FileName;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                
            }
        }

        private void kilepes_Click(object sender, RoutedEventArgs e)
        {
            Environment.Exit(0);
        }

        private void Mentes_Click(object sender, RoutedEventArgs e)
        {
            SaveFileDialog dialog = new SaveFileDialog();
            if (dialog.ShowDialog()==true)
            {
                try
                {
                    File.WriteAllText(dialog.FileName, szoveg.Text,Encoding.Default);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);                   
                }
            }

        }
        private void About_Click(object sender,RoutedEventArgs e)
        {
            About aboutWin = new About();
            aboutWin.ShowDialog();
        }
    }
}
