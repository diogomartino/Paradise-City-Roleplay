# Paradise City Roleplay
Paradise City Roleplay é um GameMode para o GTA San Andreas Multiplayer. Foi desenvolvido do zero por mim. Foi lançado na internet pela primeira vez dia **08/08/2016** no [Fórum Samp](http://forum.sa-mp.com/showthread.php?p=3749526#post3749526).


## Sobre o Gamemode
Gamemode organizado e optimizado. Tem alguns bugs e sistemas incompletos, não me lembro quais são pois já não mexo nisto há muito tempo. O gamemode está pronto a jogar, é só preciso configurar as casas, bizzes, factions, etc. O gamemode utiliza DOF2 para guardar os dados e utiliza SHA256 para encriptar as passwords. Notem que o melhor é usar um Salt diferente para cada conta, o que não acontece aqui (facilmente mudado).

Como não tinha nada para fazer, há uns tempos fiz alterações no código, alterei algumas coisas, refiz alguns sistemas, mas entretanto perdi o changelog, ou seja, já não me lembro que melhorias fiz nem que bugs corrigi. Mas que ficou melhor ficou :)

## Sistemas
* Casas dinâmicas
* Lojas dinâmicas
* Edifícios dinâmicos
* Factions dinâmicas
* Comandos de admin extensos
* 5 níveis de admin (Game Master, Administrador, Head Admin, Responsável e Scripter)
* Sistema de fabricar drogas e armas
* Sistema de pesca
* Sistema de caravanas
* Sistema de barcos habitáveis
* Todos os carros guardam os danos visuais
* Sistema de doenças
* Sistema de toxicodependência
* Sistema de economia
* Sistema de seguros
* Sistema de VIP automático por socket
* Sistema de análise da performance de algumas funções chave
* Sistema de ajuda à criação de rotas para os jobs
 
E tem mais, não me lembro de todos. Dinâmico quer dizer que 99% das características dão para alterar in-game e não é preciso andar a mexer no código.

## Outros
Aconselho a atualizar todas as includes e plugins que o servidor usa para uma melhor estabilidade. Aconselho também que quando ligarem pela primeira vez o servidor, desliguem e voltem a ligar. 

O AntiCheat é bom, mas quando configurado corretamente. Por default ele vai kickar muita gente inocente. 

Para utilizarem o comando **/dox** é necessário hospedar um ficheiro PHP que pode ser encontrado [aqui](http://forum.sa-mp.com/showthread.php?p=3713480).

Aconselho **vivamente** a diminuirem o **MAX_CARROS** para um valor baixo da primeira vez que entrarem no servidor, caso contrário irão crashar sempre que entrem no servidor. Depois, podem ir para uma parte do mapa não usada e usar o comando **/resetcarros**. Logo de seguida podem aumentar o **MAX_CARROS** para o valor desejado, ir ao mesmo sítio e fazer o **/resetcarros** para aparecerem todos os carros.

Aconselho também a utilizar o PAWN em *debug mode*, para qualquer crash ser mais facilmente lido pelo CrashDetect.

Sistema de pastas dentro dos **scriptfiles** (*scriptfiles/PCRP/(...)*):

![Pastas](https://i.gyazo.com/a329a2b58bc1294990256b472fd36798.png)

## Créditos
Eu - criação do gamemode

Incognito - Streamer Plugin

BlueG - Socket Plugin

Dan - TimerFix Plugin

Emmet_ - SSCANF Plugin

Zeex - CrashDetect Plugin & ZCMD Include

Samp Team - SAMP

OstGot - Nex-AC Include

Double-o-Seven - DOF2 Include

Lós - LosGS Include

Gammix - GMenus Include

Y-Less - Foreach Include

Westie - STRLib Include

Snowie - Mapping incluso no gamemode

klap - Sistema de tunning e outras funções úteis

## Licença
[MIT](https://opensource.org/licenses/MIT)

**Podem utilizar este código da maneira que quiserem, desde que deixem os créditos a todas as pessoas envolvidas neste projeto.**
