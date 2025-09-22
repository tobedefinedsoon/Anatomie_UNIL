// WARNING
//
// This file has been generated automatically by Visual Studio from the outlets and
// actions declared in your storyboard file.
// Manual changes to this file will not be maintained.
//
using Foundation;
using System;
using System.CodeDom.Compiler;
using UIKit;

namespace AnatUNIL
{
    [Register ("QuestionController")]
    partial class QuestionController
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton Answer1 { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton Answer2 { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton Answer3 { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton Answer4 { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIProgressView ProgressBar { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel QuestionField { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel QuestionToDoField { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel Title { get; set; }

        [Action ("Answer1Click:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void Answer1Click (UIKit.UIButton sender);

        [Action ("Answer2Click:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void Answer2Click (UIKit.UIButton sender);

        [Action ("Answer3Click:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void Answer3Click (UIKit.UIButton sender);

        [Action ("Answer4Click:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void Answer4Click (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (Answer1 != null) {
                Answer1.Dispose ();
                Answer1 = null;
            }

            if (Answer2 != null) {
                Answer2.Dispose ();
                Answer2 = null;
            }

            if (Answer3 != null) {
                Answer3.Dispose ();
                Answer3 = null;
            }

            if (Answer4 != null) {
                Answer4.Dispose ();
                Answer4 = null;
            }

            if (ProgressBar != null) {
                ProgressBar.Dispose ();
                ProgressBar = null;
            }

            if (QuestionField != null) {
                QuestionField.Dispose ();
                QuestionField = null;
            }

            if (QuestionToDoField != null) {
                QuestionToDoField.Dispose ();
                QuestionToDoField = null;
            }

            if (Title != null) {
                Title.Dispose ();
                Title = null;
            }
        }
    }
}