using Foundation;
using System;
using UIKit;
using Logic;

namespace AnatUNIL
{
	public partial class ChoiceController : UIViewController
	{
		partial void SliderChanged(UISlider sender)
		{
			NbLabel.Text = Convert.ToInt32(NbSlider.Value).ToString();
		}

		public Settings settings;
		public string Type;

		public ChoiceController(IntPtr handle) : base(handle)
		{
		}

		public override void PrepareForSegue(UIStoryboardSegue segue, NSObject sender)
		{
			base.PrepareForSegue(segue, sender);

			var questionView = segue.DestinationViewController as QuestionController;
			settings.nbQuestionToDo = (int)NbSlider.Value;
			settings.isInsertion = ToggleOrigine.On;
			settings.isTerminaison = ToggleTerminaison.On;
			settings.isInnevervation = ToggleInnervation.On;
			if (questionView != null)
			{
				questionView.ViewTitle = Type;
				questionView.settings = this.settings;

			}
		}
	}
}