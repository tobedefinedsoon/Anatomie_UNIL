using Anatomie_UNIL;
using System.Numerics;
using Windows.UI.Composition;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Hosting;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=402352&clcid=0x409

namespace AnatomieUNILWindows
{
	/// <summary>
	/// An empty page that can be used on its own or navigated to within a Frame.
	/// </summary>
	public sealed partial class MainPage : Page
    {
        Compositor _compositor;
        SpriteVisual _hostSprite;
		Partie Partie = new Partie(0);
		WriteTo WriteTo = new WriteTo();

        public MainPage()
        {
            this.InitializeComponent();
            _compositor = ElementCompositionPreview.GetElementVisual(this).Compositor;
        }

		private void Settings_Click(object sender, RoutedEventArgs e)
		{
			Frame.Navigate(typeof(Settings));
		}

		private void Info_Click(object sender, RoutedEventArgs e)
		{
			Frame.Navigate(typeof(Info));
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			int type = 0;
			switch((sender as Button).Content.ToString())
			{
				case "Membre supérieur":
					type = 1;
					break;
				case "Membre inférieur":
					type = 2;
					break;
				case "Tronc":
					type = 3;
					break;
				case "Tout":
					type = 4;
					break;
				default:
					break;
			}
			Partie = new Partie(type);
			Frame.Navigate(typeof(QuestionPage), Partie);
		}

		private void CheckBox_Checked(object sender, RoutedEventArgs e)
		{
			switch((sender as CheckBox).Content.ToString())
			{
				case "Origine":
					WriteTo.isInsertion = (sender as CheckBox).IsChecked;
					break;
				case "Terminaison":
					WriteTo.isTerminaison = (sender as CheckBox).IsChecked;
					break;
				case "Innervation":
					WriteTo.isInnevervation = (sender as CheckBox).IsChecked;
					break;
				case "Vascularisation (BETA)":
					WriteTo.isMouvement = (sender as CheckBox).IsChecked;
					break;
			}
		}

		/*---------------------------------------------------------*/
		private void Page_Loaded(object sender, RoutedEventArgs e)
		{
			return;
			_hostSprite = _compositor.CreateSpriteVisual();
			_hostSprite.Size = new Vector2((float)MainGrid.ActualWidth, (float)MainGrid.ActualHeight);

			ElementCompositionPreview.SetElementChildVisual(
				MainGrid, _hostSprite);
			//_hostSprite.Brush = _compositor.CreateHostBackdropBrush();
		}

		private void Size_Changed(object sender, SizeChangedEventArgs e)
		{
			return;
			if (_hostSprite != null)
				_hostSprite.Size = e.NewSize.ToVector2();
		}
	}
}
