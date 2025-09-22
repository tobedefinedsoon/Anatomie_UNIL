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
    [Register ("ChoiceController")]
    partial class ChoiceController
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel NbLabel { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISlider NbSlider { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch ToggleInnervation { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch ToggleOrigine { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UISwitch ToggleTerminaison { get; set; }

        [Action ("SliderChanged:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void SliderChanged (UIKit.UISlider sender);

        void ReleaseDesignerOutlets ()
        {
            if (NbLabel != null) {
                NbLabel.Dispose ();
                NbLabel = null;
            }

            if (NbSlider != null) {
                NbSlider.Dispose ();
                NbSlider = null;
            }

            if (ToggleInnervation != null) {
                ToggleInnervation.Dispose ();
                ToggleInnervation = null;
            }

            if (ToggleOrigine != null) {
                ToggleOrigine.Dispose ();
                ToggleOrigine = null;
            }

            if (ToggleTerminaison != null) {
                ToggleTerminaison.Dispose ();
                ToggleTerminaison = null;
            }
        }
    }
}