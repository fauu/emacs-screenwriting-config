# emacs-screenwriting-config

My Emacs config for screenwriting.

![screenshot](screenshots/1.png)

Used packages: ``evil``, ``fountain-mode``, ``olivetti``.

Other dependencies: ``Node.js``, ``npm``, ``Afterwriting CLI`` (pdf export).

Includes a modified version of ``Courier Prime`` font – ``Courier Prime Emacs``. The modification fixes display problems with original Courier Prime I experienced in Emacs.

## Instructions
1. Clone the repository.
2. Install ``Courier Prime Emacs``.
3. Install ``Afterwriting CLI``: ``npm install afterwriting -g``.
4. Create a home directory for screenplays.
5. Move ``.emacs`` to the new directory.
6. Edit ``launch.sh``:
    1. Set ``SCREENPLAYS_HOME`` to the path of your home directory for screenplays (which must contain the ``.emacs`` file).
7. Customize ``.emacs``.
8. Customize ``afterwriting-config.js``.
9. Launch Emacs using ``launch.sh``.

Fountain-mode and olivetti should launch automatically upon opening a ``.fountain`` file. Saving a modified ``.fountain`` file should trigger a generation of a ``.pdf`` file for the screenplay.