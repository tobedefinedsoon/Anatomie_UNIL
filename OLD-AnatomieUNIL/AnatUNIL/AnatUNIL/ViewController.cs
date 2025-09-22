using System;
using System.Collections.Generic;
using Foundation;
using Logic;
using UIKit;

namespace AnatUNIL
{
	public partial class ViewController : UIViewController
	{
		Settings settings;
		protected ViewController(IntPtr handle) : base(handle)
		{
		}

		public override void PrepareForSegue(UIStoryboardSegue segue, NSObject sender)
		{
			base.PrepareForSegue(segue, sender);

			var questionView = segue.DestinationViewController as ChoiceController;

			if (questionView != null)
			{
				questionView.Type = (sender as UIButton).Title(UIControlState.Normal).ToString();
				questionView.settings = this.settings;
			}
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			// Perform any additional setup after loading the view, typically from a nib
			settings = new Settings();
		}
		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
			// Release any cached data, images, etc that aren't in use.
		}
	}
}
