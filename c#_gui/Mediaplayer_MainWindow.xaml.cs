using System;
using System.Collections.Generic;
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
using System.IO;
using Microsoft.Win32;

namespace WpfMedia
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        MediaLista mediaLista;
        public MainWindow()
        {
            InitializeComponent();

                MediaPlayer.LoadedBehavior =MediaState.Manual;
            mediaLista = new MediaLista();
            ListBoxMediaList.DataContext = mediaLista;

            
        }

        private void ButtonOpen_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Multiselect = true;
            if (dialog.ShowDialog()==true)
            {

                /*   for (int i = 0; i < dialog.FileNames.Length; i++)
                   {
                       ListBoxMediaList.Items.Add(dialog.FileNames[i]);

                   }
                */

                if (dialog.FileNames.Length>0)
                {
                    mediaLista.SetMediaLista(dialog.FileNames, '\\');
                    ListBoxMediaList.SelectedIndex = 0;
                }
               

            }
        }

        private void ButtonPlay_Click(object sender, RoutedEventArgs e)
        {
            MediaPlayer.Play();
        }

        private void ButtonPause_Click(object sender, RoutedEventArgs e)
        {
            MediaPlayer.Pause();
        }

        private void ButtonStop_Click(object sender, RoutedEventArgs e)
        {
            MediaPlayer.Stop();
        }

        private void ListBoxMediaList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            MediaElem elem = (MediaElem)ListBoxMediaList.SelectedItem;
            MediaPlayer.Source = new Uri(elem.TeljesUtvonal);
           // this.Title = elem.TeljesUtvonal;
        }
    }
}
