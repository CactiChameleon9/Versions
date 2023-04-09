namespace Versions {
    public class Application : Adw.Application {
        public Application () {
            Object (application_id: "com.github.CactiChameleon9.Versions", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("win.open", {"<Ctrl>o"});
            this.set_accels_for_action ("app.quit", {"<primary>q"});
        }

        public override void activate () {
            base.activate ();
            var win = this.active_window;
            if (win == null) {
                win = new Versions.Window (this);
            }
            win.present ();
        }

        private void on_about_action () {
            string[] developers = { "CactiChameleon9" };
            var about = new Adw.AboutWindow () {
                transient_for = this.active_window,
                application_name = "Versions",
                application_icon = "com.github.CactiChameleon9.Versions",
                developer_name = "CactiChameleon9",
                version = "0.1.0",
                developers = developers,
                copyright = "© 2023 CactiChameleon9",
            };

            about.present ();
        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }
    }
}
