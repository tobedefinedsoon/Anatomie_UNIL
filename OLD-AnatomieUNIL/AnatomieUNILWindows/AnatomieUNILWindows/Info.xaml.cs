using Windows.UI.Core;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace AnatomieUNILWindows
{
	/// <summary>
	/// An empty page that can be used on its own or navigated to within a Frame.
	/// </summary>
	public sealed partial class Info : Page
	{
		public Info()
		{
			this.InitializeComponent();
			SystemNavigationManager.GetForCurrentView().BackRequested += Inferieur_BackRequested;
			SystemNavigationManager.GetForCurrentView().AppViewBackButtonVisibility = AppViewBackButtonVisibility.Visible;
		}

		private void Inferieur_BackRequested(object sender, BackRequestedEventArgs e)
		{
			Frame rootFrame = Window.Current.Content as Frame;
			if (rootFrame == null)
				return;
			if (rootFrame.CanGoBack && e.Handled == false)
			{
				e.Handled = true;
				rootFrame.GoBack();
			}
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			Frame.Navigate(typeof(Contact));
		}
	}
}
