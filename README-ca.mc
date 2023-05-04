🌍
*[Čeština](README-cs.md) ∙ [Deutsch](README-de.md) ∙ [Ελληνικά](README-el.md) ∙ [English](README.md) ∙ [Español](README-es.md) ∙ [Français](README-fr.md) ∙ [Indonesia](README-id.md) ∙ [Italiano](README-it.md) ∙ [日本語](README-ja.md) ∙ [한국어](README-ko.md) ∙ [polski](README-pl.md) ∙ [Português](README-pt.md) ∙ [Română](README-ro.md) ∙ [Русский](README-ru.md) ∙ [Slovenščina](README-sl.md) ∙ [Українська](README-uk.md) ∙ [简体中文](README-zh.md) ∙ [繁體中文](README-zh-Hant.md)*

# L'art de la línia d'ordres

Nota: Tinc previst revisar-ho i buscar un nou coautor per ajudar a expandir-ho a una guia més completa. Tot i que és molt popular, podria ser més ample i una mica més profund. Si us agrada escriure i esteu a punt de ser un expert en aquest material i esteu disposat a considerar ajudar-vos, deixeu-me anar una nota a josh (0x40) holloway.com. –[jlevy](https://github.com/jlevy), [Holloway](https://www.holloway.com). Gràcies!*

- [Meta](#meta)
- [Basics](#basics)
- [Ús de cada dia](#everyday-use)
- [Processant fitxers i dades](#processing-files-and-data)
- [Depuració del sistema](#system-debugging)
- [Una línia](#una línia)
- [Obscura però útil](#obscure-but-useful)
- [només MacOS](#macos-only)
- [Només Windows](#windows-only)
- [Més recursos](#more-resources)
- [Disclaimer](#disclaimer)


![curl -s 'https://raw.githubusercontent.com/jlevy/the-art-of-command-line/master/README.md' ) egrep -o '`\w+`' tr -d '`' ) cowsay -W50](cowsay.png)

La fluïdesa a la línia de comandament és una habilitat sovint descuidada o considerada arcana, però millora la vostra flexibilitat i productivitat com a enginyer tant de manera òbvia com subtil. Aquesta és una selecció de notes i consells sobre l'ús de la línia d'ordres que hem trobat útil quan treballem en Linux. Algunes puntes són elementals, i algunes són força específiques, sofisticades o fosques. Aquesta pàgina no és llarga, però si podeu utilitzar i recordar tots els elements aquí, en sabeu molt.

Aquesta obra és el resultat de [molts autors i traductors](AUTHORS.md).
Alguns d'aquests
[originalment](http://www.quora.com/What-are-some-lesser-known-but-useful-Unix-commands)
[aparegut](http://www.quora.com/What-are-the-most-useful-Swiss-army-knife-one-liners-on-Unix)
a [Quora](http://www.quora.com/What-are-some-time-saving-tips-that-every-Linux-user-should-now),
Però des de llavors s'ha traslladat a GitHub, on la gent amb més talent que l'autor original ha fet nombroses millores.
[*Si us plau, envieu una pregunta*](https://airtable.com/shrzMhx00YiIVAWJg) si teniu una pregunta relacionada amb la línia d'ordres. [*Contribuïu**](/CONTRIBUTING.md) si veieu un error o quelcom que podria ser millor!

## Meta

Àmbit:

- Aquesta guia és per a principiants i usuaris experimentats. Els objectius són la brea* (tot el que és important), especificitat* (donar exemples concrets del cas més comú), i brevetat* (evitar coses que no siguin essencials o digressions que podeu cercar fàcilment en un altre lloc). Cada punta és essencial en alguna situació o estalvia temps significativament sobre alternatives.
- Això s'escriu per a Linux, amb l'excepció de les seccions «[macOS només](#macos-only)» i «[Windows només](#windows-only)». Molts dels altres articles s'apliquen o es poden instal·lar en altres Unices o macOS (o fins i tot Cygwin).
- El focus és en Bash interactiu, encara que molts consells s'apliquen a altres shells i a la creació general de scripts Bash.
- Inclou tant les ordres Unix "estàndard", com les que requereixen instal·lacions especials de paquets -- sempre que siguin prou importants com per merèixer la inclusió.

Notes:

- Per mantenir aquesta pàgina, el contingut s'inclou implícitament per referència. Ets prou llest per cercar més detalls en altres llocs un cop coneixes la idea o l'ordre a Google. Utilitzeu `apt`, `yum`, `dnf`, `pacman`, `pip` o `brew` (com correspongui) per a instal·lar programes nous.
- Utilitzeu [Explica](http://explainshell.com/) per a obtenir un desglossament útil de les ordres, opcions, canonades, etc., etc.


## Bàsics

- Apreneu el Bash bàsic. En realitat, escriviu `man bash` i almenys esquinça tot el que hi ha; és bastant fàcil de seguir i no tant de temps. Els intèrprets d'ordres alternatius poden ser bonics, però el Bash és potent i sempre està disponible (aprenent només* zsh, peix, etc., mentre tempten al vostre propi portàtil, us restringeix en moltes situacions, com ara utilitzar servidors existents).

- Apreneu bé almenys un editor basat en text. L'editor `nano` és un dels més senzills per a l'edició bàsica (obertura, edició, desament, cerca). No obstant això, per a l'usuari d'energia en un terminal de text, no hi ha cap substitut de Vim (`vi`), l'editor dur però venerable, ràpid i ple de funcions. Moltes persones també utilitzen els clàssics Emacs, especialment per a tasques d'edició més grans. (Per descomptat, qualsevol desenvolupador de programari modern que treballi en un projecte extensiu és poc probable que utilitzi només un editor de text pur i també hauria d'estar familiaritzat amb els ideals i eines gràfiques modernes.)

- Trobant documentació:
- Sabeu com llegir la documentació oficial amb `man` (per a l'inquisitiu, `man man` llista els números de secció, p. ex. 1 són ordres «regulars», 5 són fitxers/convencions i 8 són per a l'administració). Cerca les pàgines «man» amb «apropos».
- Sabeu que algunes ordres no són executables, sinó incorporades al Bash, i que podeu obtenir ajuda sobre elles amb `help` i `help -d`. Podeu esbrinar si una ordre és un executable, un intèrpret d'ordres integrat o un àlies utilitzant `type command`.
- `curl cheat.sh/command` donarà un breu «full de truc» amb exemples comuns de com utilitzar una ordre de l'intèrpret d'ordres.

- Apreneu sobre la redirecció de la sortida i l'entrada utilitzant ``.` i ``` i canonades usant ``.`. Coneix `.` sobreescriu el fitxer de sortida i `.` afegeix. Apreneu sobre stdout i stderr.

- Apreneu sobre l'expansió de la glob del fitxer amb les cometes `` (i potser `?` i `[`...`]`) i la citació i la diferència entre les cometes dobles `"` i simples `'`. (Vegeu més sobre l'expansió variable a continuació).

- Coneixeu-vos amb la gestió de tasques del Bash: `.`, *ctrl-z**, *ctrl-c**, `jobs`, `fg`, `bg`, `kill`, etc.

- Coneixeu `ssh`, i els fonaments de l'autenticació sense contrasenya, via `ssh-agent`, `ssh-add`, etc.

- Gestió bàsica de fitxers: `ls` i `ls -l` (en particular, apreneu què significa cada columna en `ls -l`), `less`, `head`, `tail` i `tail -f` (o fins i tot millor, `less +F`), `ln` i `ln -s` (apreneu les diferències i avantatges d'enllaços durs versus suaus), `chown`, `chmod`, `du` (per a un resum ràpid de l'ús del disc: `du -hs `). Per a la gestió del sistema de fitxers, `df`, `mount`, `fdisk`, `mkfs`, `lsblk`. Apreneu què és un node-i (`ls -i` o `df -i`).

- Gestió bàsica de la xarxa: `ip` o `ifconfig`, `dig`, `traceroute`, `route`.

- Apreneu i utilitzeu un sistema de gestió del control de versions, com `git`.

- Coneixeu bé les expressions regulars i les diverses etiquetes a `grep`/`egrep`. Val la pena conèixer les opcions `-i`, `-o`, `-v`, `-A`, `-B` i `-C`.

- Apreneu a utilitzar `apt-get`, `yum`, `dnf` o `pacman` (depenent de la distribució) per a trobar i instal·lar paquets. I assegureu-vos que teniu `pip` per a instal·lar eines de línia d'ordres basades en Python (a continuació, algunes són més fàcils d'instal·lar a través de `pip`).


## Ús diari

- Al Bash, utilitzeu *Tab** per a completar els arguments o llistar totes les ordres disponibles i *ctrl-r** per a cercar a través de l'historial d'ordres (després de prémer, escriviu per a cercar, premeu *ctrl-r** repetidament per a recórrer més coincidències, premeu *Enter** per a executar l'ordre trobada, o premeu la fletxa dreta per a posar el resultat a la línia actual per a permetre l'edició).

- En Bash, utilitzeu *ctrl-w** per a suprimir l'última paraula, i *ctrl-u** per a suprimir el contingut del cursor actual de nou al començament de la línia. Utilitzeu *alt-b** i *alt-f** per a moure per paraula, *ctrl-a** per a moure el cursor al començament de la línia, *ctrl-e** per a moure el cursor al final de la línia, *ctrl-k** per a matar fins al final de la línia, *ctrl-l** per a netejar la pantalla. Vegeu `man readline` per a tots els lligams de tecla predeterminats al Bash. Hi ha molt. Per exemple, *alt-.* passa pels arguments anteriors, i *alt-*** expandeix una glob.


- Alternativament, si us agraden els lligams de tecla a l'estil vi, utilitzeu `set -o vi` (i `set -o emacs` per a tornar-la a posar).

- Per a editar ordres llargues, després d'establir el vostre editor (per exemple `export EDITOR=vim`), *ctrl-x** *ctrl-e** obrirà l'ordre actual en un editor per a l'edició multilínia. O a l'estil del vi, *escape-v**.

- Per a veure les ordres recents, utilitzeu `history`. Seguiu amb `!n` (on `n` és el número d'ordre) per a tornar a executar. També hi ha moltes abreviatures que podeu utilitzar, la més útil probablement és `!$` per a l'últim argument i `!!` per a l'última ordre (vegeu «EXPANSIÓ HISTÒRICA» a la pàgina «man»). No obstant això, sovint se substitueixen fàcilment amb *ctrl-r** i *alt-.*.

- Aneu al vostre directori d'inici amb `cd`. Accediu als fitxers relatius al vostre directori personal amb el prefix `).` (p. ex. `)./.bashrc`). En els scripts `sh` es refereix al directori d'inici com a `$HOME`.

- Per a tornar al directori de treball anterior: `cd -`.

- Si esteu a mig camí escrivint una ordre però canvieu d'opinió, premeu *alt-#** per a afegir un `#` al començament i introduïu-lo com a comentari (o utilitzeu *ctrl-a**, *#**, *enter**). Després podreu tornar-hi més tard a través de l'historial de comandaments.

- Utilitzeu `xargs` (o `parallel`). És molt poderós. Nota, podreu controlar quants elements s'executaran per línia (`-L`) així com el paral·lelisme (`-P`). Si no esteu segur de si farà el correcte, utilitzeu `xargs echo` primer. A més, `-I{}` és útil. Exemples:
```bash
troba . -name '*.py' xargs grep some_function
cat hosts s xargs -I{} ssh root@{} hostname
```

- `pstree -p` és una visualització útil de l'arbre de processos.

- Utilitzeu `pgrep` i `pkill` per a trobar o enviar processos pel nom (`-f` és útil).

- Coneixeu els diferents senyals que podeu enviar processos. Per exemple, per a suspendre un procés, utilitzeu `kill -STOP [pid]`. Per a la llista completa, vegeu el senyal «man 7»

- Utilitzeu `nohup` o `disown` si voleu que un procés en segon pla continuï funcionant per sempre.

- Comproveu quins processos estan escoltant a través de `netstat -lntp` o `ss -plat` (per a TCP; afegiu `-u` per a UDP) o `lsof -iTCP -sTCP:LISTEN -P -n` (que també funciona a macOS).

- Vegeu també `lsof` i `fuser` per als sòcols i fitxers oberts.

- Vegeu `uptime` o `w` per a saber quant de temps ha estat funcionant el sistema.

- Useu `alias` per a crear dreceres per a les ordres utilitzades habitualment. Per exemple, `alias ll='ls -latr'` crea un nou àlies `ll`.

- Deseu els àlies, la configuració de l'intèrpret d'ordres i les funcions que utilitzeu habitualment a `)./.bashrc`, i [arranja perquè els intèrprets d'ordres d'inici de sessió siguin d'origen](http://superuser.com/a/183980/7106). Això farà que la vostra configuració estigui disponible en totes les sessions de l'intèrpret d'ordres.

- Poseu la configuració de les variables d'entorn, així com les ordres que s'han d'executar quan inicieu la sessió a `//.bash_profile`. Es necessitarà una configuració separada per als intèrprets d'ordres que inicieu des dels inicis de sessió d'entorn gràfic i les tasques `cron`.

- Sincronitzeu els vostres fitxers de configuració (p. ex. `.bashrc` i `.bash_profile`) entre diversos ordinadors amb el Git.

- Compreneu que cal tenir cura quan les variables i els noms de fitxer inclouen espais en blanc. Envolteu les variables Bash amb cometes, p. ex. `"$FOO"`. Prefereix les opcions `-0` o `-print0` per a habilitar els caràcters nuls per a delimitar els noms de fitxer, p. ex. `locate -0 patró , xargs -0 ls -al` o `find / -print0 -type d s xargs -0 ls -al`. Per a iterar en els noms de fitxer que contenen espais en blanc en un bucle for, establiu el vostre IFS per a ser una línia nova només usant `IFS=$'
'`.

- En els scripts de Bash, utilitzeu `set -x` (o la variant `set -v`, que registra l'entrada en brut, incloses les variables i comentaris no expandits) per a depurar la sortida. Utilitzeu els modes estrictes a menys que tingueu una bona raó per a no: utilitzeu `set -e` per a interrompre en cas d'errors (codi de sortida no zero). Utilitzeu `set -u` per a detectar els usos de variables no establerts. Considereu també `set -o pipefail`, per a interrompre els errors dins de les canonades (encara que llegiu-ne més si ho feu, ja que aquest tema és una mica subtil). Per a scripts més implicats, també utilitzeu `trap` en sortir o err. Un hàbit útil és iniciar un script com aquest, el qual farà que detecti i avorti els errors comuns i imprimeixi un missatge:
```bash
set -euo pipefail
trap «echo 'error: Script failed: see failed command above» err
```

- En els scripts de Bash, les subintèrprets (escrits amb parèntesis) són maneres convenients d'agrupar ordres. Un exemple comú és moure temporalment a un directori de treball diferent, p. ex. ```bash
# fes alguna cosa en el directori actual
(cd /algun/altres/dir ) altra ordre)
# continua en el directori original
```

- A Bash, cal tenir en compte que hi ha molts tipus d'expansió variable. Ja existeix una comprovació de variable: `${name:?error message}`. Per exemple, si un script de Bash requereix un únic argument, escriviu `input=file=${1:?usage: $0 input_file}`. Utilitzant un valor predeterminat si una variable està buida: `${name:-default}`. Si voleu afegir un paràmetre addicional (opcional) a l'exemple anterior, podeu utilitzar quelcom com `output_file=${2:-logfile}`. Si s'omet «$2» i per tant està buit, `output_file` s'establirà a `logfile`. Expansió aritmètica: `i=$(( (i + 1) % 5 ))`. Seqüències: `{1..10}`. S'estan retallant les cadenes: `${var%suffix}` i `${var#prefix}`. Per exemple, si `var=foo.pdf`, llavors `echo ${var%.pdf}.txt` imprimeix `foo.txt`.

- L'expansió de la clau utilitzant `{`...`}` pot reduir la necessitat de tornar a escriure text similar i automatitzar combinacions d'elements. Això és útil en exemples com `mv foo.{txt,pdf} some-dir` (que mou ambdós fitxers), `cp somefile{,.bak}` (que expandeix a `cp somefile somefile.bak`) o `mkdir -p test-{a,b,c}/subtest-{1,2,3}` (que expandeix totes les combinacions possibles i crea un arbre de directoris). L'expansió de la clau es realitza abans de qualsevol altra expansió.

- L'ordre de les expansions és: expansió de claus; expansió de la titlla, expansió de paràmetres i variables, expansió aritmètica, i substitució d'ordres (fet d'esquerra a dreta); divisió de paraules; i expansió del nom de fitxer. (Per exemple, un interval com `{1..20}` no es pot expressar amb variables utilitzant `{$a..$b}`. Utilitzeu `seq` o un bucle `for` en el seu lloc, p. ex., `seq $a $b` o `for((i=a; i==b; i++)); do ... ; done`.

- La sortida d'una ordre es pot tractar com un fitxer via `((alguna ordre)` (coneguda com a substitució de procés). Per exemple, compareu `/etc/hosts` locals amb un remot:
```sh
diff /etc/hosts )(ssh somehost cat /etc/hosts)
```

- Quan escriviu scripts, és possible que vulgueu posar tot el vostre codi en claus. Si falta la clau de tancament, s'impedirà que el vostre script s'executi a causa d'un error de sintaxi. Això té sentit quan es baixarà el vostre script des de la web, ja que evita que s'executin scripts baixats parcialment:
```bash
{
# El teu codi aquí
}
```

- Un "aquí document" permet la [redirecció de múltiples línies d'entrada](https://www.tldp.org/LDP/abs/html/here-docs.html) com si fos des d'un fitxer:
```
gat <<EOF
entrada
en múltiples línies
EOF
```

- En Bash, redirigeix tant la sortida estàndard com l'error estàndard a través de: `some-command ,logfile 2>&1` o `some-command `.logfile`. Sovint, per assegurar que una ordre no deixa una nansa de fitxer oberta a l'entrada estàndard, lligant-la al terminal en què esteu, també és una bona pràctica afegir `//dev/null`.

- Utilitzeu `man ascii` per a una bona taula ASCII, amb valors hexadecimals i decimals. Per a la informació general de codificació, `man unicode`, `man utf-8` i `man latin1` són útils.

- Utilitzeu `screen` o [`tmux`](https://tmux.github.io/) per a multiplexar la pantalla, especialment útil en les sessions ssh remotes i per a separar i tornar a adjuntar a una sessió. `byobu` pot millorar la pantalla o el tmux proporcionant més informació i una gestió més fàcil. Una alternativa més mínima per a la persistència de sessió només és [`dtach`](https://github.com/bogner/dtach).

- En el ssh, saber com portar el túnel amb `-L` o `-D` (i ocasionalment `-R`) és útil, p. ex., per accedir als llocs web des d'un servidor remot.

- Pot ser útil fer algunes optimitzacions a la vostra configuració ssh; per exemple, aquesta `//.ssh/config` conté les opcions per evitar connexions arrossegades en determinats entorns de xarxa, utilitza la compressió (el qual és útil amb connexions scp sobre connexions d'amplada de banda baixa), i els canals multiplex al mateix servidor amb un fitxer de control local:
```
TCPKeepAlive=yes
ServerAliveInterval=15
ServerAliveCountMax=6
Compressió=yes
ControlMaster automàtic
ControlPath /tmp/%r%%h:%p
ControlPersisteix sí
```

- Algunes altres opcions rellevants per a l'ssh són sensibles a la seguretat i s'han d'habilitar amb cura, p. ex. per subxarxa o amfitrió o en xarxes de confiança: `StrictHostKeyChecking=no`, `ForwardAgent=yes`

- Considereu [`mosh`](https://mosh.mit.edu/) una alternativa a ssh que utilitza UDP, evitant deixar anar connexions i afegint comoditat a la carretera (requereix la configuració del costat del servidor).

- Per a obtenir els permisos en un fitxer en forma octal, el qual és útil per a la configuració del sistema, però no està disponible en `ls` i és fàcil de confondre, utilitzeu quelcom com
```sh
stat -c «%A %a %n» /etc/timezone
```

- Per a la selecció interactiva dels valors des de la sortida d'una altra ordre, utilitzeu [`percol`](https://github.com/mooz/percol) o [`fzf`](https://github.com/junegunn/fzf).

- Per a la interacció amb els fitxers basats en la sortida d'una altra ordre (com `git`), utilitzeu `fpp` ([PathPicker](https://github.com/facebook/PathPicker)).

- Per a un servidor web senzill per a tots els fitxers del directori actual (i subdirectoris), disponible per a qualsevol persona de la vostra xarxa, utilitzeu:
`python -m SimpleHTTPServer 7777` (pel port 7777 i Python 2) i `python -m http.server 7777` (pel port 7777 i Python 3).

- Per a executar una ordre com un altre usuari, utilitzeu `sudo`. Per defecte s'executa com a root; utilitzeu `-u` per a especificar un altre usuari. Utilitzeu `-i` per a iniciar la sessió com a aquest usuari (se us demanarà la contrasenya ).your).).

- Per a canviar l'intèrpret d'ordres a un altre usuari, utilitzeu `su username` o `su - username`. Aquest últim amb "-" té un entorn com si un altre usuari acabés d'entrar. Ometre el nom d'usuari predeterminat a root. Se us demanarà la contrasenya .de l'usuari al qual canvieu_.

- Coneixeu el [límit 128K](https://wiki.debian.org/CommonErrorMessages/ArgumentListTooLong) a les línies d'ordres. Aquest error de «llista d'arguments massa llarg» és comú quan els comodins coincideixen amb un gran nombre de fitxers. (Quan això succeeix, poden ajudar alternatives com `find` i `xargs`.

- Per a una calculadora bàsica (i per descomptat accés a Python en general), utilitzeu l'intèrpret `python`. Per exemple,
```
2+3
5
```


## Processant fitxers i dades

- Per a cercar un fitxer pel nom en el directori actual, `cerca . -iname 'alguna cosa'` (o similar). Per a trobar un fitxer en qualsevol lloc per nom, utilitzeu `locate something` (però tingueu en compte que `updatedb` pot no haver indexat els fitxers creats recentment).

- Per a la cerca general a través dels fitxers d'origen o de dades, hi ha diverses opcions més avançades o més ràpides que `grep -r`, incloent-hi (en ordre des del més antic fins al més recent) [`ack`](https://github.com/beyondgrep/ack2), [`ag`](https://github.com/ggreer/the).silver_searcher) («el cercador de plata») i [`rg`](https://github.com/BurntSushi/ripgrep) (ripgrep).

- Per a convertir HTML a text: `lynx -dump -stdin`

- Per a Markdown, HTML i tot tipus de conversió de documents, proveu [`pandoc`](http://pandoc.org/). Per exemple, per a convertir un document Markdown al format Word: `pandoc README.md --from markdown --to docx -o temp.docx`

- Si heu de gestionar XML, `xmlstarlet` és antic però bo.

- Per al JSON, utilitzeu [`jq`](http://stedolan.github.io/jq/). Per a un ús interactiu, vegeu també [`jid`](https://github.com/simeji/jid) i [`jiq`](https://github.com/fiatjaf/jiq).

- Per al YAML, utilitzeu [`shyaml`](https://github.com/0k/shyaml).

- Per a fitxers Excel o CSV, el [csvkit](https://github.com/onyxfish/csvkit) proporciona `in2csv`, `csvcut`, `csvjoin`, `csvgrep`, etc.

- Per a Amazon S3, [`s3cmd`](https://github.com/s3tools/s3cmd) és convenient i [`s4cmd`](https://github.com/bloomreach/s4cmd) és més ràpid. Els [`aws` d'Amazon](https://github.com/aws/aws-cli) i els [`saws` millorats](https://github.com/donnemartin/saws) són essencials per a altres tasques relacionades amb l'AWS.

- Coneixeu les opcions `sort` i `uniq`, incloses les opcions `-u` i `-d` de l'uniq -- vegeu els línies a continuació. Vegeu també `comm`.

- Coneixeu `cut`, `paste` i `join` per a manipular els fitxers de text. Moltes persones utilitzen `cut`, però obliden de `join`.

- Coneixeu `wc` per a comptar les línies noves (`-l`), caràcters (`-m`), paraules (`-w`) i bytes (`-c`).

- Coneixeu `tee` per a copiar des de l'entrada estàndard a un fitxer i també a la sortida estàndard, com a `ls -al | tee file.txt`.

- Per a càlculs més complexos, incloent agrupacions, camps d'inversió i càlculs estadístics, considereu [`datamash`](https://www.gnu.org/software/datamash/).

- Saber que la configuració regional afecta moltes eines de la línia d'ordres de maneres subtils, incloent l'ordre d'ordenació (col·lecció) i el rendiment. La majoria de les instal·lacions de Linux establiran `LANG` o altres variables locals a una configuració local com l'anglès dels EUA. Però sigueu conscients que la classificació canviarà si canvieu la configuració local. I coneixeu les rutines de l'i18n que poden fer que l'ordenació o altres ordres executin molts temps* més lent. En algunes situacions (com les operacions de conjunt o l'operet d'unicitat
