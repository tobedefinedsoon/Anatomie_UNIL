using System;

namespace Logic
{
	public class Settings
	{
		private int questionToDo;
		private int totalQuestionDone;
		private int totalQuestionRight;
		private int totalQuestionFalse;
		private bool displayBoolResults;
		private bool? insertionChecked;
		private bool? terminaisonChecked;
		private bool? innervationChecked;
		private bool? mouvementChecked;
		public int test;
		private int viewCount;

		public int nbQuestionToDo
		{
			get { return questionToDo; }
			set { questionToDo = value; WriteSettings(); }
		}

		public int nbQuestionDone
		{
			get { return totalQuestionDone; }
			set { totalQuestionDone = value; WriteSettings(); }
		}
		public int nbQuestionRight
		{
			get { return totalQuestionRight; }
			set { totalQuestionRight = value; WriteSettings(); }
		}
		public int nbQuestionFalse
		{
			get { return totalQuestionFalse; }
			set { totalQuestionFalse = value; WriteSettings(); }
		}
		public bool displayResults
		{
			get { return displayBoolResults; }
			set { displayBoolResults = value; WriteSettings(); }
		}

		public int getViewCount()
		{
			return viewCount;
		}

		public void addViewCount()
		{
			viewCount++;
			WriteSettings();
		}

		public bool? isInsertion
		{
			get { return insertionChecked; }
			set { insertionChecked = value; WriteSettings(); }
		}

		public bool? isTerminaison
		{
			get { return terminaisonChecked; }
			set { terminaisonChecked = value; WriteSettings(); }
		}

		public bool? isInnevervation
		{
			get { return innervationChecked; }
			set { innervationChecked = value; WriteSettings(); }
		}

		public bool? isMouvement
		{
			get { return mouvementChecked; }
			set { mouvementChecked = value; WriteSettings(); }
		}

		private void ReadSettings()
		{
			questionToDo = 20;
		}

		void WriteSettings()
		{
		}

		/// <summary>
		/// Initializes a new instance of the <see cref="T:AnatUNIL.Settings"/> class.
		/// </summary>
		public Settings()
		{
			ReadSettings();
		}
	}
}