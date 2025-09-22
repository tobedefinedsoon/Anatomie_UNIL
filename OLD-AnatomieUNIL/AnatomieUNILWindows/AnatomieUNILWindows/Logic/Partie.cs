using System.Collections.Generic;
using System.ComponentModel;

namespace Anatomie_UNIL
{
	public class Partie :INotifyPropertyChanged
    {
		/// <summary>
		/// 1 = memb sup
		/// 2 = memb inf
		/// 3 = tronc
		/// 4 = tout
		/// </summary>
        private int _membre;
        private int _note;
		public int Note//in percent
		{
			get { return _note; }
			set { _note = value; PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(Note))); }
		}
        private List<string> listQuestions;
        private List<string> listHisAnswer;
        private List<string> listAnswer;

        public Partie(int membre)
        {
            _membre = membre;
            listQuestions = new List<string>();
            listHisAnswer = new List<string>();
            listAnswer = new List<string>();
        }

        public string addListQuestions { set { listQuestions.Add(value); } }
        public string addListHisAnswer { set { listHisAnswer.Add(value); } }
        public string addListAnswer { set { listAnswer.Add(value); } }
        public int addNote { set { _note = value; } }

        public List<string> getListQuestions { get { return listQuestions; } }
        public List<string> getListHisAnswer { get { return listHisAnswer; } }
        public List<string> getListAnswer { get { return listAnswer; } }
        public int getMembre { get { return _membre; } }

		public event PropertyChangedEventHandler PropertyChanged;
	}
}
