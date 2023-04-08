namespace Versions {
    [GtkTemplate (ui = "/com/github/CactiChameleon9/Versions/window.ui")]
    public class Window : Adw.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Label label;

        public Window (Gtk.Application app) {
            Object (application: app);
        }
    }
}
