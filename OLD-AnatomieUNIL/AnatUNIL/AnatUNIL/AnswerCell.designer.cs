// WARNING
//
// This file has been generated automatically by Visual Studio from the outlets and
// actions declared in your storyboard file.
// Manual changes to this file will not be maintained.
//
using Foundation;
using System;
using System.CodeDom.Compiler;

namespace AnatUNIL
{
    [Register ("AnswerCell")]
    partial class AnswerCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton CorrectOrNot { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel MuscleName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel Number { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (CorrectOrNot != null) {
                CorrectOrNot.Dispose ();
                CorrectOrNot = null;
            }

            if (MuscleName != null) {
                MuscleName.Dispose ();
                MuscleName = null;
            }

            if (Number != null) {
                Number.Dispose ();
                Number = null;
            }
        }
    }
}