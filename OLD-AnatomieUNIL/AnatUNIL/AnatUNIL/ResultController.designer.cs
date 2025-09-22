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
    [Register ("ResultController")]
    partial class ResultController
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView MyTableView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UINavigationItem NavBar { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel Note { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (MyTableView != null) {
                MyTableView.Dispose ();
                MyTableView = null;
            }

            if (NavBar != null) {
                NavBar.Dispose ();
                NavBar = null;
            }

            if (Note != null) {
                Note.Dispose ();
                Note = null;
            }
        }
    }
}