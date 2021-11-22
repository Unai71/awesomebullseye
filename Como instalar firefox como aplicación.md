# Como instalar firefox como aplicación



1. Descargar el código fuente de [firefox](https://www.mozilla.org/es-ES/firefox/download/thanks/)

2. Descomprime el archivo `tar xjf firefox-*.tar.bz2`

3. Entra en la carpeta descomprimida `cd firefox-*` y copia la subcarpeta firefox a /usr/lib `mv firefox/ /usr/lib`

4. Crea una desktop entry de firefox en `/usr/share/applications/firefox.desktop`

   ```bash
   [Desktop Entry] 
   Name=Firefox  
   Comment=Browse The World Wide Web  
   GenericName=Web Browser
   X-GNOME-FullName=Firefox Web Browser
   Exec=/usr/lib/firefox/firefox
   Terminal=false
   X-MultipleArgs=false
   Type=Application
   Icon=firefox-esr
   Categories=Network;WebBrowser;
   MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
   StartupWMClass=Firefox    
   StartupNotify=true
   
   ```

5. modifica el comando firefox del terminal para que no abra firefox-esr en `/usr/bin/firefox`

   ```bash
   #!/bin/sh
   
   FIREFOX="$(which firefox)"
   [ -x "$FIREFOX.real" ] && exec "$FIREFOX.real" "$@"
   
   exec /usr/lib/firefox/firefox "$@"
   ```

   

