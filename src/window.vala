namespace Versions {
    [GtkTemplate (ui = "/com/github/CactiChameleon9/Versions/window.ui")]
    public class Window : Adw.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Label label;

        [GtkChild]
        private unowned Gtk.Button open_button;

        public Window (Gtk.Application app) {
            Object (application: app);
        }

        construct {
            var open_action = new SimpleAction("open", null);
            open_action.activate.connect(this.open_folder_dialog);
            this.add_action(open_action);
        }

        private void open_folder_dialog() {

            var folder_chooser = new Gtk.FileChooserNative("Open Folder", null,
                                                           Gtk.FileChooserAction.SELECT_FOLDER,
                                                           "_Open", "_Cancel");

            folder_chooser.response.connect ((dialog, response) => {
                if (response == Gtk.ResponseType.ACCEPT) {
                    this.open_folder(folder_chooser.get_file());
                }

                folder_chooser = null;
            });

            folder_chooser.show();
        }

        private void open_folder(File folder) {
            string folder_path = folder.get_path();
            int git_status;

            Process.spawn_command_line_sync("git -C %s rev-parse".printf(folder_path), null, null, out git_status);

            if (git_status == 0) {
                this.label.label = "%s is a valid git repo".printf(folder_path);
            } else {
                this.label.label = "%s is invalid".printf(folder_path);
            }
        }
    }
}
