using Microsoft.UI.Xaml;
using System.Net.Http;

namespace WinUIApp
{
    public sealed partial class MainWindow : Window
    {
        public MainWindow()
        {
            this.InitializeComponent();
        }

        private async void OnCallApiClicked(object sender, RoutedEventArgs e)
        {
            try
            {
                using var http = new HttpClient();
                var text = await http.GetStringAsync("http://localhost:5000/hello");
                ResultText.Text = text;
            }
            catch (System.Exception ex)
            {
                ResultText.Text = "Error: " + ex.Message;
            }
        }
    }
}
