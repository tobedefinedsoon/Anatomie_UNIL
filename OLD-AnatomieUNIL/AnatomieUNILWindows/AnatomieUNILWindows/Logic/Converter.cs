using Anatomie_UNIL;
using System;
using Windows.UI;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Media;

namespace AnatomieUNILWindows.Logic
{
	public class QuestionDoneConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, string language)
		{
			WriteTo s = new WriteTo();
			int tmp = (int)value;
			if (s.nbQuestionToDo != 0)
				return tmp + " sur " + s.nbQuestionToDo;
			else
				return "Sans fin";
		}

		public object ConvertBack(object value, Type targetType, object parameter, string language)
		{
			throw new NotImplementedException();
		}
	}

	public class QuestionJusteConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, string language)
		{
			int a = (int)value;
			if (a == 0)
				return string.Empty;
			if (a == 1)
				return a + " correcte";
			else
				return a + " correctes";
		}

		public object ConvertBack(object value, Type targetType, object parameter, string language)
		{
			throw new NotImplementedException();
		}
	}

	public class QuestionFauxConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, string language)
		{
			int a = (int)value;
			if (a == 0)
				return string.Empty;
			if (a == 1)
				return a + " fausse";
			else
				return a + " fausses";
		}

		public object ConvertBack(object value, Type targetType, object parameter, string language)
		{
			throw new NotImplementedException();
		}
	}

	public class QuestionNoteConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, string language)
		{
			int note = (int)value;
			if (note == 0)
				return string.Empty;

			return note + "%";
		}

		public object ConvertBack(object value, Type targetType, object parameter, string language)
		{
			throw new NotImplementedException();
		}
	}

	public class QuestionConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, string language)
		{
			string s = (string)value;
			try
			{
				string st = s.Split(new [] { "muscles ", "muscle " }, StringSplitOptions.RemoveEmptyEntries)[1];
				string a = st[0].ToString().ToUpperInvariant();
				st.Remove(0, 1);
				st.Insert(0, a);
				return st;
			}
			catch(Exception e)
			{

			}
			return "Erreur système";
		}

		public object ConvertBack(object value, Type targetType, object parameter, string language)
		{
			throw new NotImplementedException();
		}
	}

	public class QuestionCorrectConverter : IValueConverter
	{
		public object Convert(object value, Type targetType, object parameter, string language)
		{
			bool b = (bool)value;
			if (b == true)
				return new SolidColorBrush(Colors.Green);
			return new SolidColorBrush(Colors.Red);
		}

		public object ConvertBack(object value, Type targetType, object parameter, string language)
		{
			throw new NotImplementedException();
		}
	}
}
