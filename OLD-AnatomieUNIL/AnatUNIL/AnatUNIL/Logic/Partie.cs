using System;
using System.Collections.Generic;

namespace Logic
{
	public class Partie
	{
		private string _membre;
		private int _note;
		private List<string> listQuestions;
		private List<string> listHisAnswer;
		private List<string> listAnswer;

		public Partie(string membre)
		{
			_membre = membre;
			listQuestions = new List<string>();
			listHisAnswer = new List<string>();
			listAnswer = new List<string>();
		}

		public string addListQuestions { set { listQuestions.Add(value); } }
		public string addListHisAnswer { set { listHisAnswer.Add(value); } }
		public string addListAnswer { set { listAnswer.Add(value); } }
		public int addNote { set { _note = value; } get { return _note;} }

		public List<string> getListQuestions { get { return listQuestions; } }
		public List<string> getListHisAnswer { get { return listHisAnswer; } }
		public List<string> getListAnswer { get { return listAnswer; } }
		public string getMembre { get { return _membre; } }
		public int getNote { get { return _note; } }
	}
}
