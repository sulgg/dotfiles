--Guardar este script con extension .app dentro de MacOS Script Editor
--Este script abre un archivo en Preview y luego maximiza la ventana
on open theFiles
    repeat with theFile in theFiles
        tell application "Preview"
            activate
            open theFile
            set bounds of window 1 to {0, 22, 1440, 900}
        end tell
    end repeat
end open
