using Anatomie_UNIL;
using AnatomieUNILWindows.Logic;
using System;
using Windows.UI;
using Windows.UI.Core;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace AnatomieUNILWindows
{
	/// <summary>
	/// An empty page that can be used on its own or navigated to within a Frame.
	/// </summary>
	public sealed partial class QuestionPage : Page
	{
		Partie Partie = null;
		WriteTo WriteTo = new WriteTo();
		Question Question = null;
		DispatcherTimer Timer = new DispatcherTimer();
		int nbTry = 0;
		private Brush lightColor;


		public QuestionPage()
		{
			this.InitializeComponent();
			SystemNavigationManager.GetForCurrentView().BackRequested += QuestionPage_BackRequested; ;
			SystemNavigationManager.GetForCurrentView().AppViewBackButtonVisibility = AppViewBackButtonVisibility.Visible;
			Timer.Interval = new TimeSpan(0, 0, 1);
			Timer.Tick += Timer_Tick;
			lightColor = B1.Background;
		}

		private void Timer_Tick(object sender, object e)
		{
			Timer.Stop();
			SetQuestion();
		}

		protected override void OnNavigatedTo(NavigationEventArgs e)
		{
			Partie = e.Parameter as Partie;
			Question = new Question(Partie.getMembre);
			SetQuestion();
		}

		private void SetQuestion()
		{
			nbTry = 0;
			B1.Background = lightColor;
			B2.Background = lightColor;
			B3.Background = lightColor;
			B4.Background = lightColor;
			Question.getQuestion(Partie.getListQuestions);
			Partie.addListQuestions = Question.MyQuestion;
			Partie.addListAnswer = Question.Answer;
			Question.NbQuestionDone++;
		}

		private void QuestionPage_BackRequested(object sender, BackRequestedEventArgs e)
		{
			Frame rootFrame = Window.Current.Content as Frame;
			if (rootFrame == null)
				return;
			if (rootFrame.CanGoBack && e.Handled == false)
			{
				e.Handled = true;
				rootFrame.Navigate(typeof(MainPage));
			}
		}

		private void Button_Click(object sender, RoutedEventArgs e)
		{
			Button b = sender as Button;
			if (nbTry == 0)
				Partie.addListHisAnswer = b.Content.ToString();

			if (b.Content.ToString() != Question.Answer)
			{
				b.Background = new SolidColorBrush(Colors.Red);
				if (nbTry == 0)
				{
					WriteTo.nbQuestionDone++;
					Question.NbQuestionFalse++;
					WriteTo.nbQuestionFalse++;
				}
			}
			else
			{
				b.Background = new SolidColorBrush(Colors.Green);
				if (nbTry == 0)
				{
					WriteTo.nbQuestionDone++;
					Question.NbQuestionRight++;
					WriteTo.nbQuestionRight++;
				}
				CorrectAnswer();
			}
			nbTry++;
		}

		private void CorrectAnswer()
		{
			ComputeNote();
			if (Question.NbQuestionDone < WriteTo.nbQuestionToDo || WriteTo.nbQuestionToDo == 0)
			{
				Timer.Start();
				return;
			}
			if (WriteTo.displayResults)
				Frame.Navigate(typeof(ResultPage), Partie);//Navigate
			else
				Frame.Navigate(typeof(MainPage));
		}

		private void ComputeNote()
		{
			float percent = (float)Question.NbQuestionRight / (float)Question.NbQuestionDone * 100;
			Partie.Note = (int)percent;
		}
	}
}
