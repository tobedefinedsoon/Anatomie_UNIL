using System;
using System.Collections.Generic;
using static Logic.Data;
namespace Logic
{
	public class Question
	{
		/// <summary>
		/// list of question and possibilities> 
		/// </summary>
		private string[] myQuestion;

		/// <summary>
		/// enum the member
		/// </summary>
		private int _membre = 1;

		/// <summary>
		/// Obvious
		/// </summary>
		private Random rand;

		/// <summary>
		/// Write to the settings
		/// </summary>
		public Settings settings;

		/// <summary>
		/// The iteration.
		/// </summary>
		private const int iteration = 10;

		/// <summary>
		/// Initializes a new instance of the <see cref="T:AnatUNIL.Question"/> class.
		/// </summary>
		/// <param name="membre">Membre.</param>
		public Question(int membre)
		{
			_membre = membre;
			rand = new Random();
			myQuestion = new string[5];
		}

		/// <summary>
		/// Gets the question.
		/// </summary>
		/// <returns>The question.</returns>
		/// <param name="listQuestion">List question.</param>
		public string[] getQuestion(List<string> listQuestion)
		{
			switch (_membre)
			{
				case 1:
				case 2:
				case 3:
					return SetQuestion(SetQuestionType(), listQuestion);
				case 4: 
					return CaseAll(listQuestion);
			}
			return null;
		}

		/// <summary>
		/// Sets the question.
		/// </summary>
		/// <returns>The question.</returns>
		/// <param name="questionType">Question type.</param>
		/// <param name="list">List.</param>
		private string[] SetQuestion(int questionType, List<string> list)
		{
			myQuestion = GenQuestion(questionType, list);
			int i = 0;
			while (list.Contains(myQuestion[0]) && i++ < 50)
				myQuestion = GenQuestion(questionType, list);
			return myQuestion;
		}

		/// <summary>
		/// Gens the question.
		/// </summary>
		/// <returns>The question.</returns>
		/// <param name="questionType">Question type.</param>
		/// <param name="list">List.</param>
		private string[] GenQuestion(int questionType, List<string> list)
		{
			switch (_membre)
			{
				case 1: return GenQuestionSup(questionType, list);
				case 2: return GenQuestionInf(questionType, list);
				case 3: return GenQuestionTrc(questionType, list);
				default: return GenQuestionSup(questionType, list);
			}
		}

		/// <summary>
		/// Gens the question for superior member.
		/// </summary>
		/// <returns>The question sup.</returns>
		/// <param name="questionType">Question type.</param>
		/// <param name="list">List.</param>
		string[] GenQuestionSup(int questionType, List<string> list)
		{
			switch (Random(1, 6))
			{
				case 1: return GenEpauleAnt(questionType, list);
				case 2: return GenEpaulePost(questionType, list);
				case 3: return GenBras(questionType, list);
				case 4: return GenAvantBrasAnt(questionType, list);
				case 5: return GenAvantBrasPost(questionType, list);
				case 6: return GenMain(questionType, list);
				default: return GenEpauleAnt(questionType, list);
			}
		}

		string[] GenEpauleAnt(int questionType, List<string> list)
		{
			int length = 5;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];

			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, epauleAnterieur[answerNb, 0]);
				if (list.Contains(question[0]) == false)
					break;
			}

			question[1] = epauleAnterieur[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = epauleAnterieur[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = epauleAnterieur[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = epauleAnterieur[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenEpaulePost(int questionType, List<string> liste)
		{

			int length = 11;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, epaulePosterieur[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = epaulePosterieur[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = epaulePosterieur[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = epaulePosterieur[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = epaulePosterieur[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenBras(int questionType, List<string> liste)
		{

			int length = 8;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, bras[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = bras[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = bras[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = bras[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = bras[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenAvantBrasAnt(int questionType, List<string> liste)
		{

			int length = 8;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, avantBrasAntérieur[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = avantBrasAntérieur[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = avantBrasAntérieur[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = avantBrasAntérieur[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = avantBrasAntérieur[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenAvantBrasPost(int questionType, List<string> liste)
		{

			int length = 8;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, avantBrasPostérieur[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = avantBrasPostérieur[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = avantBrasPostérieur[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = avantBrasPostérieur[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = avantBrasPostérieur[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenMain(int questionType, List<string> liste)
		{

			int length = 8;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, main[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = main[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = main[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = main[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = main[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenQuestionInf(int questionType, List<string> liste)
		{
			switch (Random(1, 4))
			{
				case 1: return GenHanche(questionType, liste);
				case 2: return GenCuisse(questionType, liste);
				case 3: return GenJambe(questionType, liste);
				case 4: return GenPied(questionType, liste);
				default: return GenHanche(questionType, liste);
			}
		}

		#region genInf
		private string[] GenHanche(int questionType, List<string> liste)
		{
			int length = 13;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, hanche[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = hanche[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = hanche[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = hanche[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = hanche[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}
		private string[] GenCuisse(int questionType, List<string> liste)
		{
			int length = 16;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, cuisse[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = cuisse[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = cuisse[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = cuisse[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = cuisse[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenJambe(int questionType, List<string> liste)
		{
			int length = 14;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, jambe[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = jambe[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = jambe[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = jambe[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = jambe[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenPied(int questionType, List<string> liste)
		{
			int length = 14;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, pied[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = pied[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = pied[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = pied[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = pied[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}
		#endregion

		private string[] GenQuestionTrc(int questionType, List<string> liste)
		{
			switch (Random(1, 3))
			{
				case 1: return GenNuque(questionType, liste);
				case 2: return GenDos(questionType, liste);
				case 3: return GenThorax(questionType, liste);
				default: return GenNuque(questionType, liste);
			}
		}

		#region genTrc
		private string[] GenNuque(int questionType, List<string> liste)
		{
			int length = 10;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, nuqueEtCou[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = nuqueEtCou[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = nuqueEtCou[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = nuqueEtCou[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = nuqueEtCou[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenDos(int questionType, List<string> liste)
		{
			int length = 19;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, dos[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = dos[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = dos[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = dos[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = dos[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}

		private string[] GenThorax(int questionType, List<string> liste)
		{
			int length = 9;
			int answerNb = Random(0, length - 1);
			string[] question = new string[5];
			for (int i = 0; i < iteration; i++)
			{
				question[0] = RequireQuestion(questionType, thoraxEtAbdomen[answerNb, 0]);
				if (liste.Contains(question[0]) == false)
					break;
			}

			question[1] = thoraxEtAbdomen[answerNb, questionType];

			for (int i = 0; i < iteration; i++)
			{
				question[2] = thoraxEtAbdomen[Random(0, length - 1), questionType];
				if (question[2] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[3] = thoraxEtAbdomen[Random(0, length - 1), questionType];
				if (question[3] != question[2] && question[3] != question[1])
					break;
			}

			for (int i = 0; i < iteration; i++)
			{
				question[4] = thoraxEtAbdomen[Random(0, length - 1), questionType];
				if (question[4] != question[3] && question[4] != question[2] && question[4] != question[1])
					break;
			}

			return question;
		}
		#endregion

		private string[] CaseAll(List<string> liste)
		{
			string[] tmp = new string[5];
			_membre = Random(1, 3);
			tmp = SetQuestion(SetQuestionType(), liste);// getQuestion(liste);
			_membre = 4;
			return tmp;
		}


		/// <summary>
		/// Sets the type of the question.
		/// </summary>
		/// <returns>The question type.</returns>
		private int SetQuestionType()
		{ 
			int type = 1;
			for (int i = 0; i < 10; i++)
			{
				type = Random(1, 3);
				if (type == 1 && settings.isInsertion == true)
				{	break;}
				if (type == 2 && settings.isTerminaison == true)
				{	break;}
				if (type == 3 && settings.isInnevervation == true)
				{	break;}
				if (type == 4 && settings.isMouvement == true)
				{	break;}
			}
			return type;
		}

		/// <summary>
		/// Requires the question.
		/// </summary>
		/// <returns>The question.</returns>
		/// <param name="type">Type.</param>
		/// <param name="muscle">Muscle.</param>
		private string RequireQuestion(int type, string muscle)
		{
			switch (type)
			{
				case 1: return "Quelle est l'origine du " + muscle + "?";
				case 2: return "Quelle est la terminaison du " + muscle + "?";
				case 3: return "Quelle est l'innervation du " + muscle + "?";
				case 4: return "Quelle est le mouvement du" + muscle + "?";
				default: return "Quelle est l'origine du " + muscle + "?";
			}
		}

		/// <summary>
		/// Random the specified _inf and _sup.
		/// </summary>
		/// <param name="_inf">Inf.</param>
		/// <param name="_sup">Sup.</param>
		private int Random(int _inf, int _sup)
		{
			return rand.Next(_inf, _sup + 1);
		}
	}
}
