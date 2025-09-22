using System.ComponentModel;
using System;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;
using Windows.ApplicationModel.Email;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace AnatomieUNILWindows
{
	/// <summary>
	/// An empty page that can be used on its own or navigated to within a Frame.
	/// </summary>
	public sealed partial class Contact : Page
    {
		Mailing Mailing = new Mailing();
        public Contact()
        {
            this.InitializeComponent();
        }

		protected override void OnNavigatedTo(NavigationEventArgs e)
		{
			Mailing = e.Parameter as Mailing;
			if (Mailing == null)
				Mailing = new Mailing();
		}

		private async void Envoyer(object sender, RoutedEventArgs e)
		{
			if (Mailing.Name == string.Empty || Mailing.Name.Length < 5)
			{
				ContentDialog d = new ContentDialog()
				{
					Title = "Erreur de champs",
					Content = "Veuillez entrer un nom (Min. 5 caractères)",
					PrimaryButtonText = "Ok"
				};
				await d.ShowAsync();
				return;
			}
			if (Mailing.Body == string.Empty || Mailing.Body.Length < 10)
			{
				ContentDialog d = new ContentDialog()
				{
					Title = "Erreur de champs",
					PrimaryButtonText = "Ok",
					Content = "Veuillez entrer un message (Min. 10 caractères)",
				};
				await d.ShowAsync();
				return;
			}

			var emailMessage = new EmailMessage();
			emailMessage.Subject = "[Anatomie UNIL] : remarque de " + Mailing.Name;
			emailMessage.Body = Mailing.Body;
			emailMessage.To.Add(new EmailRecipient("glaglasven@live.com"));
			emailMessage.Importance = EmailImportance.High;
			await EmailManager.ShowComposeNewEmailAsync(emailMessage);
			Frame.Navigate(typeof(MainPage));
		}
		private async void Annuler(object sender, RoutedEventArgs e)
		{
			ContentDialog dialog = new ContentDialog()
			{
				Title = "Annuler?",
				Content = "Etes-vous sûr de vouloir annuler?",
				PrimaryButtonText = "Oui, annuler",
				SecondaryButtonText = "Non, continuer"
			};
			ContentDialogResult result = await dialog.ShowAsync();
			if (result == ContentDialogResult.Primary)
				Frame.Navigate(typeof(MainPage));
		}
	}

	public class Mailing : INotifyPropertyChanged
	{
		public event PropertyChangedEventHandler PropertyChanged;
		private string name = string.Empty;
		public string Name
		{
			get { return name; }
			set { name = value; PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(Name))); }
		}
		private string body = string.Empty;
		public string Body
		{
			get { return body; }
			set { body = value; PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(Body))); }
		}

		public Mailing()
		{

		}
	}
}
